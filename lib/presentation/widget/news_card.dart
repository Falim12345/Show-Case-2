import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/core/app_colors.dart';
import '../../data/model/news_model.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: AppColors.darkThemePrimaryColor,
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(8), // Установите радиус скругления здесь

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (article.urlToImage !=
                      null) // Проверяем, есть ли urlToImage
                    SizedBox(
                      width: 364,
                      height: 183,
                      child: Image.network(
                        article.urlToImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.source.name,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
