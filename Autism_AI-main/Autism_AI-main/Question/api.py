from flask import Flask, request, jsonify, send_file
import pandas as pd
import joblib
import datetime
import os
import uuid
import tempfile

app = Flask(__name__)

# تحميل الموديلات
try:
    lr_model = joblib.load("logistic_model.pkl")
    rf_model = joblib.load("autism_detector_model.pkl")
    gnb_model = joblib.load("naive_bayes_model.pkl")
except FileNotFoundError as e:
    app.logger.error(f"خطأ: ملف {e.filename} غير موجود.")
    raise

# الأسئلة
behavioral_questions = [
    'هل يستمتع الطفل بالتأرجح أو التقافز (مثل على الأرجوحة أو عند حمله)؟',
    'هل يبدي الطفل اهتمامًا بالأطفال الآخرين (مثل اللعب معهم أو مشاهدتهم)؟',
    'هل يحب الطفل التسلق على الأشياء (مثل السلالم أو الأثاث)؟',
    'هل يستمتع الطفل بلعبة الغميضة أو الكشف (مثل إخفاء الوجه والظهور)؟',
    'هل يمارس الطفل اللعب التخيلي (مثل التظاهر باستخدام الهاتف أو الدمى)؟',
    'هل يشير الطفل بإصبع السبابة لطلب شيء (مثل لعبة أو طعام)؟',
    'هل يشير الطفل بإصبع السبابة لإظهار الاهتمام (مثل الإشارة إلى طائر)؟',
    'هل يلعب الطفل بشكل صحيح مع الألعاب الصغيرة (مثل تركيب المكعبات)؟',
    'هل يحضر الطفل أشياء ليظهرها لك (مثل لعبة أو كتاب)؟',
    'هل يحافظ الطفل على التواصل البصري معك لأكثر من ثانية في كل مرة؟'
]

# إجابات التوحد
autism_answers = {
    'هل يستمتع الطفل بالتأرجح أو التقافز (مثل على الأرجوحة أو عند حمله)؟': 'نعم',
    'هل يبدي الطفل اهتمامًا بالأطفال الآخرين (مثل اللعب معهم أو مشاهدتهم)؟': 'لا',
    'هل يحب الطفل التسلق على الأشياء (مثل السلالم أو الأثاث)؟': 'نعم',
    'هل يستمتع الطفل بلعبة الغميضة أو الكشف (مثل إخفاء الوجه والظهور)؟': 'لا',
    'هل يمارس الطفل اللعب التخيلي (مثل التظاهر باستخدام الهاتف أو الدمى)؟': 'لا',
    'هل يشير الطفل بإصبع السبابة لطلب شيء (مثل لعبة أو طعام)؟': 'لا',
    'هل يشير الطفل بإصبع السبابة لإظهار الاهتمام (مثل الإشارة إلى طائر)؟': 'لا',
    'هل يلعب الطفل بشكل صحيح مع الألعاب الصغيرة (مثل تركيب المكعبات)؟': 'لا',
    'هل يحضر الطفل أشياء ليظهرها لك (مثل لعبة أو كتاب)؟': 'لا',
    'هل يحافظ الطفل على التواصل البصري معك لأكثر من ثانية في كل مرة؟': 'لا'
}

# أوزان الأسئلة
weights = {
    'هل يستمتع الطفل بالتأرجح أو التقافز (مثل على الأرجوحة أو عند حمله)؟': 0.91,
    'هل يبدي الطفل اهتمامًا بالأطفال الآخرين (مثل اللعب معهم أو مشاهدتهم)؟': 0.91,
    'هل يحب الطفل التسلق على الأشياء (مثل السلالم أو الأثاث)؟': 0.91,
    'هل يستمتع الطفل بلعبة الغميضة أو الكشف (مثل إخفاء الوجه والظهور)؟': 1.36,
    'هل يمارس الطفل اللعب التخيلي (مثل التظاهر باستخدام الهاتف أو الدمى)؟': 0.91,
    'هل يشير الطفل بإصبع السبابة لطلب شيء (مثل لعبة أو طعام)؟': 0.91,
    'هل يشير الطفل بإصبع السبابة لإظهار الاهتمام (مثل الإشارة إلى طائر)؟': 0.91,
    'هل يلعب الطفل بشكل صحيح مع الألعاب الصغيرة (مثل تركيب المكعبات)؟': 0.91,
    'هل يحضر الطفل أشياء ليظهرها لك (مثل لعبة أو كتاب)؟': 0.91,
    'هل يحافظ الطفل على التواصل البصري معك لأكثر من ثانية في كل مرة؟': 1.36,
    'هل عانى من الصفراء عند الولادة': 0.01,
    'هل يوجد تاريخ عائلي مع التوحد': 0.01,
    'هل تم استخدام التطبيق من قبل': 0.01
}

