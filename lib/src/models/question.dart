import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_decision/src/providers/answers_provider.dart';

abstract class Question {
  String get question;

  ///the tooltip message to further explain the question (optional)
  String? get hint;

  ///sets the answer to the question asked
  void makeAnswer(bool answer, WidgetRef ref);

  ///deletes the answer given
  void resetAnswer(WidgetRef ref);
}

class QAreValuesFromStream extends Question {
  @override
  void makeAnswer(bool answer, WidgetRef ref) {
    ref.read(answersProvider.notifier).areValuesFromStream = answer;
  }

  @override
  String get question => "Are the state's values from a stream?";

  @override
  void resetAnswer(WidgetRef ref) {
    ref.read(answersProvider.notifier).areValuesFromStream = null;
  }

  @override
  String? get hint => null;
}

class QIsValueLoadedAsync extends Question {
  @override
  void makeAnswer(bool answer, WidgetRef ref) {
    ref.read(answersProvider.notifier).isValueLoadedAsync = answer;
  }

  @override
  String get question => "Is the state assigned asynchronously?";

  @override
  void resetAnswer(WidgetRef ref) {
    ref.read(answersProvider.notifier).isValueLoadedAsync = null;
  }

  @override
  String? get hint => null;
}

class QIsStateEverChanging extends Question {
  @override
  void makeAnswer(bool answer, WidgetRef ref) {
    ref.read(answersProvider.notifier).isStateEverChanging = answer;
  }

  @override
  String get question => "Is the state ever changing?";

  @override
  void resetAnswer(WidgetRef ref) {
    ref.read(answersProvider.notifier).isStateEverChanging = null;
  }

  @override
  String? get hint =>
      "Sometimes the state never changes and is just for everyone else to read (e.g. HttpClient / Repository)";
}

class QIsStateChangeIrrelevant extends Question {
  @override
  void makeAnswer(bool answer, WidgetRef ref) {
    ref.read(answersProvider.notifier).isStateChangeIrrelevant = answer;
  }

  @override
  String get question => "Is the state change irrelevant?";

  @override
  void resetAnswer(WidgetRef ref) {
    ref.read(answersProvider.notifier).isStateChangeIrrelevant = null;
  }

  @override
  String? get hint =>
      "Sometimes the state is an object with attributes that can change, but noone needs to be notified about these changes.";
}

class QFilteringValueOfAnotherProvider extends Question {
  @override
  void makeAnswer(bool answer, WidgetRef ref) {
    ref.read(answersProvider.notifier).filteringValueOfAnotherProvider = answer;
  }

  @override
  String get question =>
      "Is the state supposed to be the filtered state of another provider?";

  @override
  void resetAnswer(WidgetRef ref) {
    ref.read(answersProvider.notifier).filteringValueOfAnotherProvider = null;
  }

  @override
  String? get hint =>
      "For example inside this provider you are watching another provider containing a list. Whenever the list changes you want to provide a filtered version of this list.";
}

class QIsStateImmutable extends Question {
  @override
  void makeAnswer(bool answer, WidgetRef ref) {
    ref.read(answersProvider.notifier).isStateImmutable = answer;
  }

  @override
  String get question => "Can the state be immutable? (recommended)";

  @override
  void resetAnswer(WidgetRef ref) {
    ref.read(answersProvider.notifier).isStateImmutable = null;
  }

  @override
  String? get hint =>
      "In most cases state can be mutable. For example if your state is a list, instead of adding items to the current state you create a copy (new instance) and add the item to the new list, then assign it to the state.";
}

class QIsStateSimpleData extends Question {
  @override
  void makeAnswer(bool answer, WidgetRef ref) {
    ref.read(answersProvider.notifier).isStateSimpleData = answer;
  }

  @override
  String get question =>
      "Is the state simple data (bool, String, int, Enum, ...)?";

  @override
  void resetAnswer(WidgetRef ref) {
    ref.read(answersProvider.notifier).isStateSimpleData = null;
  }

  @override
  String? get hint => null;
}

class QIsBusinessLogicTrivial extends Question {
  @override
  void makeAnswer(bool answer, WidgetRef ref) {
    ref.read(answersProvider.notifier).isBusinessLogicTrivial = answer;
  }

  @override
  String get question =>
      "Is the logic to change the state trivial (e.g. simple increment)?";

  @override
  void resetAnswer(WidgetRef ref) {
    ref.read(answersProvider.notifier).isBusinessLogicTrivial = null;
  }

  @override
  String? get hint =>
      "For instance, if you just need to decrement a value, but need to check if the value goes below zero first, click no.";
}

class QIsValidationLogicNeeded extends Question {
  @override
  void makeAnswer(bool answer, WidgetRef ref) {
    ref.read(answersProvider.notifier).isValidationLogicNeeded = answer;
  }

  @override
  String get question => "Is there any state validation needed?";

  @override
  void resetAnswer(WidgetRef ref) {
    ref.read(answersProvider.notifier).isValidationLogicNeeded = null;
  }

  @override
  String? get hint =>
      "Do you have to validate the new state (e.g. min/max String length)?";
}
