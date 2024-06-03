class SearchNewsParams {
  SearchNewsParams({
    required this.q,
    required this.datefrom,
    required this.sortBy,
    required this.pageSize,
    required this.page,
  });
  final String q;
  final String datefrom;
  final String sortBy;
  final int pageSize;
  final int page;
}
