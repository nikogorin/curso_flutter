import 'package:flutter/material.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/tema.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          _ListaCategorias(),
          Expanded(
            child: ListaNoticias(newsService.getArticulosCategoriaSeleccionada),
          )
        ],
      )),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final categories = newsService.categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          final categoryName = categories[index].name;
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(children: [
              _CategoryButton(categories[index]),
              SizedBox(
                height: 5,
              ),
              Text(
                '${categoryName[0].toUpperCase()}${categoryName.substring(1)}',
                style: TextStyle(
                  color: (categoryName == newsService.selectedCategory)
                      ? miTema.colorScheme.secondary
                      : Colors.white,
                ),
              )
            ]),
          );
        }),
        itemCount: categories.length,
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;
  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Icon(
            category.icon,
            color: (newsService.selectedCategory == category.name)
                ? miTema.colorScheme.secondary
                : Colors.black54,
          )),
    );
  }
}
