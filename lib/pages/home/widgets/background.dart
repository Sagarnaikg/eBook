import 'package:ebook/pages/home/bloc.dart';
import 'package:ebook/resources/colors.dart';
import 'package:ebook/resources/media.dart';
import 'package:flutter/material.dart';

class AnimatedBackGround extends StatelessWidget {
  const AnimatedBackGround({
    Key? key,
    required HomeBloc bloc,
  })   : _bloc = bloc,
        super(key: key);

  final HomeBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: _bloc.backgroundColorStream,
      builder: (context, snapshot) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: snapshot.data ?? AppColor.COLOR_FFF4F3,
          child: StreamBuilder<dynamic>(
              stream: _bloc.backgroundImageStream,
              builder: (context, snapshot) {
                String image =
                    snapshot.data ?? AppMedia.getImageSet1("bg_dots.png");

                return Image.asset(
                  image,
                );
              }),
        );
      },
    );
  }
}
