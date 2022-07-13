import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_decision/src/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MainScreen()));
}
