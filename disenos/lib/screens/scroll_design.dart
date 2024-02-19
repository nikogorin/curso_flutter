import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.5, 0.5],
      colors: [
        Color(0xff5EE8C5),
        Color(0xff30BAD5),
      ],
    ),
  );

  const ScrollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: boxDecoration,
        child: PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            const PageOne(),
            PageTwo(),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        MainContent(),
      ],
    );
  }
}

// ignore: use_key_in_widget_constructors
class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            '11°',
            style: textStyle,
          ),
          const Text(
            'Miércoles',
            style: textStyle,
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 100,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD5),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Image(
        image: AssetImage('assets/scroll-1.png'),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD5),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Bienvenido',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff0098FA),
            shape: const StadiumBorder(),
          ),
        ),
      ),
    );
  }
}
