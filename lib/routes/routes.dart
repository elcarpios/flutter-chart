import 'package:flutter/material.dart';

import 'package:flutter_chat/pages/chat_page.dart';
import 'package:flutter_chat/pages/loading_page.dart';
import 'package:flutter_chat/pages/login_page.dart';
import 'package:flutter_chat/pages/register_page.dart';
import 'package:flutter_chat/pages/users_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'users': (BuildContext buildContext) => UsersPage(),
  'chat': (BuildContext buildContext) => ChatPage(),
  'login': (BuildContext buildContext) => LoginPage(),
  'register': (BuildContext buildContext) => RegisterPage(),
  'loading': (BuildContext buildContext) => LoadingPage()
};
