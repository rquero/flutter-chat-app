import 'package:flutter/material.dart';

import 'package:chat_socket_app/pages/chat_page.dart';
import 'package:chat_socket_app/pages/home_page.dart';
import 'package:chat_socket_app/pages/loading_page.dart';
import 'package:chat_socket_app/pages/login_page.dart';
import 'package:chat_socket_app/pages/register_page.dart';

class AppRoutes {
  static const String initialRoute = ChatPage.route;

  static Map<String, Widget Function(dynamic)> routes = {
    HomePage.route: (_) => const HomePage(),
    LoginPage.route: (_) => const LoginPage(),
    RegisterPage.route: (_) => const RegisterPage(),
    LoadingPage.route: (_) => const LoadingPage(),
    ChatPage.route: (_) => const ChatPage(),
  };
}
