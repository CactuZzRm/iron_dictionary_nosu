import 'package:flutter/material.dart';
import 'package:iron_dictionary_nosu/home_page/home_page_model.dart';
import 'package:provider/provider.dart';

import 'text_input_field.dart';
import 'word_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();
    Future.delayed(Duration.zero, () => model.getFavoriteWords());
    final favoriteWords = model.favoriteWordsList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 124, 148, 255),
        centerTitle: true,
        title: const Text('Избранные'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const TextInputField(),
            Expanded(
                child: ListView.separated(
              shrinkWrap: true,
              itemCount: model.favoriteWordsList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 3, color: Color.fromARGB(255, 199, 199, 199)),
              itemBuilder: (context, index) => WordCard(word: favoriteWords[index]),
            )),
          ],
        ),
      ),
    );
  }
}
