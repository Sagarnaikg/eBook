import 'package:ebook/pages/home/bloc.dart';
import 'package:ebook/pages/home/widgets/bottom_menu.dart';
import 'package:ebook/pages/home/widgets/button.dart';
import 'package:ebook/pages/home/widgets/page_indicator.dart';
import 'package:ebook/resources/colors.dart';
import 'package:ebook/resources/font_weights.dart';
import 'package:flutter/material.dart';

class BookContentAction extends StatelessWidget {
  const BookContentAction({
    Key? key,
    required HomeBloc bloc,
    required AnimationController controller,
    required Animation<double> animation,
  })   : _bloc = bloc,
        _controller = controller,
        _animation = animation,
        super(key: key);

  final HomeBloc _bloc;
  final AnimationController _controller;
  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: PageIndecator(bloc: _bloc),
                ),
                Expanded(flex: 57, child: DifficultyIndicator(bloc: _bloc)),
                Expanded(
                  flex: 35,
                  child: BookDescriptionWidget(
                      bloc: _bloc,
                      controller: _controller,
                      animation: _animation),
                ),
              ],
            ),
          ),
          BottomTabBar()
        ],
      ),
    );
  }
}

class BookDescriptionWidget extends StatelessWidget {
  const BookDescriptionWidget({
    Key? key,
    required HomeBloc bloc,
    required AnimationController controller,
    required Animation<double> animation,
  })   : _bloc = bloc,
        _controller = controller,
        _animation = animation,
        super(key: key);

  final HomeBloc _bloc;
  final AnimationController _controller;
  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IgnorePointer(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 350),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: StreamBuilder<dynamic>(
                  stream: _bloc.introTextStream,
                  builder: (context, snapshot) {
                    String text = snapshot.data ?? "";

                    _controller.forward();

                    return FadeTransition(
                        opacity: _animation,
                        child: StreamBuilder<dynamic>(
                            stream: _bloc.textColorStream,
                            builder: (context, textColor) {
                              Color bgColor =
                                  textColor.data ?? AppColor.COLOR_000000;
                              return Opacity(
                                opacity: 0.9,
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    fontFamily: 'AbhayaLibre',
                                    fontSize: 18,
                                    height: 1.5,
                                    color: bgColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }));
                  }),
            ),
          ),
        ),
        Button(),
      ],
    );
  }
}

class DifficultyIndicator extends StatelessWidget {
  const DifficultyIndicator({
    Key? key,
    required HomeBloc bloc,
  })   : _bloc = bloc,
        super(key: key);

  final HomeBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: StreamBuilder<dynamic>(
          stream: _bloc.textColorStream,
          builder: (context, textColor) {
            Color bgColor = textColor.data ?? AppColor.COLOR_000000;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Difficulty",
                  style: TextStyle(
                    fontWeight: AppFontWeight.bold,
                    color: bgColor,
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  height: 7,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: bgColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: StreamBuilder<dynamic>(
                      stream: _bloc.difficultyLevelStream,
                      builder: (context, snapshot) {
                        double difficultyLevel = snapshot.data ?? 100;

                        return AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.decelerate,
                          height: 7,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: bgColor,
                          ),
                          margin: EdgeInsets.only(right: 100 - difficultyLevel),
                        );
                      }),
                ),
              ],
            );
          }),
    );
  }
}
