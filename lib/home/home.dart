import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'widgets/joke_widget.dart';

import '../utils/resources/strings.dart';
import '../utils/resources/constants.dart';
import '../utils/widgets/text_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Map<String, dynamic>> _fetchRandomJokes() async {
    final response = await http.get(Uri.parse(Strings.apiUrl));

    if (response.statusCode == Constants.statusCode) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception(Strings.exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const CText(Strings.appBarTitle),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _fetchRandomJokes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final Map<String, dynamic>? joke = snapshot.data;
            final setup = joke?[Strings.setupKey] != null
                ? joke![Strings.setupKey]
                : Strings.emptyText;
            final punchline = joke?[Strings.punchlineKey] != null
                ? joke![Strings.punchlineKey]
                : Strings.emptyText;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CText(
                    Strings.clickJoke,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  JokeWidget(setup: setup, punchline: punchline),
                  const SizedBox(height: 10),
                  //
                  //
                  /// todo Button to update Joke
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _fetchRandomJokes();
                        },
                      );
                    },
                    child: const Text(Strings.buttonText),
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
