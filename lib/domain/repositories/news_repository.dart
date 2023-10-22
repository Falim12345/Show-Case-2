abstract class NewsRepository {
  Future<Map<String, dynamic>> getSearchNews(
    String q,
    String datefrom,
    String sortBy,
  );
  Future<Map<String, dynamic>> getNews(
    String country,
  );
}
