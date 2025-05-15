import streamlit as st
import pandas as pd
import joblib
import base64
import datetime

# إعداد الصفحة
st.set_page_config(page_title="كشف التوحد", layout="centered")
st.markdown("""
<style>
    .stApp {
        direction: RTL;
        text-align: right;
        font-family: 'Cairo', sans-serif;
    }
</style>
""", unsafe_allow_html=True)

# تحميل الموديلات
try:
    lr_model = joblib.load("logistic_model.pkl")
    rf_model = joblib.load("autism_detector_model.pkl")
    gnb_model = joblib.load("naive_bayes_model.pkl")
except FileNotFoundError as e:
    st.error(f"خطأ: ملف {e.filename} غير موجود.")
    st.stop()

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
    behavioral_questions[1],  # هل يبدي الطفل اهتمامًا...
    behavioral_questions[3],  # هل يستمتع الطفل بلعبة الغميضة...
    behavioral_questions[4]   # هل يمارس الطفل اللعب التخيلي...
]
physical_activity = [
    behavioral_questions[0],  # هل يستمتع الطفل بالتأرجح...
    behavioral_questions[2]   # هل يحب الطفل التسلق...
]
communication_engagement = behavioral_questions[5:]  # الإشارة لطلب، الإشارة للاهتمام، اللعب بالألعاب، إظهار الأشياء، التواصل البصري

# خيارات الإدخال
gender_options = ['اختر...', 'أنثى', 'ذكر']
ethnicity_options = ['اختر...', *sorted(['آسيوي', 'أفريقي', 'أوروبي', 'تركي', 'جزر المحيط الهادئ', 'جنوب آسيوي', 'عربي', 'غير معروف', 'لاتيني'])]
residence_options = ['اختر...', *sorted(['أستراليا', 'أفغانستان', 'أوروبا', 'إيطاليا', 'الأردن', 'الأرجنتين', 'الإمارات العربية المتحدة', 'البحرين', 'البرازيل', 'السويد', 'الصين', 'العراق', 'الكويت', 'المكسيك', 'المملكة العربية السعودية', 'المملكة المتحدة', 'النمسا', 'اليابان', 'باكستان', 'بنغلاديش', 'بوتان', 'تركيا', 'جزر الولايات المتحدة النائية', 'جزيرة مان', 'جورجيا', 'روسيا', 'رومانيا', 'سوريا', 'جنوب إفريقيا', 'غانا', 'قطر', 'كندا', 'كوريا الجنوبية', 'كوستاريكا', 'لاتفيا', 'لبنان', 'ليبيا', 'مالطا', 'ماليزيا', 'مصر', 'نيبال', 'نيوزيلندا', 'هولندا', 'الولايات المتحدة', 'عمان', 'الفلبين'])]
relation_options = ['اختر...', *sorted(['أخصائي رعاية صحية', 'ذاتي', 'قريب', 'غير معروف', 'والد/والدة'])]

st.title("🧠 أداة كشف اضطراب طيف التوحد")

