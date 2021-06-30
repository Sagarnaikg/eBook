import 'package:ebook/pages/home/bloc.dart';
import 'package:ebook/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedElementsTop extends StatelessWidget {
  const AnimatedElementsTop({
    Key? key,
    required HomeBloc bloc,
  })   : _bloc = bloc,
        super(key: key);

  final HomeBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        children: [
          Expanded(
            flex: 70,
            child: StreamBuilder<dynamic>(
                stream: _bloc.pageOffsetStream,
                builder: (context, snapshot) {
                  double offset = snapshot.data ?? 0.0;

                  return Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          right: 80 - (offset * 200),
                          bottom: 150 - (offset * 100),
                          child: SvgPicture.asset(
                            AppMedia.getImageSet1("plant_6.svg"),
                          ),
                        ),
                        // book 2 elements
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          left: offset < 1
                              ? 200 * offset - 150
                              : 200 * (2 - offset) - 150,
                          top: offset < 1 ? 70 * offset : 70 * (2 - offset),
                          child: SvgPicture.asset(
                            AppMedia.getImageSet2("vege_1.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          left: offset < 1
                              ? 125 * offset - 100
                              : 125 * (2 - offset) - 100,
                          bottom: 240,
                          child: SvgPicture.asset(
                            AppMedia.getImageSet2("vege_3.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          right: offset < 1
                              ? 180 * offset - 150
                              : 180 * (2 - offset) - 150,
                          bottom: 160,
                          child: SvgPicture.asset(
                            AppMedia.getImageSet2("vege_2.svg"),
                          ),
                        ),

                        // book 3
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          right: 60 + ((2 - offset) * -150),
                          bottom: 150 + ((2 - offset) * -100),
                          child: SvgPicture.asset(
                            AppMedia.getImageSet3("planet_3.svg"),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Expanded(
            flex: 30,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class AnimatedElementsBottom extends StatelessWidget {
  const AnimatedElementsBottom({
    Key? key,
    required HomeBloc bloc,
  })   : _bloc = bloc,
        super(key: key);

  final HomeBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        children: [
          Expanded(
            flex: 70,
            child: StreamBuilder<dynamic>(
                stream: _bloc.pageOffsetStream,
                builder: (context, snapshot) {
                  double offset = snapshot.data ?? 0.0;

                  return Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 100),
                          left: 20,
                          top: 60 - (60 * offset * 2),
                          child: SvgPicture.asset(
                            AppMedia.getImageSet1("plant_5.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 100),
                          left: 20,
                          top: 150 - (150 * offset * 2),
                          child: SvgPicture.asset(
                            AppMedia.getImageSet1("plant_4.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 100),
                          left: offset < 1.5
                              ? -10 + (offset * 10)
                              : -(offset * 100),
                          bottom: 120,
                          child: SvgPicture.asset(
                            AppMedia.getImageSet1("bg_shape2.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 100),
                          left: 0 - (90 * offset),
                          bottom: 160,
                          child: SvgPicture.asset(
                            AppMedia.getImageSet1("plant_3.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 0),
                          left: 100 - (offset * 200),
                          top: 65,
                          child: SvgPicture.asset(
                            AppMedia.getImageSet1("plant_2.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 100),
                          right: offset < 1.5
                              ? -30 + (offset * 50)
                              : -(offset * 100),
                          top: 80,
                          child: SvgPicture.asset(
                            AppMedia.getImageSet1("bg_shape1.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          right: 0 - (offset * 150),
                          top: 70 - (offset * 60),
                          child: SvgPicture.asset(
                            AppMedia.getImageSet1("plant_1.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          right: 0 - (offset * 100),
                          bottom: 160,
                          child: SvgPicture.asset(
                            AppMedia.getImageSet1("plant_7.svg"),
                          ),
                        ),

                        // book2 elemsnts
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          left: offset < 1
                              ? 100 * offset - 100
                              : 100 * (2 - offset) - 100,
                          bottom: offset < 1
                              ? 220 * offset - 60
                              : 220 * (2 - offset) - 60,
                          child: SvgPicture.asset(
                            AppMedia.getImageSet2("vege_4.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          right: offset < 1
                              ? 100 * offset - 100
                              : 100 * (2 - offset) - 100,
                          top: offset < 1
                              ? 200 * offset - 20
                              : 200 * (2 - offset) - 20,
                          child: SvgPicture.asset(
                            AppMedia.getImageSet2("vege_5.svg"),
                          ),
                        ),

                        // book 3
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          left: 0 + ((2 - offset) * -10),
                          top: 60 + ((2 - offset) * -150),
                          child: SvgPicture.asset(
                            AppMedia.getImageSet3("planet_1.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          left: 50 + ((2 - offset) * -150),
                          top: 230 + ((2 - offset) * 100),
                          child: SvgPicture.asset(
                            AppMedia.getImageSet3("planet_7.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          left: 40 + ((2 - offset) * -150),
                          bottom: 140 + ((2 - offset) * 100),
                          child: SvgPicture.asset(
                            AppMedia.getImageSet3("planet_2.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          right: 90 + ((2 - offset) * -150),
                          top: 100 + ((2 - offset) * 100),
                          child: SvgPicture.asset(
                            AppMedia.getImageSet3("planet_6.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          right: 0 + ((2 - offset) * -150),
                          top: 200,
                          child: SvgPicture.asset(
                            AppMedia.getImageSet3("planet_4.svg"),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1),
                          right: 40 + ((2 - offset) * -150),
                          bottom: 250 + ((2 - offset) * -100),
                          child: SvgPicture.asset(
                            AppMedia.getImageSet3("planet_5.svg"),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Expanded(
            flex: 30,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
