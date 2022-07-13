import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_decision/src/models/provider_type.dart'
    as provider_type;
import 'package:riverpod_provider_decision/src/providers/answers_provider.dart';

import '../models/answers.dart';

final resultProvider = Provider<provider_type.ProviderType?>((ref) {
  //whenever the answers change (user answers a question or goes back to correction a previous one)
  final answers = ref.watch(answersProvider);
  //we return the provider type matching the current set of  answers
  return fromAnswers(answers);
});

///returns [null] if no provider type can be pointed out from the current answers
provider_type.ProviderType? fromAnswers(Answers answers) {
  //creating a list with one instance of each provider class
  List<provider_type.ProviderType> providerTypes = [
    provider_type.StreamProvider(),
    provider_type.FutureProvider(),
    provider_type.Provider(),
    provider_type.ChangeNotifierProvider(),
    provider_type.StateNotifierProvider(),
    provider_type.StateProvider(),
  ];
  //asking each provider in order of the list if the answers match their provider type
  //the loop stops as soon as the first provider says that it matches to them
  //unless there is no match yet, then null is returned
  for (var providerType in providerTypes) {
    if (providerType.matches(answers)) {
      return providerType;
    }
  }
  return null;
}
