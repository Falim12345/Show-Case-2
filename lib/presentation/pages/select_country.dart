import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:get_it/get_it.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  final NewsRepositoriesImp newsRepository =
      GetIt.instance<NewsRepositoriesImp>();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                ),
                Text('Select you country'),
              ],
            ),
            Text('fdsfdsfsdfs'),
          ],
        ),
      ),
    );
  }
}
