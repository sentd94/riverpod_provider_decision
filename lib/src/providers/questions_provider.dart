import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_decision/src/models/question.dart';

final questionProvider = Provider<List<Question>>((ref) => [
      QAreValuesFromStream(),
      QIsValueLoadedAsync(),
      QIsStateEverChanging(),
      QIsStateChangeIrrelevant(),
      QFilteringValueOfAnotherProvider(),
      QIsStateImmutable(),
      QIsStateSimpleData(),
      QIsBusinessLogicTrivial(),
      QIsValidationLogicNeeded(),
    ]);
