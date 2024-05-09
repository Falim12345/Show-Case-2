import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/presentation/widget/news_scroll_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({required this.articles, super.key});
  final List<Article> articles;

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
