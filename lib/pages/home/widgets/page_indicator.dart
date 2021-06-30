import 'package:ebook/pages/home/bloc.dart';
import 'package:ebook/resources/colors.dart';
import 'package:flutter/material.dart';

class PageIndecator extends StatelessWidget {
  const PageIndecator({
    Key? key,
    required HomeBloc bloc,
  })   : _bloc = bloc,
        super(key: key);

  final HomeBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: _bloc.pageIndexStream,
        builder: (context, snapshot) {
          int index = snapshot.data ?? 0;

          return StreamBuilder<dynamic>(
              stream: _bloc.textColorStream,
              builder: (context, textColor) {
                Color bgColor = textColor.data ?? AppColor.COLOR_000000;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Dot(
                      isSelected: index == 0 ? true : false,
                      color: bgColor,
                    ),
                    Dot(
                      isSelected: index == 1 ? true : false,
                      color: bgColor,
                    ),
                    Dot(
                      isSelected: index == 2 ? true : false,
                      color: bgColor,
                    ),
                  ],
                );
              });
        });
  }
}

class Dot extends StatelessWidget {
  const Dot({
    Key? key,
    required this.isSelected,
    required this.color,
  }) : super(key: key);

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double size = isSelected ? 14 : 9;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
