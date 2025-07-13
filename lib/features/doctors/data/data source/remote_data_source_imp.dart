import 'package:app/core/utlis/api_service.dart';
import 'package:app/features/doctors/data/data%20source/remote_data_source.dart';
import 'package:app/features/doctors/domain/entity/doctor_entity.dart';
import 'package:dio/dio.dart';

class RemoteDataSourceImpDoctors implements RemoteDataSource {
  ApiService apiService;
  RemoteDataSourceImpDoctors(this.apiService);

  @override
  Future<List<DoctorModel>> getDoctors() async {
    Response response = await apiService.getMethod(
      endPoint: '/api/users/by-role',
      queryParams: {
        'role': "doctor",
      },
    );

    final data = response.data['data'] as List;
    print("---------${data}");

    return data.map((json) => DoctorModel.fromJson(json)).toList();
  }
}
