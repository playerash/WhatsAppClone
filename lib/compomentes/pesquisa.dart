import 'package:WhatsAppClone/screens/conversascreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Pesquisa extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Container()
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, "");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return ConversaScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ConversaScreen();
  }
}

class CustomLocalizationDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'pt';

  @override
  Future<MaterialLocalizations> load(Locale locale) => SynchronousFuture<MaterialLocalizations>(const CustomLocalization());

  @override
  bool shouldReload(CustomLocalizationDelegate old) => false;

  @override
  String toString() => 'CustomLocalization.delegate(pt_BR)';
}

class CustomLocalization extends DefaultMaterialLocalizations {
  const CustomLocalization();

  @override
  String get searchFieldLabel => "Pesquisar...";
}
