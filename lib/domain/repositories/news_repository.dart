abstract class NewsRepository {
  Future<Map<String, dynamic>> getSearchNews(
    q,
    from,
    sortBy,
  );
  Future<Map<String, dynamic>> getNews(
    country,
  );
}
