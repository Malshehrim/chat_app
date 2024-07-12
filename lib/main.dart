import 'package:chat_app2/auth/auth_gate.dart';
import 'package:chat_app2/firebase_options.dart';

import 'package:chat_app2/themes/light_moode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
    ),
  );
}
