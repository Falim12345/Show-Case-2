import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/core/app_colors.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';

class NewsScrollCard extends StatelessWidget {
  final Article article;

  const NewsScrollCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.darkThemePrimaryColor,
      // margin: const EdgeInsets.all(16), // Отступы вокруг карточки
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: article.urlToImage != null
                  ? Image.network(
                      article.urlToImage!,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(), // Placeholder для отображения, если изображение недоступно
            ),
            const SizedBox(
                width: 8), // Пространство между фотографией и текстом
            // Название и краткое описание
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    article.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      height: 4), // Пространство между заголовком и описанием
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}