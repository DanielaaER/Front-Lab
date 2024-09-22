import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/pages/auth/login/login_screen.dart';
import 'package:provider/provider.dart';

import 'presentation/themes/Theme.dart';
import 'server/api.dart';
import 'server/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GlobalVariables globalVariables = GlobalVariables();
  await globalVariables.loadApiUrl();


  final authService = AuthService();
  await authService.checkLoginStatus();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (_) => authService,
        ),


      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeMode.system,
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

