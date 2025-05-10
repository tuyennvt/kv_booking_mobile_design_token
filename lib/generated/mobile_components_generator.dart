import 'dart:convert';
import 'dart:io';

import 'color_token_parser.dart';
import 'number_token_parser.dart';

class MobileComponentsGenerator {
  MobileComponentsGenerator({
    required this.inputFile,
  }) {
    _kdsRows = <String>{};
  }

  final File inputFile;

  late final Set<String> _kdsRows;

  Future<String> generate() async {
    final fileContent = await inputFile.readAsString();
    final List<dynamic> json = jsonDecode(fileContent);

    final kdsContent = StringBuffer();

    for (final element in json) {
      kdsContent.writeln(_getKvDesignTokenContent(element));
    }
    return kdsContent.toString();
  }

  String _getKvDesignTokenContent(Map<String, dynamic> json) {
    final buffer = StringBuffer();
    _parseTokenForKvDesignToken(
      json,
      buffer,
    );
    return buffer.toString();
  }

  void _parseTokenForKvDesignToken(
    Map<String, dynamic> json,
    StringBuffer buffer, {
    String parentKey = '',
  }) {
    json.forEach((jsonKey, jsonValue) {
      final currentKey = parentKey.isEmpty ? jsonKey : '$parentKey.$jsonKey';
      if (jsonValue.containsKey('type') && jsonValue.containsKey('value')) {
        final type = jsonValue['type'];
        final value = jsonValue['value'];
        switch (type) {
          case 'color':
            final colorTokenParser = ColorTokenParser(
              currentKey,
              value,
            );
            final result = colorTokenParser.parse();
            if (_kdsRows.add(result)) {
              buffer.writeln(result);
            }
            break;
          case 'number':
            final numberTokenParser = NumberTokenParser(
              currentKey,
              value,
            );
            final result = numberTokenParser.parse();
            if (_kdsRows.add(result)) {
              buffer.writeln(result);
            }
            break;
          default:
            print('$type is not supported');
            break;
        }
      } else {
        _parseTokenForKvDesignToken(
          jsonValue,
          buffer,
          parentKey: currentKey,
        );
      }
    });
  }
}
