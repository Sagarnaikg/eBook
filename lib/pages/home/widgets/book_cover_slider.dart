import 'package:ebook/pages/home/bloc.dart';
import 'package:ebook/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookCoverSlider extends StatelessWidget {
  const BookCoverSlider({
    Key? key,
    required HomeBloc bloc,
    required AnimationController controller,
  })   : _bloc = bloc,
        _controller = controller,
        super(key: key);

  final HomeBloc _bloc;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: _bloc.pageController,
        onPageChanged: (index) {
          if (_controller.isCompleted) _controller.repeat();
          _bloc.pageChange(index);
        },
        children: [
          BookPage(coverImage: AppMedia.getImageSet1("Cover 1.png")),
          BookPage(coverImage: AppMedia.getImageSet2("Cover 2.png")),
          BookPage(coverImage: AppMedia.getImageSet3("Cover 3.png")),
        ],
      ),
    );
  }
}

class BookPage extends StatelessWidget {
  const BookPage({
    Key? key,
    required this.coverImage,
  }) : super(key: key);

  final String coverImage;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ));

    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 70,
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    coverImage,
                    width: MediaQuery.of(context).size.width * 0.55,
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex: 30, child: Container())
        ],
      ),
    );
  }
}
