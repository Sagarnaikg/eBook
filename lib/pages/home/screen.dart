import 'package:ebook/resources/colors.dart';
import 'package:ebook/resources/font_weights.dart';
import 'package:ebook/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 17),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x13475A76),
                  blurRadius: 16,
                )
              ],
              color: AppColor.COLOR_FFFFFF,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BootomTabCard(image: "book.svg", title: "My Books"),
                BootomTabCard(image: "planet.svg", title: "Discover"),
                BootomTabCard(image: "profile.svg", title: "Profile"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.9,
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

class BootomTabCard extends StatelessWidget {
  const BootomTabCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppMedia.getIcon(image)),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: AppFontWeight.bold,
          ),
        )
      ],
    );
  }
}
