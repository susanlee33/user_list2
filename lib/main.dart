import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:user_list2/provider/list_provider.dart';
import 'package:user_list2/view/add_user.dart';
import 'package:user_list2/view/user_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserListProvider(),
        ),
      ],
      child: Builder(
        builder: ((context) {
          return MaterialApp.router(
            //debugShowCheckedModeBanner: false,
            title: 'Go Router',
            routerConfig: _router,
          );
        }),
      ),
    );
  }

  final GoRouter _router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => const AddUser()),
    GoRoute(path: "/UserList", builder: (context, state) => const UserList()),
  ]);
}
