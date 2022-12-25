import 'package:flutter/material.dart';
import 'package:iron_dictionary_nosu/home_page/components/search_translater/text_input_field_translater.dart';

import '../search_result_page/search_result_page.dart';

class TranslaterPage extends StatelessWidget {
  TranslaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextInputFieldTranslater();
  }
}
