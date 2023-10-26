import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/data/repositories_imp/deserialization_data_imp.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/domain/entities/setap_dependencies.dart';
import 'package:get_it/get_it.dart';

void main() {
  SetapDependebciesImp().setapDependebcies();
  runApp(const MyApp());
  var dtData = DeserializationDataimp().deserializationDataFromApi();
  print(dtData);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

test() async {
  try {
    var dtData = DeserializationDataimp().deserializationDataFromApi();
    // NewsRepositoriesImp(dio: Dio()).getNews('us');
    // NewsRepositoriesImp(dio: Dio())
    //     .getSearchNews("Apple", "2023-10-01", "popularity");
  } catch (e) {
    throw ('$e');
  }
}
