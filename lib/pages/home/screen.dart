import 'package:ebook/pages/home/bloc.dart';
import 'package:ebook/pages/home/widgets/animated_elements.dart';
import 'package:ebook/pages/home/widgets/background.dart';
import 'package:ebook/pages/home/widgets/book_cover_slider.dart';
import 'package:ebook/pages/home/widgets/book_description.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late HomeBloc _bloc;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    _bloc = new HomeBloc();
    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBackGround(bloc: _bloc),
          AnimatedElementsBottom(bloc: _bloc),
          BookCoverSlider(bloc: _bloc, controller: _controller),
          AnimatedElementsTop(bloc: _bloc),
          BookContentAction(
            bloc: _bloc,
            controller: _controller,
            animation: _animation,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bloc.displose();
    super.dispose();
  }
}
