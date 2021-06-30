import 'package:ebook/resources/font_weights.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x26404B5B),
              blurRadius: 16,
              offset: Offset(0, 8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                Color(0xffF07575),
              ),
            ),
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 35),
              child: Text(
                "START",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
