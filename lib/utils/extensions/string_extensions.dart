extension StringExtension on String {
  bool validatePhoneNumber() {
    final phoneNumberRegExp = RegExp('[0-9]+');
    String validatedPhone = '';
    var matches = phoneNumberRegExp.allMatches(this);
    matches.forEach((match) {
      validatedPhone += this.substring(match.start, match.end);
    });
    return validatedPhone.length == 10;
  }
}