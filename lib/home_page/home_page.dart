import 'package:flutter/material.dart';
import 'package:iron_dictionary_nosu/home_page/components/change_language_button.dart';
import 'package:iron_dictionary_nosu/home_page/components/text_input_field.dart';
import 'package:iron_dictionary_nosu/home_page/home_page_model.dart';
import 'package:provider/provider.dart';

import 'components/word_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();
    final words = model.wordsList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 124, 148, 255),
        centerTitle: true,
        title: const Text('Iron dictionary'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: InkWell(
              onTap: () {
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
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         width: 150,
            //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            //         //color: Color.fromARGB(255, 106, 133, 255),
            //         decoration: BoxDecoration(
            //           color: Color.fromARGB(255, 151, 170, 255),
            //           borderRadius: BorderRadius.circular(25),
            //         ),
            //         child: Text(
            //           model.isRussinaLanguage ? 'Русский' : 'Осетинский',
            //           style: const TextStyle(
            //             color: Colors.white,
            //             fontSize: 20,
            //           ),
            //           textAlign: TextAlign.center,
            //         ),
            //       ),
            //       const SizedBox(width: 4),
            //       const ChangeLanguageButton(),
            //       const SizedBox(width: 4),
            //       Container(
            //         width: 150,
            //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            //         //color: Color.fromARGB(255, 106, 133, 255),
            //         decoration: BoxDecoration(
            //           color: Color.fromARGB(255, 151, 170, 255),
            //           borderRadius: BorderRadius.circular(25),
            //         ),
            //         child: Text(
            //           !model.isRussinaLanguage ? 'Русский' : 'Осетинский',
            //           style: const TextStyle(
            //             color: Colors.white,
            //             fontSize: 20,
            //           ),
            //           textAlign: TextAlign.center,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const TextInputField(),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: model.wordsList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(height: 3, color: Color.fromARGB(255, 199, 199, 199)),
                itemBuilder: (context, index) => WordCard(word: words[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
