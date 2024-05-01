import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/domain/interfaces/event.dart';
import 'package:flutter_showcase_2/presentation/BloC/events.dart';
import 'package:flutter_showcase_2/presentation/BloC/states.dart';
import 'package:get_it/get_it.dart';

import '../../domain/interfaces/state.dart';

class NewsBloc extends Bloc<Event, AppState> {
  NewsBloc() : super(InitialState()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(LoadingState());

      await GetIt.I<NewsRepositoriesImp>()
          .getNews(country: 'us')
          .then((result) {
        result.fold(
          (failure) => emit(ErrorState("Failed to load news: $failure")),
          (newsArticle) {
            final sortedArticles = newsArticle.articles.toList()
              ..sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
            emit(NewsLoadedState(
                articles: sortedArticles,
                sortedArticles: newsArticle.articles));
          },
        );
      });
    });
  }
}
