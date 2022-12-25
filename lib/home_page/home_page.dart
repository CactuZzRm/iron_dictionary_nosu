import 'package:flutter/material.dart';
import 'package:iron_dictionary_nosu/home_page/components/search_result_page/search_result_page.dart';
import 'package:iron_dictionary_nosu/home_page/components/search_translater/translater_page.dart';
import 'package:iron_dictionary_nosu/home_page/home_page_model.dart';
import 'package:provider/provider.dart';

import 'components/search_dictionary/dictionary_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();
    final words = model.wordsList;
    
    bool isDictionary = model.isDictionary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 124, 148, 255),
        centerTitle: true,
        elevation: 0,
        title: Text(isDictionary ? model.pageNames[0] : model.pageNames[1]),
        leading: IconButton(
          icon: Icon(Icons.change_circle_outlined),
          onPressed: () {
            model.changePage();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: InkWell(
              onTap: () {
                model.getFavouritesList();
                Navigator.of(context).pushNamed('/favorites');
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(Icons.star, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: isDictionary
            ? DictionaryPage()
            : TranslaterPage()
      ),
    );
  }
}
