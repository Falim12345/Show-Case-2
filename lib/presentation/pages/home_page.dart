import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/core/app_colors.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/presentation/widget/news_carusel.dart';
import 'package:flutter_showcase_2/presentation/widget/news_scroll.dart';
import 'package:flutter_showcase_2/presentation/widget/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    loadNews();
  }

  void loadNews() {
    NewsRepositoriesImp newsRepositoriesImp = NewsRepositoriesImp();
    newsRepositoriesImp.getNews(country: 'us').then((result) {
      result.fold(
        (failure) => print("Failed to load news: $failure"),
        (newsArticle) {
          setState(() {
            articles = newsArticle.articles;
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget contentWidget;

    if (articles.isNotEmpty) {
      contentWidget = NewsCarousel(articles: articles);
    } else {
      contentWidget =
          const CircularProgressIndicator(); // или другой виджет загрузки
    }
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.primaryColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, color: AppColors.primaryColor),
            label: 'Explorer',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline_sharp,
                  color: AppColors.primaryColor),
              label: 'Bookmarks'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: AppColors.primaryColor),
            label: 'Profile',
          ),
        ]),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: 8,
          ),
          child: Column(
            children: [
              SizedBox(
                width: 380,
                height: 56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'lib/assets/image.png',
                      width: 99,
                      height: 24,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.bodyTextColor,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.notifications,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomSearchBar(),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Trending'),
                  InkWell(onTap: () {}, child: const Text('See all'))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              contentWidget,
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Lastet'),
                  InkWell(onTap: () {}, child: const Text('See all'))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              NewsListView(articles: articles),
            ],
          ),
        ),
      ),
    );
  }
}
