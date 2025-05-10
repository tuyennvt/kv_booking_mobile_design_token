import 'dart:io';

import 'breakpoint_generator.dart';
import 'dimension_generator.dart';
import 'foundation_generator.dart';
import 'mobile_components_generator.dart';
import 'text_style_generator.dart';
import 'theme_generator.dart';

void main() async {
  final themeGenerator = ThemeGenerator(
    inputFile: File('assets/json/Data_of_Design_System.json'),
    outputFilePath: 'lib/theme/',
  );
  final textStyleGenerator = TextStyleGenerator(
    inputFile: File('assets/json/Text_Style.json'),
    outputFilePath: 'lib/text_style/',
  );
  final foundationGenerator = FoundationGenerator(
    inputFile: File('assets/json/Foundation.json'),
  );
  final dimensionGenerator = DimensionGenerator(
    inputFile: File('assets/json/Dimension.json'),
    outputFilePath: 'lib/dimension/',
  );
  final breakpointGenerator = BreakpointGenerator(
    inputFile: File('assets/json/Breakpoint.json'),
    outputFilePath: 'lib/breakpoint/',
  );
  final mobileComponentsGenerator = MobileComponentsGenerator(
    inputFile: File('assets/json/Mobile_Components.json'),
  );
  final kdsGenerator = DesignSystemGenerator(
    themeGenerator: themeGenerator,
    textStyleGenerator: textStyleGenerator,
    foundationGenerator: foundationGenerator,
    dimensionGenerator: dimensionGenerator,
    breakpointGenerator: breakpointGenerator,
    mobileComponentsGenerator: mobileComponentsGenerator,
  );
  await kdsGenerator.generate();
}

class DesignSystemGenerator {
  const DesignSystemGenerator({
    required this.themeGenerator,
    required this.textStyleGenerator,
    required this.foundationGenerator,
    required this.dimensionGenerator,
    required this.breakpointGenerator,
    required this.mobileComponentsGenerator,
  });

  final ThemeGenerator themeGenerator;
  final TextStyleGenerator textStyleGenerator;
  final FoundationGenerator foundationGenerator;
  final DimensionGenerator dimensionGenerator;
  final BreakpointGenerator breakpointGenerator;
  final MobileComponentsGenerator mobileComponentsGenerator;

  Future<void> generate() async {
    final kdsContentTheme = await themeGenerator.generate();
    final kdsContentTextStyle = await textStyleGenerator.generate();
    final kdsContentFoundation = await foundationGenerator.generate();
    final kdsContentDimension = await dimensionGenerator.generate();
    final kdsContentBreakpoint = await breakpointGenerator.generate();
    final kdsContentMobileComponents =
        await mobileComponentsGenerator.generate();
    final buffer = StringBuffer();
    buffer.writeln(kdsContentTheme);
    buffer.writeln(kdsContentTextStyle);
    buffer.writeln(kdsContentFoundation);
    buffer.writeln(kdsContentDimension);
    buffer.writeln(kdsContentBreakpoint);
    buffer.writeln(kdsContentMobileComponents);
    await _createFile(content: buffer.toString());
  }

  Future<void> _createFile({required String content}) async {
    final buffer = StringBuffer();
    buffer.writeln("import 'package:flutter/material.dart';");
    buffer.writeln("import 'theme/export_theme.dart';");
    buffer.writeln("import 'text_style/export_text_style.dart';");
    buffer.writeln("import 'dimension/export_dimension.dart';");
    buffer.writeln("import 'breakpoint/export_breakpoint.dart';");
    buffer.writeln("export 'theme/export_theme.dart';");
    buffer.writeln("export 'text_style/export_text_style.dart';");
    buffer.writeln("export 'dimension/export_dimension.dart';");
    buffer.writeln("export 'breakpoint/export_breakpoint.dart';");
    buffer.writeln();
    buffer.writeln('class Kds {');
    buffer.writeln('\tfactory Kds() => _instance;');
    buffer.writeln();
    buffer.writeln('\tKds._();');
    buffer.writeln();
    buffer.writeln('\tstatic final _instance = Kds._();');
    buffer.writeln();
    buffer.writeln(content);
    buffer.writeln('}');
    final file = File('lib/kv_design_token.dart');
    await file.writeAsString(buffer.toString());
  }
}