user_inputs = {}
with st.form("autism_form"):
    st.subheader("📝 المعلومات الأساسية")
    user_inputs['الاسم'] = st.text_input("اسم الطفل", placeholder="أدخل اسم الطفل")
    user_inputs['العمر'] = st.number_input("العمر (بالسنوات)", min_value=1, step=1, value=None, placeholder="أدخل عمر الطفل")
    user_inputs['العلاقة'] = st.selectbox("العلاقة", relation_options, index=None, placeholder="اختر العلاقة")

    st.subheader("👫 التفاعل الاجتماعي واللعب")
    for q in social_play:
        user_inputs[q] = st.radio(q, ['نعم', 'لا'], index=None, key=q)

    st.subheader("🤸‍♂️ النشاط الجسدي")
    for q in physical_activity:
        user_inputs[q] = st.radio(q, ['نعم', 'لا'], index=None, key=q)

    st.subheader("🗣️ التواصل والانخراط")
    for q in communication_engagement:
        user_inputs[q] = st.radio(q, ['نعم', 'لا'], index=None, key=q)

    st.subheader("📋 معلومات إضافية")
    user_inputs['الجنس'] = st.selectbox("الجنس", gender_options, index=None, placeholder="اختر الجنس")
    user_inputs['العرق / الأصل الجغرافي'] = st.selectbox("العرق / الأصل الجغرافي", ethnicity_options, index=None, placeholder="اختر العرق / الأصل الجغرافي")
    user_inputs['هل عانى من الصفراء عند الولادة'] = st.radio("هل عانى من الصفراء عند الولادة", ['نعم', 'لا'], index=None, key='صفراء')
    user_inputs['هل يوجد تاريخ عائلي مع التوحد'] = st.radio("هل يوجد تاريخ عائلي مع التوحد", ['نعم', 'لا'], index=None, key='تاريخ')
    user_inputs['بلد الإقامة'] = st.selectbox("بلد الإقامة", residence_options, index=None, placeholder="اختر بلد الإقامة")
    user_inputs['هل تم استخدام التطبيق من قبل'] = st.radio("هل تم استخدام التطبيق من قبل", ['نعم', 'لا'], index=None, key='تطبيق')

    submitted = st.form_submit_button("🔍 توقع")

