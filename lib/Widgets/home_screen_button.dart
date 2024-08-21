import 'package:flutter/material.dart';

class HomeScreenButton extends StatelessWidget {
  final VoidCallback onPressed;
  const HomeScreenButton({
    super.key,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                   
                ),
              ]
            ),
          )
        ],
      ),

    );
  }
}
