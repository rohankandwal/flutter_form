import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example_app/core/utils/navigation.dart';
import 'package:flutter_example_app/feature/presentation/bloc/my_bloc.dart';
import 'package:flutter_example_app/feature/presentation/pages/home/home_screen.dart';
import 'package:toast/toast.dart';

import '../../../../injector_container.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MyBloc>(context).add(DidWeLoadData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {
          if (state is Loaded) {
            if (state.dataModel != null) {
              Toast.show(state.dataModel.loadedDateTime ?? "No History", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              Navigation.intentWithClearAllRoutes(context, HomeScreen.routeName);
            }
          } else if(state is Error) {
            Toast.show(state.message, context,
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            Navigation.intentWithClearAllRoutes(context, HomeScreen.routeName);
          }
        },
        builder: (context, state) => _getBody(),
      ),
      ),
    );
  }

  Widget _getBody() {
    return BlocBuilder<MyBloc, MyState>(builder: (context, state) {
      if (state is Loading) {
        return Center(
          child: SizedBox(
              width: 20, height: 20, child: CircularProgressIndicator()),
        );
      }
      return Container(
        color: Colors.white,
      );
    });
  }
}
