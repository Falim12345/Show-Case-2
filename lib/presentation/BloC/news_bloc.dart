import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/domain/interfaces/event.dart';
import 'package:flutter_showcase_2/presentation/BloC/events.dart';
import 'package:flutter_showcase_2/presentation/BloC/states.dart';
import 'package:get_it/get_it.dart';

import '../../domain/interfaces/state.dart';

class NewsBloc extends Bloc<Event, AppState> {
  NewsBloc() : super(InitialState()) {
    _fetchLastNews();
  }

  void _fetchLastNews() {
    return on<FetchNewsEvent>((event, emit) async {
      await GetIt.I<NewsRepositoriesImp>()
          .getNews(country: 'us')
          .then((result) {
        result.fold(
          (failure) => emit(ErrorState("Failed to load news: $failure")),
          (newsArticle) {
            final sortedArticles = newsArticle.articles.toList()
              ..sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
            final limitedArticles = sortedArticles.length > 5
                ? sortedArticles.sublist(0, 5)
                : sortedArticles;
            emit(NewsLoadedState(articles: limitedArticles));
          },
        );
      });
    });
  }
}
