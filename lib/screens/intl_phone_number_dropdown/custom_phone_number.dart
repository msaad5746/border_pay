class CustomPhoneNumber {
  String countryISOCode;
  String countryCode;
  String number;

  CustomPhoneNumber({
    required this.countryISOCode,
    required this.countryCode,
    required this.number,
  });

  String get completeNumber {
    return countryCode + number;
  }

  String toString() =>
      'PhoneNumber(countryISOCode: $countryISOCode, countryCode: $countryCode, number: $number)';
}
