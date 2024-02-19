// ignore_for_file: use_key_in_widget_constructors, unused_element

import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SingleCard(
            color: Colors.blue,
            icon: Icons.border_all,
            text: 'General',
          ),
          _SingleCard(
            color: Colors.pinkAccent,
            icon: Icons.car_rental,
            text: 'Transport',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.purple,
            icon: Icons.shop,
            text: 'Shopping',
          ),
          _SingleCard(
            color: Colors.purpleAccent,
            icon: Icons.cloud,
            text: 'Bill',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.deepOrange,
            icon: Icons.cloud_outlined,
            text: 'Entertainment',
          ),
          _SingleCard(
            color: Colors.greenAccent,
            icon: Icons.local_grocery_store,
            text: 'Grocery',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.blue,
            icon: Icons.border_all,
            text: 'General',
          ),
          _SingleCard(
            color: Colors.pinkAccent,
            icon: Icons.car_rental,
            text: 'Transport',
          ),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 170,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(
                    icon,
                    size: 35,
                    color: Colors.white,
                  ),
                  radius: 30,
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  style: TextStyle(color: color, fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
