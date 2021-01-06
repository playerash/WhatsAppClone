import 'package:flutter/material.dart';

class Pesquisa extends SearchDelegate<String> {
  Widget tela;
  Pesquisa(this.tela);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [Container()];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return tela;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return tela;
  }
}
