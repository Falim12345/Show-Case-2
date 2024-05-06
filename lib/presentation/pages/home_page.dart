import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase_2/core/app_colors.dart';
import 'package:flutter_showcase_2/domain/interfaces/state.dart';
import 'package:flutter_showcase_2/presentation/BloC/events.dart';
import 'package:flutter_showcase_2/presentation/BloC/news_bloc.dart';
import 'package:flutter_showcase_2/presentation/BloC/states.dart';
import 'package:flutter_showcase_2/presentation/widget/news_carusel.dart';
import 'package:flutter_showcase_2/presentation/widget/news_scroll.dart';
import 'package:flutter_showcase_2/presentation/widget/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    context.read<NewsBloc>().add(FetchNewsEvent(country: 'us'));
  }

  @override
  Widget build(BuildContext context) {
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
                height: 40,
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
              SearchBar(
                hintText: 'Search for news',
                controller: searchController,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 8.0)),
                onTap: () {},
                leading: const Icon(Icons.search),
                trailing: const <Widget>[Icon(Icons.settings)],
              ),
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
              BlocBuilder<NewsBloc, AppState>(
                builder: (BuildContext context, state) {
                  if (state is NewsLoadedState) {
                    return NewsCarousel(articles: state.articles);
                  } else if (state is ErrorState) {
                    return Text('Error: ${state.errorMessage}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              // contentWidget,
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
              BlocBuilder<NewsBloc, AppState>(builder: (context, state) {
                if (state is NewsLoadedState) {
                  return NewsListView(articles: state.articles);
                } else if (state is ErrorState) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return const CircularProgressIndicator();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
