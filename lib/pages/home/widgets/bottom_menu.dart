import 'package:ebook/resources/colors.dart';
import 'package:ebook/resources/font_weights.dart';
import 'package:ebook/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        SvgPicture.asset(
          AppMedia.getIcon(image),
          width: 24,
          height: 24,
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: AppFontWeight.bold,
          ),
        )
      ],
    );
  }
}