# تقسيم الأسئلة
social_play = [
    behavioral_questions[1],
    behavioral_questions[3],
    behavioral_questions[4]
]
physical_activity = [
    behavioral_questions[0],
    behavioral_questions[2]
]
communication_engagement = behavioral_questions[5:]

# خيارات الإدخال
gender_options = ['اختر...', 'أنثى', 'ذكر']
ethnicity_options = ['اختر...', *sorted(['آسيوي', 'أفريقي', 'أوروبي', 'تركي', 'جزر المحيط الهادئ', 'جنوب آسيوي', 'عربي', 'غير معروف', 'لاتيني'])]
residence_options = ['اختر...', *sorted(['أستراليا', 'أفغانستان', 'أوروبا', 'إيطاليا', 'الأردن', 'الأرجنتين', 'الإمارات العربية المتحدة', 'البحرين', 'البرازيل', 'السويد', 'الصين', 'العراق', 'الكويت', 'المكسيك', 'المملكة العربية السعودية', 'المملكة المتحدة', 'النمسا', 'اليابان', 'باكستان', 'بنغلاديش', 'بوتان', 'تركيا', 'جزر الولايات المتحدة النائية', 'جزيرة مان', 'جورجيا', 'روسيا', 'رومانيا', 'سوريا', 'جنوب إفريقيا', 'غانا', 'قطر', 'كندا', 'كوريا الجنوبية', 'كوستاريكا', 'لاتفيا', 'لبنان', 'ليبيا', 'مالطا', 'ماليزيا', 'مصر', 'نيبال', 'نيوزيلندا', 'هولندا', 'الولايات المتحدة', 'عمان', 'الفلبين'])]
relation_options = ['اختر...', *sorted(['أخصائي رعاية صحية', 'ذاتي', 'قريب', 'غير معروف', 'والد/والدة'])]

