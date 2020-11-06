import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example_app/feature/presentation/bloc/my_bloc.dart';
import 'package:flutter_example_app/feature/presentation/pages/home/home_screen.dart';
import 'package:flutter_example_app/feature/presentation/pages/splash/splash_screen.dart';
import 'package:flutter_example_app/injector_container.dart';

import 'injector_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "something",
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => BlocProvider<MyBloc>(
              create: (context) => sl<MyBloc>(),
              child: SplashScreen(),
            ),
        HomeScreen.routeName: (context) => BlocProvider<MyBloc>(
              create: (context) => sl<MyBloc>(),
              child: HomeScreen(),
            ),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
