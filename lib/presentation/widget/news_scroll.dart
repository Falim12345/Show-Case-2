import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/presentation/widget/news_scroll_card.dart';

class NewsListView extends StatelessWidget {
  final List<Article> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return NewsScrollCard(article: articles[index]);
        },
      ),
    );
  }
}
