import 'package:riverpod_provider_decision/src/models/answers.dart';
import 'package:riverpod_provider_decision/src/models/provider_type.dart';
import 'package:riverpod_provider_decision/src/providers/result_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:test/test.dart';

void main() {
  group('fromAnswers ProviderTypes', () {
    test('null should be the ProviderType when no answers given', () {
      const answers = Answers();
      final providerType = fromAnswers(answers);
      expect(providerType, null);
    });

    test('StreamProvider should be the ProviderType 1', () {
      const answers = Answers(areValuesFromStream: true);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<StreamProvider>());
    });
    test('StreamProvider should be the ProviderType 2', () {
      const answers = Answers(
          areValuesFromStream: true,
          isStateSimpleData: true,
          isBusinessLogicTrivial: true,
          isValidationLogicNeeded: false);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<StreamProvider>());
    });
    test('FutureProvider should be the ProviderType', () {
      const answers =
          Answers(areValuesFromStream: false, isValueLoadedAsync: true);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<FutureProvider>());
    });

    test('StreamProvider should be the ProviderType 3', () {
      const answers =
          Answers(areValuesFromStream: true, isValueLoadedAsync: true);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<StreamProvider>());
    });

    test('Provider should be the ProviderType 1', () {
      const answers = Answers(isStateEverChanging: false);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<Provider>());
    });
    test('Provider should be the ProviderType 2', () {
      const answers =
          Answers(isStateEverChanging: true, isStateChangeIrrelevant: true);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<Provider>());
    });
    test('Provider should be the ProviderType 3', () {
      const answers = Answers(
          isStateEverChanging: true,
          isStateChangeIrrelevant: false,
          filteringValueOfAnotherProvider: true);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<Provider>());
    });
    test('ChangeNotifierProvider should be the ProviderType', () {
      const answers = Answers(isStateImmutable: false);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<ChangeNotifierProvider>());
    });
    test('StateNotifierProvider should be the ProviderType 1', () {
      const answers = Answers(isStateSimpleData: false);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<StateNotifierProvider>());
    });

    test('StateNotifierProvider should be the ProviderType 2', () {
      const answers =
          Answers(isStateSimpleData: true, isBusinessLogicTrivial: false);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<StateNotifierProvider>());
    });
    test('StateNotifierProvider should be the ProviderType 3', () {
      const answers = Answers(
          isStateSimpleData: true,
          isBusinessLogicTrivial: true,
          isValidationLogicNeeded: true);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<StateNotifierProvider>());
    });
    test('StateProvider should be the ProviderType', () {
      const answers = Answers(
          isStateSimpleData: true,
          isBusinessLogicTrivial: true,
          isValidationLogicNeeded: false);
      final providerType = fromAnswers(answers);
      expect(providerType, const TypeMatcher<StateProvider>());
    });
  });
}
