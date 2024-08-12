import 'package:client/core/app_pallet.dart';
import 'package:client/features/authfeature/view/widgets/custom_gradient_button.dart';
import 'package:client/features/authfeature/view/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isIconVisibel = true;
  bool isObscureText = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                keyboardHeight > 0
                    ? SizedBox(
                        height: screenHeight * .13,
                        width: double.infinity,
                      )
                    : SizedBox(
                        height: screenHeight * .33,
                        width: double.infinity,
                        child: Lottie.asset(
                          'asset/signup1.json',
                          fit: BoxFit.contain,
                        ),
                      ),
                const Text(
                  "Sign In.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                SizedBox(height: screenHeight * .03),
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * .4,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 7),
                        CustomText(
                          obscure: false,
                          hintText: "email",
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "email is missing";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 7),
                        CustomText(
                          icon: IconButton(
                            splashRadius: 11,
                            icon: Icon(
                              isIconVisibel
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                isIconVisibel = !isIconVisibel;
                                isObscureText = !isObscureText;
                              });
                            },
                          ),
                          obscure: isObscureText,
                          hintText: "password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password is missing";
                            }
                            return null;
                          },
                          controller: passwordController,
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomGradientButton(
                            buttonName: "Sign In",
                            onTap: () {
                              formKey.currentState?.validate();
                            },
                          ),
                        ),
                        const SizedBox(height: 3.5),
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * .1),
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 3, left: 13),
                                child: Text(
                                  "new around here",
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
                                    "Sign Up",
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
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