# تخزين التقارير المؤقتة
report_files = {}

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()
        user_inputs = data.get('inputs', {})

        # التحقق من الإدخالات
        missing_fields = []
        for q in behavioral_questions + ['هل عانى من الصفراء عند الولادة', 'هل يوجد تاريخ عائلي مع التوحد', 'هل تم استخدام التطبيق من قبل']:
            if user_inputs.get(q) not in ['نعم', 'لا']:
                missing_fields.append(q)
        for field in ['الجنس', 'العرق / الأصل الجغرافي', 'بلد الإقامة', 'العلاقة', 'الاسم', 'العمر']:
            if not user_inputs.get(field):
                missing_fields.append(field)

        if missing_fields:
            return jsonify({'error': f"يرجى ملء جميع الحقول التالية: {', '.join(missing_fields)}"}), 400

        # تحضير الإدخال
        binary_map = {'نعم': 1, 'لا': 0}
        input_data = {q: binary_map[user_inputs[q]] for q in behavioral_questions}
        input_data['العمر'] = user_inputs['العمر']
        input_data['الجنس'] = gender_options.index(user_inputs['الجنس']) - 1
        input_data['العرق / الأصل الجغرافي'] = ethnicity_options.index(user_inputs['العرق / الأصل الجغرافي']) - 1
        input_data['هل عانى من الصفراء عند الولادة'] = 0
        input_data['هل يوجد تاريخ عائلي مع التوحد'] = 0
        input_data['هل تم استخدام التطبيق من قبل'] = 0
        input_data['بلد الإقامة'] = residence_options.index(user_inputs['بلد الإقامة']) - 1
        input_data['العلاقة'] = relation_options.index(user_inputs['العلاقة']) - 1
        input_data['المجموع'] = sum(input_data[q] for q in behavioral_questions)

        # إنشاء DataFrame
        df_input = pd.DataFrame([input_data])
        expected_columns = lr_model.feature_names_in_
        df_input = df_input[expected_columns]

        # التوقع
        prob_lr = lr_model.predict_proba(df_input)[0][1]
        prob_rf = rf_model.predict_proba(df_input)[0][1]
        prob_gnb = gnb_model.predict_proba(df_input)[0][1]
        final_prob = 0.05 * prob_lr + 0.90 * prob_rf + 0.05 * prob_gnb

        if all(user_inputs[q] == autism_answers[q] for q in behavioral_questions):
            final_prob = min(0.98 + (final_prob * 0.02), 1.0)
        final_pred = 1 if final_prob > 0.5 else 0

        # حساب النسب بناءً على إجابات التوحد مع الأوزان
        social_score = sum(weights[q] for q in social_play if user_inputs[q] == autism_answers[q])
        social_total_weight = sum(weights[q] for q in social_play)
        physical_score = sum(weights[q] for q in physical_activity if user_inputs[q] == autism_answers[q])
        physical_total_weight = sum(weights[q] for q in physical_activity)
        comm_score = sum(weights[q] for q in communication_engagement if user_inputs[q] == autism_answers[q])
        comm_total_weight = sum(weights[q] for q in communication_engagement)

        total_score = social_score + physical_score + comm_score
        if total_score > 0:
            social_percentage = (social_score / total_score) * (final_prob * 100)
            physical_percentage = (physical_score / total_score) * (final_prob * 100)
            comm_percentage = (comm_score / total_score) * (final_prob * 100)
            total_percentage = social_percentage + physical_percentage + comm_percentage
            if total_percentage != final_prob * 100:
                diff = (final_prob * 100) - total_percentage
                if comm_percentage >= social_percentage and comm_percentage >= physical_percentage:
                    comm_percentage += diff
                elif social_percentage >= physical_percentage:
                    social_percentage += diff
                else:
                    physical_percentage += diff
        else:
            social_percentage = 0.0
            physical_percentage = 0.0
            comm_percentage = 0.0

        # إنشاء التقرير
        social_answers = "\n".join([f"- {q}: {user_inputs[q]}" for q in social_play])
        physical_answers = "\n".join([f"- {q}: {user_inputs[q]}" for q in physical_activity])
        comm_answers = "\n".join([f"- {q}: {user_inputs[q]}" for q in communication_engagement])

        report = f"""
تقرير كشف التوحد
------------------------
التاريخ: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
الاسم: {user_inputs['الاسم']}
العمر: {user_inputs['العمر']}
العلاقة: {user_inputs['العلاقة']}

النتيجة: {'إيجابي' if final_pred else 'سلبي'}
نسبة الاحتمال: {final_prob*100:.2f}%

=== تحليل السلوكيات ===
تعكس النسب التالية مساهمة كل قسم من السلوكيات المرتبطة باضطراب طيف التوحد في النسبة الإجمالية للاحتمال، بناءً على الإجابات التي تتطابق مع السلوكيات المرتبطة بالتوحد. تم توزيع النسبة الإجمالية ({final_prob*100:.2f}%) على الأقسام بناءً على درجاتها النسبية.

👫 التفاعل الاجتماعي واللعب: {social_percentage:.2f}% ({social_score:.1f} من {social_total_weight:.1f} درجة)
{social_answers}

🤸‍♂️ النشاط الجسدي: {physical_percentage:.2f}% ({physical_score:.1f} من {physical_total_weight:.1f} درجة)
{physical_answers}

🗣️ التواصل والانخراط: {comm_percentage:.2f}% ({comm_score:.1f} من {comm_total_weight:.1f} درجة)
{comm_answers}

---
"""

        # حفظ التقرير كملف مؤقت
        report_id = str(uuid.uuid4())
        temp_dir = tempfile.gettempdir()
        report_path = os.path.join(temp_dir, f"autism_report_{report_id}.txt")
        with open(report_path, 'w', encoding='utf-8') as f:
            f.write(report)

        # تخزين مسار الملف للتحميل لاحقًا
        report_files[report_id] = report_path

        # إرجاع النتيجة مع معرف التقرير
        return jsonify({
            'prediction': 'إيجابي' if final_pred else 'سلبي',
            'probability': final_prob * 100,
            'social_percentage': social_percentage,
            'physical_percentage': physical_percentage,
            'comm_percentage': comm_percentage,
            'social_score': social_score,
            'social_total_weight': social_total_weight,
            'physical_score': physical_score,
            'physical_total_weight': physical_total_weight,
            'comm_score': comm_score,
            'comm_total_weight': comm_total_weight,
            'report_id': report_id
        })

    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/download_report/<report_id>', methods=['GET'])
def download_report(report_id):
    try:
        report_path = report_files.get(report_id)
        if not report_path or not os.path.exists(report_path):
            return jsonify({'error': 'التقرير غير موجود أو تم حذفه'}), 404

        # إرسال الملف
        return send_file(
            report_path,
            as_attachment=True,
            download_name='autism_report.txt',
            mimetype='text/plain'
        )
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        # حذف الملف المؤقت بعد التحميل
        if report_path and os.path.exists(report_path):
            try:
                os.remove(report_path)
                report_files.pop(report_id, None)
            except:
                pass

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)