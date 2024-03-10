import 'package:flutter/material.dart';
import 'package:secrethero_flutter/secrethero_flutter.dart';
import 'package:secrethero_flutter/secrethero_flutter_method_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final secretHeroConfig = SecretHeroConfig(
      token:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJRCI6IjEiLCJpYXQiOjE2OTgwNzA3Mjl9.Tf_QBI0PM8EHVI0xqmFdqkjtcI5-q2ciyGhnASBhfY8",
      userId: "99999999",
      displayName: "TestFlutterUser",
      theme: SecretHeroTheme(
        primaryColor: "#191D21",
        secondaryColor: "#FFFFFF",
        highlightColor: "#7B61FF",
        buttonColor: "#92FFD7",
      ));
  final secretHeroListener = SecretHeroEventListener(onInitialized: () {
    print("onInitialized");
  }, onInitializeFailed: (errorMessage) {
    print("onInitializeFailed $errorMessage");
  }, onOpen: () {
    print("onOpen");
  }, onClose: () {
    print("onClose");
  }, onEvent: (event) {
    print("onEvent $event");
  });

  @override
  void initState() {
    super.initState();
    SecretHero().initialize(secretHeroConfig, secretHeroListener);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                SecretHero().initialize(secretHeroConfig, secretHeroListener);
              },
              child: const Text('SecretHero - initialize'),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                SecretHero().start();
              },
              child: const Text('SecretHero - start'),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                SecretHero().release();
              },
              child: const Text('SecretHero - release'),
            )
          ],
        ),
      ),
    );
  }
}
