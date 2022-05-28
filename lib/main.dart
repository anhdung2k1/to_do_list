import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/profile_bloc/profile_bloc.dart';
import 'package:to_do_list/bloc/project_bloc/project_bloc.dart';
import 'package:to_do_list/data/repositories/profile_repository.dart/project_repository.dart';
import 'package:to_do_list/data/repositories/project/project_repository.dart';
import 'package:to_do_list/theme.dart';
import 'package:to_do_list/routes/walkthrough/walkthrough_screen.dart';
import 'package:to_do_list/routes.dart';
import 'package:to_do_list/widgets/AppBlocObserver.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/task_bloc/task_bloc.dart';
import 'data/repositories/auth/auth_repository.dart';
import 'data/repositories/task/task_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => AuthRepository()),
          RepositoryProvider(create: (context) => TaskRepository()),
          RepositoryProvider(create: (context) => ProjectRepository()),
          RepositoryProvider(create: (context) => ProfileRepository())
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
                          RepositoryProvider.of<TaskRepository>(context))
                    ..add(LoadTasks())),
              BlocProvider(
                create: (context) => ProjectBloc(
                    projectRepository:
                        RepositoryProvider.of<ProjectRepository>(context))
                  ..add(LoadProjects()),
              ),
              BlocProvider(
                  create: (context) => ProfileBloc(
                      profileRepository:
                          RepositoryProvider.of<ProfileRepository>(context))
                    ..add(LoadProfile()))
            ],
            child: MaterialApp(
              title: 'To-do-list',
              theme: theme(),
              routes: routes,
              initialRoute: WalkThroughScreen.routeName,
            )));
  }
}
