import 'package:client/features/authfeature/view/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final screenHeight = MediaQuery.of(context).size.height;
      final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              keyboardHeight > 0
                  ? SizedBox(
                      height: screenHeight * .15,
                      width: double.infinity,
                    )
                  : SizedBox(
                      height: screenHeight * .35,
                      width: double.infinity,
                    ),
              const Text(
                "Sign Up.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              SizedBox(height: screenHeight * .06),
              SizedBox(
                width: double.infinity,
                height: screenHeight * .31,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(hintText: "name"),
                    CustomText(hintText: "email"),
                    CustomText(hintText: "password"),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
