import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_decision/src/widgets/question_answer_widget.dart';
import 'package:riverpod_provider_decision/src/widgets/result_widget.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Provider Decision',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Provider Decision'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Stack(children: const [QuestionAnswerWidget(), ResultWidget()]),
        ),
      ),
    );
  }
}
