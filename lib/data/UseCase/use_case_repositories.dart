import 'package:dartz/dartz.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/domain/UseCase/use_case.dart';

class GetNewsUseCase extends UseCase<Either<Failure, NewsArticle>, String> {
  final NewsRepositoriesImp _newsRepository;

  GetNewsUseCase({required NewsRepositoriesImp newsRepository})
      : _newsRepository = newsRepository;

  @override
  Future<Either<Failure, NewsArticle>> call(String params) async {
    return await _newsRepository.getNews(country: params);
  }
}

class SearchNewsUseCase
    extends UseCase<Either<Failure, NewsArticle>, SearchNewsParams> {
  final NewsRepositoriesImp _newsRepository;

  SearchNewsUseCase(this._newsRepository);

  @override
  Future<Either<Failure, NewsArticle>> call(SearchNewsParams params) async {
    return await _newsRepository.getSearchNews(
      q: params.q,
      datefrom: params.datefrom,
      sortBy: params.sortBy,
      pageSize: params.pageSize,
      page: params.page,
    );
  }
}

class SearchNewsParams {
  final String q;
  final String datefrom;
  final String sortBy;
  final int pageSize;
  final int page;

  SearchNewsParams({
    required this.q,
    required this.datefrom,
    required this.sortBy,
    required this.pageSize,
    required this.page,
  });
}
