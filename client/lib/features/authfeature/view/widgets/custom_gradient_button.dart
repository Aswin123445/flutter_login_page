// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;
  const CustomGradientButton({
    Key? key,
    required this.buttonName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = MediaQuery.of(context).size.height;
        return InkWell(
          splashColor: Colors.blue.withOpacity(1),
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          onTap: onTap,
          child: Container(
            height: screenHeight * .058,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              gradient: LinearGradient(
                colors: [Color.fromARGB(212, 247, 120, 131), Color(0xFFFFC371)],
              ),
            ),
            child: Center(
              child: Text(
                buttonName,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  letterSpacing: .5,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
