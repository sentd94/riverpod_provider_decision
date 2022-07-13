import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_decision/src/models/provider_type.dart';
import 'package:riverpod_provider_decision/src/providers/answers_provider.dart';
import 'package:riverpod_provider_decision/src/providers/question_count_provider.dart';
import 'package:riverpod_provider_decision/src/providers/result_provider.dart';

class ResultWidget extends ConsumerWidget {
  const ResultWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(child: Consumer(
      builder: (context, ref, child) {
        //listening to result changes (null meaning no matching provider type found yet)
        //only showing the result if a provider type was found
        ProviderType? providerType = ref.watch(resultProvider);
        if (providerType != null) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Result: ${providerType.toString()}",
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                  onPressed: () {
                    ref
                        .read(questionCountProvider.notifier)
                        .update((state) => 0);

                    ref.read(answersProvider.notifier).reset();
                  },
                  child: const Text("go again"))
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
