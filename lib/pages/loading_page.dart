import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  static const String route = 'loading_route';

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('LoadingPage'),
      ),
    );
  }
}
