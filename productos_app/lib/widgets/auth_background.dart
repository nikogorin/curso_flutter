import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        _PurpleBox(),
        _HeaderIcon(),
        this.child,
      ]),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 70,
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(children: [
        Positioned(child: _Bubble(), top: 60, left: 30),
        Positioned(child: _Bubble(), top: -40, left: -30),
        Positioned(child: _Bubble(), top: -50, right: -20),
        Positioned(child: _Bubble(), bottom: -50, left: 10),
        Positioned(child: _Bubble(), bottom: 90, right: 20),
      ]),
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1)
          ],
        ),
      );
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
