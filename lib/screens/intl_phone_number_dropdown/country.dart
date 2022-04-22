class Country {
  final String name;
  final String flag;
  final String code;
  final String dialCode;
  final int minLength;
  final int maxLength;

  const Country({
    required this.name,
    required this.flag,
    required this.code,
    required this.dialCode,
    required this.minLength,
    required this.maxLength,
  });
}