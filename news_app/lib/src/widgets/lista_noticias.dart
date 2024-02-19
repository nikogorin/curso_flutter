import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/src/theme/tema.dart';

import '../models/news_models.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;
  const ListaNoticias(this.noticias);
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: ((context, index) {
        return _Noticia(
          noticia: noticias[index],
          index: index,
        );
      }),
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia, index),
        _TarjetaNoticia(noticia),
        _TarjetaImagen(noticia),
        _TarjetaBody(noticia),
        _TarjetaBotones(),
        SizedBox(height: 10),
        Divider(),
      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 5),
      child: Row(children: [
        Text(
          '${index + 1}. ',
          style: TextStyle(color: Colors.redAccent),
        ),
        Text(
          '${noticia.author}. ',
        ),
      ]),
    );
  }
}

class _TarjetaNoticia extends StatelessWidget {
  final Article noticia;
  const _TarjetaNoticia(this.noticia);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;
  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    image: NetworkImage(noticia.urlToImage!),
                    placeholder: AssetImage('assets/img/giphy.gif'),
                  )
                : Image(
                    image: AssetImage('assets/img/no-image.png'),
                  )),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody(this.noticia);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((noticia.description) != null ? noticia.description! : ''),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.star_border),
        ),
        SizedBox(
          width: 10,
        ),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.more),
        ),
      ]),
    );
  }
}
