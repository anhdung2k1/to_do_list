import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/auth/google_sign_in.dart';
import 'package:to_do_list/theme.dart';
import 'package:to_do_list/routes/walkthrough/walkthrough_screen.dart';
import 'package:to_do_list/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'To-do-list',
          theme: theme(),
          routes: routes,
          initialRoute: WalkThroughScreen.routeName,
        ),
      );
}
