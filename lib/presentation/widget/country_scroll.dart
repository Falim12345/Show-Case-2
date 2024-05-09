import 'package:flutter/material.dart';

class CountryScroll extends StatelessWidget {
  const CountryScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const SizedBox();
        },
      ),
    );
  }
}
