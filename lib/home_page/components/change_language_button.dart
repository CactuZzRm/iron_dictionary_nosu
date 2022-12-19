import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page_model.dart';

Future simpleDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Смена языка'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Ok',
              style: TextStyle(
                color: Color.fromARGB(255, 124, 148, 255),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.select((HomePageModel model) => model);

    return InkWell(
      onTap: () {
        model.changeLanguage();
        simpleDialog(context);
        print(model.isRussinaLanguage);
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromARGB(255, 151, 170, 255),
          //color: Color.fromARGB(255, 151, 170, 255),
        ), 
        child: Icon(Icons.repeat, color: Colors.white),
      ),
    );
  }
}
