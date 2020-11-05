import 'package:flutter/material.dart';

import 'arguements/verify_otp_arguments.dart';

class OTPVerificationScreen extends StatefulWidget {

  static const screenName = '/otp_verification';

  OTPVerificationScreen();

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {

  @override
  Widget build(BuildContext context) {
    final VerifyOTPArguments args = ModalRoute.of(context).settings.arguments;
    print(args.name);
    print(args.email);
    return Container(
      color: Colors.pink,
    );
  }
}
