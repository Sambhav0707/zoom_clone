import 'package:flutter/material.dart';
import 'package:zoom_clone/Utils/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  const CustomButton({super.key,
    required this.onpressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: onpressed ,
        child: Text(text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
          ),
        ),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: buttonColor),
          ),


        )
      ),
    );
  }
}
