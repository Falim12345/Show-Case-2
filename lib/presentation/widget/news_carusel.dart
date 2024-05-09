import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/presentation/widget/news_card.dart';

class NewsCarousel extends StatelessWidget {
  final List<Article> articles; // Список новостей

  const NewsCarousel({
    required this.articles,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return NewsCard(article: articles[index]);
      },
      options: CarouselOptions(
        height: 280,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        // enlargeCenterPage: true, // Увеличивать центральную страницу
      ),
    );
  }
}
