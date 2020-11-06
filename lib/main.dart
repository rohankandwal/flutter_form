import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example_app/feature/presentation/bloc/my_bloc.dart';
import 'package:flutter_example_app/feature/presentation/pages/splash_screen.dart';
import 'package:flutter_example_app/injector_container.dart';

import 'core/bloc/my_bloc_observer.dart';
import 'core/utils/localization.dart';
import 'injector_container.dart' as di;

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mySystemTheme = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, //// navigation bar color
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent, // status bar color
    );
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);

    bool isLoggedIn = true;
    return MaterialApp(
      title: "something",
      debugShowCheckedModeBanner: false,
      locale: Locale('en'),
      localizationsDelegates: [
        MyLocalizationsDelegate(),
      ],
      supportedLocales: [Locale('en')],
      routes: {
        SplashScreen.routeName: (context) => BlocProvider<MyBloc>(
              create: (context) => sl<MyBloc>(),
              child: SplashScreen(),
            ),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
