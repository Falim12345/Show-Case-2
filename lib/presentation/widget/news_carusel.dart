import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_showcase_2/presentation/widget/news_card.dart';

class NewsCarousel extends StatelessWidget {
  final List<Article> articles; // Список новостей

  const NewsCarousel({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return NewsCard(article: articles[index]);
      },
      options: CarouselOptions(
        height: 280, // Высота карточек
        aspectRatio: 16 / 9, // Соотношение сторон карточек
        viewportFraction: 0.8, // Видимая часть карусели
        initialPage: 0, // Начальная страница
        enableInfiniteScroll: true, // Бесконечная прокрутка
        autoPlay: true, // Автоматическая прокрутка
        autoPlayInterval:
            const Duration(seconds: 5), // Интервал автоматической прокрутки
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn, // Кривая автоматической прокрутки
        // enlargeCenterPage: true, // Увеличивать центральную страницу
        scrollDirection: Axis.horizontal, // Направление прокрутки
      ),
    );
  }
}
