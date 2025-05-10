import 'package:diacritic/diacritic.dart';

extension StringXNull on String? {
  bool get isNullOrEmpty {
    return this == null || this?.trim().isEmpty == true;
  }

  bool get isNotNullOrEmpty {
    return !isNullOrEmpty;
  }

  num? toNumber() {
    if (isNullOrEmpty) {
      return null;
    }
    return num.tryParse(this!);
  }

  String get lastCharacter {
    if (isNullOrEmpty) {
      return '';
    }
    return this!.substring(this!.length - 1, this!.length);
  }

  String setCharacter(int index, String character) {
    if (isNullOrEmpty) {
      return '';
    }
    if (index < 0 || index >= this!.length || character.length != 1) {
      return this!;
    }
    return this!.substring(0, index) + character + this!.substring(index + 1);
  }

  String addLastCharacter(String character) {
    if (isNullOrEmpty) {
      return character;
    }
    return '${this!}$character';
  }

  String removeLastCharacter() {
    if (isNullOrEmpty) {
      return '';
    }
    return this!.substring(0, this!.length - 1);
  }
}

extension StringX on String {
  String get toReferenceName {
    final name = standardize.replaceAll('.', '');
    return name.toFirstLowerCase;
  }

  String get toFirstLowerCase {
    return '${this[0].toLowerCase()}${substring(1)}';
  }

  String get standardize {
    return removeDiacritics(
      replaceAll(RegExp(r'\s+'), '')
          .replaceAll('-', '')
          .replaceAll('%', '')
          .replaceAll('{', '')
          .replaceAll('}', '')
          .replaceAll('(', '')
          .replaceAll(')', ''),
    );
  }

  String get toSnakeCase {
    final regex = RegExp(r'(?<=[a-z])([A-Z])');
    return replaceAllMapped(
      regex,
      (match) => '_${match.group(1)!.toLowerCase()}',
    ).toLowerCase();
  }
}
