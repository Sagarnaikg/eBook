import 'package:ebook/resources/colors.dart';
import 'package:ebook/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  late PageController pageController;

  final pageIndexController = BehaviorSubject<int>.seeded(0);

  Stream<int> get pageIndexStream => pageIndexController.stream;

  Function(int)? get setPageIndexStream =>
      pageIndexController.isClosed ? null : pageIndexController.sink.add;

  final difficultyLevelController = BehaviorSubject<double>.seeded(50.0);

  Stream<double> get difficultyLevelStream => difficultyLevelController.stream;

  Function(double)? get setDifficultyLevelStream =>
      difficultyLevelController.isClosed
          ? null
          : difficultyLevelController.sink.add;

  final introTextController = BehaviorSubject<String>.seeded("");

  Stream<String> get introTextStream => introTextController.stream;

  Function(String)? get setintroTextStream =>
      introTextController.isClosed ? null : introTextController.sink.add;

  final backgroundColorController =
      BehaviorSubject<Color>.seeded(AppColor.COLOR_FFF4F3);

  Stream<Color> get backgroundColorStream => backgroundColorController.stream;

  Function(Color)? get setbackgroundColorStream =>
      backgroundColorController.isClosed
          ? null
          : backgroundColorController.sink.add;

  final backgroundImageController =
      BehaviorSubject<String>.seeded(AppMedia.getImageSet1("bg_dots.png"));

  Stream<String> get backgroundImageStream => backgroundImageController.stream;

  Function(String)? get setbackgroundImageStream =>
      backgroundImageController.isClosed
          ? null
          : backgroundImageController.sink.add;

  final textColorController =
      BehaviorSubject<Color>.seeded(AppColor.COLOR_000000);

  Stream<Color> get textColorStream => textColorController.stream;

  Function(Color)? get setTextColorStream =>
      textColorController.isClosed ? null : textColorController.sink.add;

  final pageOffsetController = BehaviorSubject<double>.seeded(0.0);

  Stream<double> get pageOffsetStream => pageOffsetController.stream;

  Function(double)? get setpageOffsetStream =>
      pageOffsetController.isClosed ? null : pageOffsetController.sink.add;

  HomeBloc() {
    pageController = new PageController();

    pageController.addListener(() {
      setpageOffsetStream!(double.parse(pageController.page.toString()));
    });

    setintroTextStream!(
        "Explore the exciting natural world around us.This is your very own nature scrapbook, packed with fascinating facts and brilliant activities. Doodle, draw and colour and find out how plants grow as well as the different parts of plants, seeds.");
  }

  void pageChange(int index) {
    setPageIndexStream!(index);

    switch (index) {
      case 0:
        setDifficultyLevelStream!(50);
        setbackgroundColorStream!(AppColor.COLOR_FFF4F3);
        setTextColorStream!(AppColor.COLOR_000000);
        setbackgroundImageStream!(AppMedia.getImageSet1("bg_dots.png"));
        setintroTextStream!(
            "Explore the exciting natural world around us.This is your very own nature scrapbook, packed with fascinating facts and brilliant activities. Doodle, draw and colour and find out how plants grow as well as the different parts of plants, seeds.");
        break;
      case 1:
        setDifficultyLevelStream!(30);
        setbackgroundColorStream!(AppColor.COLOR_FEF4DF);
        setTextColorStream!(AppColor.COLOR_000000);
        setbackgroundImageStream!(AppMedia.getImageSet2("bg_dots.png"));
        setintroTextStream!(
            "Diagrams, cross sections, and illustrations get kids up close and personal with glossy red peppers, plump orange pumpkins, little peas, and dozens of other vegetables; Learn about  color, climatic region in which the plants grow, and their uses.");
        break;
      case 2:
        setDifficultyLevelStream!(70);
        setbackgroundColorStream!(AppColor.COLOR_10205A);
        setTextColorStream!(AppColor.COLOR_FFFFFF);
        setbackgroundImageStream!(AppMedia.getImageSet3("bg_dots.png"));
        setintroTextStream!(
            "Discover the amazing world of outer space as you scratch pictures of planets, comets, and spacecraft to reveal glittery, swirly, and even glow-in-the-dark colors beneath. Ask questions, seek answers and explore the natural world.");
        break;
      default:
        setDifficultyLevelStream!(50);
        setbackgroundColorStream!(AppColor.COLOR_FFF4F3);
        setTextColorStream!(AppColor.COLOR_000000);
        setbackgroundImageStream!(AppMedia.getImageSet1("bg_dots.png"));
        setintroTextStream!(
            "Explore the exciting natural world around us.This is your very own nature scrapbook, packed with fascinating facts and brilliant activities. Doodle, draw and colour and find out how plants grow as well as the different parts of plants.");
    }
  }

  void displose() {
    pageIndexController.close();
    difficultyLevelController.close();
    introTextController.close();
    backgroundColorController.close();
    textColorController.close();
    backgroundImageController.close();
    pageOffsetController.close();
  }
}
