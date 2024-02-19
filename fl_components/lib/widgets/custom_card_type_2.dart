import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({
    Key? key,
    required this.imageUrl,
    this.name,
  }) : super(key: key);

  final String imageUrl;
  final String? name;
//https://avivamientochaco.com/web/wp-content/uploads/2018/10/travel-landscape-01.jpg
//https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 30,
        shadowColor: AppTheme.primary.withOpacity(0.6),
        child: Column(
          children: [
            FadeInImage(
              placeholder: const AssetImage('images/jar-loading.gif'),
              image: NetworkImage(imageUrl),
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 300),
            ),
            if (name != null)
              Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding:
                      const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                  child: Text(name!))
            // Image(
            //   image: NetworkImage(
            //       'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg'),

            // ),
            // Image(
            //   image: AssetImage('images/file_mail_2.jpg'),
            // )
          ],
        ));
  }
}
