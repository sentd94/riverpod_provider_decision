import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_decision/src/providers/result_provider.dart';

import '../models/provider_type.dart';
import '../providers/question_count_provider.dart';
import '../providers/questions_provider.dart';

class QuestionAnswerWidget extends ConsumerWidget {
  const QuestionAnswerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.read(questionProvider);
    return Consumer(
      builder: (context, ref, child) {
        //listening to result changes (null meaning no matching provider type found yet)
        //only showing the question / answer UI if no provider type found yet
        ProviderType? providerType = ref.watch(resultProvider);
        if (providerType == null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final hint = questions[ref.watch(questionCountProvider)].hint;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        questions[ref.watch(questionCountProvider)].question,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      if (hint != null)
                        Tooltip(
                          message: hint,
                          child: const Icon(
                            Icons.info,
                          ),
                        )
                      else
                        Container()
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      key: const Key("Yes"),
                      onPressed: () {
                        questions[ref.read(questionCountProvider)]
                            .makeAnswer(true, ref);
                        ref
                            .read(questionCountProvider.notifier)
                            .update((state) => state + 1);
                      },
                      child: const Text("Yes")),
                  TextButton(
                      key: const Key("No"),
                      onPressed: () {
                        questions[ref.read(questionCountProvider)]
                            .makeAnswer(false, ref);
                        ref
                            .read(questionCountProvider.notifier)
                            .update((state) => state + 1);
                      },
                      child: const Text("No"))
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    key: const Key("backButton"),
                    onPressed: ref.watch(questionCountProvider) > 0
                        ? () {
                            ref
                                .read(questionCountProvider.notifier)
                                .update((state) => state - 1);
                            questions[ref.read(questionCountProvider)]
                                .resetAnswer(ref);
                          }
                        : null,
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.black;
                      }),
                    ),
                    child: const Text(
                      "back",
                    ),
                  ),
                ],
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