if submitted:
    # التحقق من الإدخالات
    missing_fields = []
    for q in behavioral_questions + ['هل عانى من الصفراء عند الولادة', 'هل يوجد تاريخ عائلي مع التوحد', 'هل تم استخدام التطبيق من قبل']:
        if user_inputs.get(q) not in ['نعم', 'لا']:
            missing_fields.append(q)
    for field in ['الجنس', 'العرق / الأصل الجغرافي', 'بلد الإقامة', 'العلاقة']:
        if user_inputs.get(field) in [None, 'اختر...']:
            missing_fields.append(field)
    if not user_inputs.get('الاسم'):
        missing_fields.append('الاسم')
    if user_inputs.get('العمر') is None:
        missing_fields.append('العمر')

    if missing_fields:
        st.error(f"يرجى ملء جميع الحقول التالية: {', '.join(missing_fields)}")
    else:
        # تحقق إضافي للتأكد من وجود كل الأسئلة في user_inputs
        for q in behavioral_questions:
            if q not in user_inputs or user_inputs[q] not in ['نعم', 'لا']:
                st.error(f"خطأ: إجابة السؤال '{q}' غير موجودة أو غير صحيحة.")
                st.stop()

        # تحضير الإدخال
        binary_map = {'نعم': 1, 'لا': 0}
        input_data = {q: binary_map[user_inputs[q]] for q in behavioral_questions}
        input_data['العمر'] = user_inputs['العمر']
        input_data['الجنس'] = gender_options.index(user_inputs['الجنس']) - 1
        input_data['العرق / الأصل الجغرافي'] = ethnicity_options.index(user_inputs['العرق / الأصل الجغرافي']) - 1
        input_data['هل عانى من الصفراء عند الولادة'] = 0  # إلغاء تأثير
        input_data['هل يوجد تاريخ عائلي مع التوحد'] = 0   # إلغاء تأثير
        input_data['هل تم استخدام التطبيق من قبل'] = 0    # إلغاء تأثير
        input_data['بلد الإقامة'] = residence_options.index(user_inputs['بلد الإقامة']) - 1
        input_data['العلاقة'] = relation_options.index(user_inputs['العلاقة']) - 1
        input_data['المجموع'] = sum(input_data[q] for q in behavioral_questions)

        # إنشاء DataFrame
        df_input = pd.DataFrame([input_data])

        # التأكد من مطابقة الأعمدة
        expected_columns = lr_model.feature_names_in_
        if not all(col in df_input.columns for col in expected_columns) or not all(col in expected_columns for col in df_input.columns):
            missing_cols = [col for col in expected_columns if col not in df_input.columns]
            extra_cols = [col for col in df_input.columns if col not in expected_columns]
            st.error(f"خطأ في الأعمدة: \n- الأعمدة الناقصة: {missing_cols}\n- الأعمدة الزيادة: {extra_cols}")
            st.stop()

        # ترتيب الأعمدة حسب النموذج
        df_input = df_input[expected_columns]

        # التوقع
        prob_lr = lr_model.predict_proba(df_input)[0][1]
        prob_rf = rf_model.predict_proba(df_input)[0][1]
        prob_gnb = gnb_model.predict_proba(df_input)[0][1]
        final_prob = 0.05 * prob_lr + 0.90 * prob_rf + 0.05 * prob_gnb
        # ضبط النسبة الكلية
        if all(user_inputs[q] == autism_answers[q] for q in behavioral_questions):
            final_prob = min(0.98 + (final_prob * 0.02), 1.0)
        final_pred = 1 if final_prob > 0.5 else 0

        st.subheader("📊 النتيجة")
        if final_pred:
            st.error(f"⚠️ يوجد احتمال للإصابة بالتوحد بنسبة {final_prob*100:.2f}%")
        else:
            st.success(f"✅ لا يوجد احتمال واضح للتوحد، النسبة {final_prob*100:.2f}%")

        # حساب النسب بناءً على إجابات التوحد مع الأوزان
        try:
            social_score = sum(weights[q] for q in social_play if user_inputs[q] == autism_answers[q])
            social_total_weight = sum(weights[q] for q in social_play)
            physical_score = sum(weights[q] for q in physical_activity if user_inputs[q] == autism_answers[q])
            physical_total_weight = sum(weights[q] for q in physical_activity)
            comm_score = sum(weights[q] for q in communication_engagement if user_inputs[q] == autism_answers[q])
            comm_total_weight = sum(weights[q] for q in communication_engagement)
        except KeyError as e:
            st.error(f"خطأ: السؤال '{e}' غير موجود في الأوزان أو إجابات التوحد.")
            st.stop()

        # حساب النسب المئوية بناءً على توزيع final_prob
        total_score = social_score + physical_score + comm_score
        if total_score > 0:
            social_percentage = (social_score / total_score) * (final_prob * 100)
            physical_percentage = (physical_score / total_score) * (final_prob * 100)
            comm_percentage = (comm_score / total_score) * (final_prob * 100)
            # ضبط النسب لضمان المجموع يساوي final_prob * 100
            total_percentage = social_percentage + physical_percentage + comm_percentage
            if total_percentage != final_prob * 100:
                diff = (final_prob * 100) - total_percentage
                # إضافة الفرق إلى أكبر نسبة
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

        # عرض النسَب في الواجهة
        st.markdown(f"👫 التفاعل الاجتماعي واللعب: {social_percentage:.2f}% ({social_score:.1f} من {social_total_weight:.1f} درجة)")
        st.markdown(f"🤸‍♂️ النشاط الجسدي: {physical_percentage:.2f}% ({physical_score:.1f} من {physical_total_weight:.1f} درجة)")
        st.markdown(f"🗣️ التواصل والانخراط: {comm_percentage:.2f}% ({comm_score:.1f} من {comm_total_weight:.1f} درجة)")

        # إنشاء قوائم الأسئلة وإجاباتها لكل سكشن
        social_answers = "\n".join([f"- {q}: {user_inputs[q]}" for q in social_play])
        physical_answers = "\n".join([f"- {q}: {user_inputs[q]}" for q in physical_activity])
        comm_answers = "\n".join([f"- {q}: {user_inputs[q]}" for q in communication_engagement])

        # إنشاء التقرير مع توضيح
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
        b64 = base64.b64encode(report.encode()).decode()
        href = f'<a href="data:text/plain;base64,{b64}" download="autism_report.txt">📥 تحميل التقرير</a>'
        st.markdown(href, unsafe_allow_html=True)

# الشريط الجانبي
st.sidebar.markdown("""
### ℹ️ دليل إرشادي
لمعرفة المزيد عن التوحد وطرق التعامل مع الطفل، زر الموقع:
[منظمة التوحد العالمية](https://www.autismspeaks.org)
""")

st.markdown("---")
st.markdown("© 2025 أداة كشف التوحد")
st.markdown("تطوير: [أحمد عثمان]")