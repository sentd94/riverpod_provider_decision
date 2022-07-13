import 'package:riverpod_provider_decision/src/models/answers.dart';

//IMPORTANT: it is mandatory to keep the order of these classes! the matches methods are going to be called in the order of the classes

abstract class ProviderType {
  bool matches(Answers a);
}

//now each provider type there is get its own class that implements the ProviderType interface
//
//depending on the Answers aarameter (which contains the user's answers to the questions asked) the matches method decides whether the Answers aatch this provider type or not

class StreamProvider implements ProviderType {
  @override
  bool matches(Answers a) {
    return a.areValuesFromStream ?? false;
  }

  @override
  String toString() {
    return "StreamProvider";
  }
}

class FutureProvider implements ProviderType {
  @override
  bool matches(Answers a) {
    return a.isValueLoadedAsync ?? false;
  }

  @override
  String toString() {
    return "FutureProvider";
  }
}

class Provider implements ProviderType {
  @override
  bool matches(Answers a) {
    if (a.isStateEverChanging == null) return false;
    return (!a.isStateEverChanging!) ||
        (a.isStateChangeIrrelevant ?? false) ||
        (a.filteringValueOfAnotherProvider ?? false);
  }

  @override
  String toString() {
    return "Provider";
  }
}

class ChangeNotifierProvider implements ProviderType {
  @override
  bool matches(Answers a) {
    if (a.isStateImmutable == null) return false;
    return !a.isStateImmutable!;
  }

  @override
  String toString() {
    return "ChangeNotifierProvider";
  }
}

class StateNotifierProvider implements ProviderType {
  @override
  bool matches(Answers a) {
    if (a.isStateSimpleData == null) return false;
    if (!a.isStateSimpleData!) return true;

    if (a.isBusinessLogicTrivial == null) return false;
    if (!a.isBusinessLogicTrivial!) return true;

    if (a.isValidationLogicNeeded == null) return false;
    return a.isValidationLogicNeeded!;
  }

  @override
  String toString() {
    return "StateNotifierProvider";
  }
}

class StateProvider implements ProviderType {
  @override
  bool matches(Answers a) {
    if (a.isValidationLogicNeeded == null) return false;
    return !a.isValidationLogicNeeded!;
  }

  @override
  String toString() {
    return "StateProvider";
  }
}
