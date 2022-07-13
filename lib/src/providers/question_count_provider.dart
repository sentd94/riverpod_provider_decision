import 'package:flutter_riverpod/flutter_riverpod.dart';

///provides the index of the current question to display
final questionCountProvider = StateProvider<int>(
  (ref) => 0,
);
