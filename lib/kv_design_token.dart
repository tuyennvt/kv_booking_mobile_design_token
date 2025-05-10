import 'breakpoint/breakpoint_m.dart';
import 'breakpoint/breakpoint_s.dart';
import 'design_token.dart';
import 'dimension/dimension_mobile_m.dart';
import 'dimension/dimension_mobile_s.dart';
import 'text_style/kv_text_style_desktop.dart';
import 'text_style/kv_text_style_mobile430.dart';
import 'theme/product_theme_classic.dart';
import 'theme/product_theme_keivi.dart';
import 'theme/theme_collection1java.dart';
import 'theme/theme_collection2blue.dart';
import 'theme/theme_collection3magenta.dart';
import 'theme/theme_color_collections_blue_purple.dart';

DesignToken designToken = DesignToken(
  themeCollection1: ThemeCollection1Java(),
  themeColorCollections:
      ThemeColorCollectionsBluePurple(ThemeCollection2Blue()),
  themeCollection2: ThemeCollection2Blue(),
  themeCollection3: ThemeCollection3Magenta(),
  productTheme: ProductThemeClassic(),
  kvTextStyle: KvTextStyleMobile430(),
  dimensionMobile: DimensionMobileM(),
  breakpoint: BreakpointM(),
);

void configClassicTheme({
  required FontSizeType fontSizeType,
  required DimensionType dimensionType,
  required BreakpointType breakpointType,
}) {
  final themeCollection2 = ThemeCollection2Blue();
  designToken = DesignToken(
    themeCollection1: ThemeCollection1Java(),
    themeColorCollections: ThemeColorCollectionsBluePurple(themeCollection2),
    themeCollection2: themeCollection2,
    themeCollection3: ThemeCollection3Magenta(),
    productTheme: ProductThemeClassic(),
    kvTextStyle: fontSizeType == FontSizeType.mobile
        ? KvTextStyleMobile430()
        : KvTextStyleDesktop(),
    dimensionMobile: dimensionType == DimensionType.small
        ? DimensionMobileS()
        : DimensionMobileM(),
    breakpoint:
        breakpointType == BreakpointType.small ? BreakpointS() : BreakpointM(),
  );
}

void configKeiviTheme({
  required FontSizeType fontSizeType,
  required DimensionType dimensionType,
  required BreakpointType breakpointType,
}) {
  final themeCollection2 = ThemeCollection2Blue();
  designToken = DesignToken(
    themeCollection1: ThemeCollection1Java(),
    themeColorCollections: ThemeColorCollectionsBluePurple(themeCollection2),
    themeCollection2: themeCollection2,
    themeCollection3: ThemeCollection3Magenta(),
    productTheme: ProductThemeKeivi(),
    kvTextStyle: fontSizeType == FontSizeType.mobile
        ? KvTextStyleMobile430()
        : KvTextStyleDesktop(),
    dimensionMobile: dimensionType == DimensionType.small
        ? DimensionMobileS()
        : DimensionMobileM(),
    breakpoint:
        breakpointType == BreakpointType.small ? BreakpointS() : BreakpointM(),
  );
}

enum FontSizeType {
  mobile,
  desktop,
}

enum DimensionType {
  small,
  medium,
}

enum BreakpointType {
  small,
  medium,
}
