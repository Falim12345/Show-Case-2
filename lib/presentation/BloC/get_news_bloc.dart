import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/domain/interfaces/event.dart';
import 'package:flutter_showcase_2/domain/interfaces/state.dart';
import 'package:flutter_showcase_2/presentation/BloC/events.dart';
import 'package:flutter_showcase_2/presentation/BloC/states.dart';

class GetNewsBloc extends Bloc<Event, AppState> {
  final NewsRepositoriesImp _newsRepositoryImp;

  GetNewsBloc(this._newsRepositoryImp) : super(InitialState()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final news = await _newsRepositoryImp.getNews(country: event.country);
        news.fold((errorMessage) => ErrorState(errorMessage.toString()), (r) {
          emit(NewsLoadedState(articles: r.articles));
        });

        emit(DataState(news));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
