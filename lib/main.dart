import 'package:chat_socket_app/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes);
  }
}
