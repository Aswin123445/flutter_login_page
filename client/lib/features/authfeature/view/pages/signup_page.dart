import 'package:client/core/app_pallet.dart';
import 'package:client/features/authfeature/view/widgets/custom_gradient_button.dart';
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
      final screenWidth = MediaQuery.of(context).size.height;
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
                      height: screenHeight * .05,
                      width: double.infinity,
                    )
                  : SizedBox(
                      height: screenHeight * .33,
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
                height: screenHeight * .4,
                child: Column(
                  children: [
                    const CustomText(hintText: "name"),
                    const SizedBox(height: 7),
                    const CustomText(hintText: "email"),
                    const SizedBox(height: 7),
                    const CustomText(hintText: "password"),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomGradientButton(
                        buttonName: "Submit",
                      ),
                    ),
                    const SizedBox(height: 3.5),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * .1),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              "Already have an account",
                              style: TextStyle(
                                fontSize: 13,
                                color: Pallete.lightwhiteColor,
                                fontWeight: FontWeight.lerp(
                                  FontWeight.w500,
                                  FontWeight.w600,
                                  0.3,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 1.5,
                          ),
                          const Text(
                            "?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3, left: 4),
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Pallete.gradient3,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
