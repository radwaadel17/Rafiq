import 'package:app/core/utlis/api_service.dart';
import 'package:app/features/questions/data/data%20sources/remote_data_source.dart';
import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/domain/entity/result_entity.dart';
import 'package:dio/dio.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  ApiService apiService;
  RemoteDataSourceImp(this.apiService);
  @override
  Future<ResultEntity> getResult({required QsEntity qsEntity}) async {
    Response response = await apiService.postMethodQs(
        url: 'http://127.0.0.1:5000/predict',
        userData: {
          "inputs": {
            "الاسم": qsEntity.name,
            "العمر": qsEntity.age,
            "العلاقة": qsEntity.relation,
            "هل يستمتع الطفل بالتأرجح أو التقافز (مثل على الأرجوحة أو عند حمله)؟":
                qsEntity.qs1 == true ? "نعم" : "لا",
            "هل يبدي الطفل اهتمامًا بالأطفال الآخرين (مثل اللعب معهم أو مشاهدتهم)؟":
                qsEntity.qs2 == true ? "نعم" : "لا",
            "هل يحب الطفل التسلق على الأشياء (مثل السلالم أو الأثاث)؟":
                qsEntity.qs3 == true ? "نعم" : "لا",
            "هل يستمتع الطفل بلعبة الغميضة أو الكشف (مثل إخفاء الوجه والظهور)؟":
                qsEntity.qs4 == true ? "نعم" : "لا",
            "هل يمارس الطفل اللعب التخيلي (مثل التظاهر باستخدام الهاتف أو الدمى)؟":
                qsEntity.qs5 == true ? "نعم" : "لا",
            "هل يشير الطفل بإصبع السبابة لطلب شيء (مثل لعبة أو طعام)؟":
                qsEntity.qs6 == true ? "نعم" : "لا",
            "هل يشير الطفل بإصبع السبابة لإظهار الاهتمام (مثل الإشارة إلى طائر)؟":
                qsEntity.qs7 == true ? "نعم" : "لا",
            "هل يلعب الطفل بشكل صحيح مع الألعاب الصغيرة (مثل تركيب المكعبات)؟":
                qsEntity.qs8 == true ? "نعم" : "لا",
            "هل يحضر الطفل أشياء ليظهرها لك (مثل لعبة أو كتاب)؟":
                qsEntity.qs9 == true ? "نعم" : "لا",
            "هل يحافظ الطفل على التواصل البصري معك لأكثر من ثانية في كل مرة؟":
                qsEntity.qs10 == true ? "نعم" : "لا",
            "الجنس": qsEntity.gender,
            "العرق / الأصل الجغرافي": qsEntity.ethnicity,
            "هل عانى من الصفراء عند الولادة":
                qsEntity.disease == true ? "نعم" : "لا",
            "هل يوجد تاريخ عائلي مع التوحد":
                qsEntity.haveHisory == true ? "نعم" : "لا",
            "بلد الإقامة": qsEntity.residence,
            "هل تم استخدام التطبيق من قبل":
                qsEntity.userApp == true ? "نعم" : "لا",
          }
        },
        isFormData: false);
    Map<String, dynamic> responeData = response.data;
    ResultEntity resultEntity = ResultEntity.fromJson(responeData);
    return resultEntity;
  }
}
