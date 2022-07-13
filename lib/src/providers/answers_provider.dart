import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_decision/src/models/answers.dart';

final answersProvider = StateNotifierProvider<AnswersNotifier, Answers>((ref) {
  return AnswersNotifier();
});

class AnswersNotifier extends StateNotifier<Answers> {
  AnswersNotifier() : super(const Answers());

  void reset() {
    state = const Answers();
  }

  set areValuesFromStream(bool? value) {
    state = state.copyWith(areValuesFromStream: value);
  }

  set isValueLoadedAsync(bool? value) {
    state = state.copyWith(isValueLoadedAsync: value);
  }

  set isStateEverChanging(bool? value) {
    state = state.copyWith(isStateEverChanging: value);
  }

  set isStateChangeIrrelevant(bool? value) {
    state = state.copyWith(isStateChangeIrrelevant: value);
  }

  set filteringValueOfAnotherProvider(bool? value) {
    state = state.copyWith(filteringValueOfAnotherProvider: value);
  }

  set isStateImmutable(bool? value) {
    state = state.copyWith(isStateImmutable: value);
  }

  set isStateSimpleData(bool? value) {
    state = state.copyWith(isStateSimpleData: value);
  }

  set isBusinessLogicTrivial(bool? value) {
    state = state.copyWith(isBusinessLogicTrivial: value);
  }

  set isValidationLogicNeeded(bool? value) {
    state = state.copyWith(isValidationLogicNeeded: value);
  }
}
