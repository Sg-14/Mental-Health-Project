class Brain {
  int count = 0;
  int j = 1;
  int curr_question = 0;
  final List<String> _questions = [
    'How many good freinds do you have?',
    'Approximate hours of sleep you are getting?',
    'How often dou you feel lonely rate on  a scale of 1 to 10.',
    'How satisfied are you with your college/school or place of work (rate on scale of 1 to 10)?',
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