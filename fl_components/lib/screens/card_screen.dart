import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl:
                'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg',
            name: 'Un hermoso paisaje',
          ),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl:
                'https://avivamientochaco.com/web/wp-content/uploads/2018/10/travel-landscape-01.jpg',
          ),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl:
                'https://image.winudf.com/v2/image/Y29tLmh1YWRvbmcuZmVuZ2ppbmcxX3NjcmVlbnNob3RzXzJfNDkyMzIzZWQ/screen-2.jpg?fakeurl=1&type=.jpg',
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
