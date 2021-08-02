import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseInitializer extends StatefulWidget {
  final Widget child;
  final void Function() onCompleted;
  final void Function() onError;

  const FirebaseInitializer({
    Key? key,
    required this.child,
    required this.onError,
    required this.onCompleted,
  }) : super(key: key);

  @override
  _FirebaseInitializerState createState() => _FirebaseInitializerState();
}

class _FirebaseInitializerState extends State<FirebaseInitializer> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      this._initialize();
    });

    super.initState();
  }

  void _initialize() async {
    try {
      await this._initialization;

      this.widget.onCompleted();
    } catch (error) {
      this.widget.onError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return this.widget.child;
  }
}
