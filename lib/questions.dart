class Brain {
  int count = 0;
  int j = 1;
  int curr_question = 0;
  final List<String> _questions = [
    'Question Display',
    'Some cats are actually allergic to humans',
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
  ];
  String getquestion() {
    return _questions[count];
  }

  String getquestion2(int index) {
    return _questions[index];
  }

  int Get() {
    curr_question = count;
    return curr_question;
  }

  String lol() {
    String curr_question = j.toString();
    j++;
    return curr_question;
  }

  int next() {
    if (count < _questions.length - 1) {
      return count++;
    } else {
      return count;
    }
  }

  int total() {
    return _questions.length;
  }
}