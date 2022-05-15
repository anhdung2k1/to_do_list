import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/theme.dart';
import 'package:to_do_list/routes/walkthrough/walkthrough_screen.dart';
import 'package:to_do_list/routes.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/bloc/task_bloc.dart';
import 'data/repositories/auth/auth_repository.dart';
import 'data/repositories/task/task_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => AuthRepository()),
          RepositoryProvider(create: (context) => TaskRepository()),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => AuthBloc(
                      authRepository:
                          RepositoryProvider.of<AuthRepository>(context))),
              BlocProvider(
                  create: (context) => TaskBloc(
                      taskRepository:
                          RepositoryProvider.of<TaskRepository>(context))),
            ],
            child: MaterialApp(
              title: 'To-do-list',
              theme: theme(),
              routes: routes,
              initialRoute: WalkThroughScreen.routeName,
            )));
  }
}
