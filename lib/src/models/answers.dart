import 'package:freezed_annotation/freezed_annotation.dart';
part 'answers.freezed.dart';

///this class represents the answer option (yes / no) to all the questions that can be asked to pinpoint the best provider type for your use case
@freezed
class Answers with _$Answers {
  //all values are nullable so that there are 3 states: true (yes), false (no), null (not answered yet)
  const factory Answers({
    bool? areValuesFromStream,
    bool? isValueLoadedAsync,
    bool? isStateEverChanging,
    bool? isStateChangeIrrelevant,
    bool? filteringValueOfAnotherProvider,
    bool? isStateImmutable,
    bool? isStateSimpleData,
    bool? isBusinessLogicTrivial,
    bool? isValidationLogicNeeded,
  }) = _Answers;
}
