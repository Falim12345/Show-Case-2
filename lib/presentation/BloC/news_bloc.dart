import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/domain/interfaces/event.dart';
import 'package:flutter_showcase_2/presentation/BloC/events.dart';
import 'package:flutter_showcase_2/presentation/BloC/states.dart';
import 'package:get_it/get_it.dart';

import '../../domain/interfaces/state.dart';

final articles =
    GetIt.instance.get<NewsRepositoriesImp>().getNews(country: 'us');

class NewsBloc extends Bloc<Event, AppState> {
  NewsBloc() : super(InitialState()) {
    on<FetchNewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
