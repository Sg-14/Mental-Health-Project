class Thoughts {
  int count = 0;
  final List<String> _angry = [
    'Speak when you are angry - and youll make the best speech youll ever regret.',
    'Whatever is begun in anger ends in shame.',
    'Anger resolves nothing it only puts up your blood pressure.',
  ];
  final List<String> _sad = [
    'There are moments when I wish I could roll back the clock and take all the sadness away, but I have the feeling that if I did, the joy would be gone as well.',
    'Life under no obligation to give us what we expect.',
    'You see, I usually find myself among strangers because I drift here and there trying to forget the sad things that happened to me.',
  ];
  final List<String> _cry = [
    'Dont cry over the past, its gone.',
    'Crying does not make you weak',
    'Nobody is worth crying for, and those that are worth it will not make you cry',
  ];
  final List<String> _happy = [
    'The purpose of our lives is to be happy.',
    'Life is what happens when youre busy making other plans.',
    'Be healthy and take care of yourself, but be happy with the beautiful things that make you, you',
  ];
  String getsad() {
    return _sad[count];
  }

  String getangry() {
    return _angry[count];
  }

  String getcry() {
    return _cry[count];
  }

  String gethappy() {
    return _happy[count];
  }

  int next() {
    if (count < 2) {
      return count++;
    } else {
      return count;
    }
  }
}
