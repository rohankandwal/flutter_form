import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example_app/feature/presentation/bloc/my_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MyBloc>(context).add(LoadGitHubFeed());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<MyBloc, MyState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: SizedBox(
                  width: 20, height: 20, child: CircularProgressIndicator()),
            );
          } else if (state is Error) {
            return Center(child: Text(state.message));
          } else if (state is Loaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.feedEntity.securityAdvisoryUrl),
                Text(state.feedEntity.timeLineUrl),
                Text(state.feedEntity.userUrl),
              ],
            );
          }
          return Container();
        },
        listener: (context, state) {
          if (state is Loaded) {

          } else if (state is Error) {

          }
        },
      ),
    );
  }
}
