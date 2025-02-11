import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

import '../../utils/resources/strings.dart';
import '../../utils/widgets/text_widget.dart';

class JokeWidget extends StatelessWidget {
  const JokeWidget({
    super.key,
    required this.setup,
    required this.punchline,
  });

  final dynamic setup;
  final dynamic punchline;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            FlipCard(
              front: Column(
                children: [
                  const CText(
                    Strings.jokeTitle,
                    textAlign: TextAlign.center,
                    style: _TextStyles._textHeadingStyle,
                  ),
                  SizedBox(height: 15),
                  CText(
                    setup,
                    textAlign: TextAlign.center,
                    style: _TextStyles._textStyle,
                  ),
                ],
              ),
              back: Column(
                children: [
                  const CText(
                    Strings.punchlineTitle,
                    textAlign: TextAlign.center,
                    style: _TextStyles._textHeadingStyle,
                  ),
                  SizedBox(height: 15),
                  CText(
                    punchline,
                    textAlign: TextAlign.center,
                    style: _TextStyles._textStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextStyles {
  const _TextStyles._();

  static const TextStyle _textHeadingStyle = TextStyle(
    fontSize: 20,
  );

  static const TextStyle _textStyle = TextStyle(
    fontSize: 16,
  );
}
