import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpod_provider_decision/src/widgets/question_answer_widget.dart';
import 'package:riverpod_provider_decision/src/widgets/result_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Riverpod Provider Decision'),
              IconButton(
                  onPressed: () async {
                    await launchUrl(Uri.parse(
                        'https://github.com/sentd94/riverpod_provider_decision'));
                  },
                  icon: const FaIcon(FontAwesomeIcons.github)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Stack(children: const [QuestionAnswerWidget(), ResultWidget()]),
              const Spacer(),
              const Text(
                  "Note: This is meant to help you with your decision and won't give you a final best answer!")
            ],
          ),
        ),
      ),
    );
  }
}
