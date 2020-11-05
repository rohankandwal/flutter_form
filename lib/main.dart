import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_example_app/otp_verification.dart';
import 'package:flutter_example_app/utils/navigation.dart';

import 'arguements/verify_otp_arguments.dart';

void main() {
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
      routes: {
        MyCustomForm.screenName: (context) => MyCustomForm(),
        OTPVerificationScreen.screenName: (context) => OTPVerificationScreen()
      },
      initialRoute: MyCustomForm.screenName,
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {

  static const screenName = '/my_custom_forms';

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Name *',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
            controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What is your email?',
                labelText: 'Email *',
              ),
              validator: (value) {
                var pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                var regExp = RegExp(pattern);
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                } else if (!regExp.hasMatch(value)) {
                  return 'Not a valid email address. Should be your@email.com';
                } else {
                  return null;
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                // Navigator.pushNamed(context, OTPVerificationScreen.screenName);
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Navigation.intentWithData(
                      context,
                      OTPVerificationScreen.screenName,
                      VerifyOTPArguments(
                          name: _nameController.text,
                          email: _emailController.text));
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Submit'),
                  Icon(Icons.person)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
