import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
        required this.question,
        required this.indexAction
      }) : super(key: key);

  final String question;
  final int indexAction;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('Question ${indexAction+1}: ${question}'),
    );
  }
}
