import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/domain/repos/result_repo.dart';
import 'package:app/features/questions/presentation/manager/result_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultCubit extends Cubit<ResultStates> {
  ResultCubit(this.resultRepo) : super(ResultInitialState());
  ResultRepo resultRepo;
  Future<void> getResult({required QsEntity qs}) async {
    emit(ResultLoadingState());
    var result = await resultRepo.getResult(qsEntity: qs);
    result.fold((failure) {
      emit(ResultFailureState(failure.errorMessage));
    }, (resultEntity) {
      emit(ResultSuccessState(resultEntity));
    });
  }
}
