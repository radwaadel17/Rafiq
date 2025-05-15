import 'package:app/features/questions/domain/entity/result_entity.dart';

class ResultStates {}

class ResultInitialState extends ResultStates {}

class ResultLoadingState extends ResultStates {}

class ResultSuccessState extends ResultStates {
  final ResultEntity resultEntity;
  ResultSuccessState(this.resultEntity);
}

class ResultFailureState extends ResultStates {
  final String errorMsg;
  ResultFailureState(this.errorMsg);
}
