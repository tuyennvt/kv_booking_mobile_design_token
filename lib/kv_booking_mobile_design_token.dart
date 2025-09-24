import 'src/breakpoint/breakpoint_factory.dart';
import 'src/breakpoint/breakpoint_type.dart';
import 'src/design_token.dart';
import 'src/dimension/dimension_mobile_factory.dart';
import 'src/dimension/dimension_type.dart';
import 'src/text_style/font_size_type.dart';
import 'src/text_style/kv_text_style_factory.dart';
import 'src/theme/product_theme_classic.dart';
import 'src/theme/product_theme_keivi.dart';
import 'src/theme/theme_collection1java.dart';
import 'src/theme/theme_collection2blue.dart';
import 'src/theme/theme_collection3magenta.dart';
import 'src/theme/theme_color_collections_blue_purple.dart';

export 'src/breakpoint/breakpoint_type.dart';
export 'src/dimension/dimension_type.dart';
export 'src/text_style/font_size_type.dart';

var designToken = DesignToken(
  themeCollection1: ThemeCollection1Java(),
  themeColorCollections:
      ThemeColorCollectionsBluePurple(ThemeCollection2Blue()),
  themeCollection2: ThemeCollection2Blue(),
  themeCollection3: ThemeCollection3Magenta(),
  productTheme: ProductThemeClassic(),
  kvTextStyle: KvTextStyleFactory.create(FontSizeType.mobile),
  dimensionMobile: DimensionMobileFactory.create(DimensionMobileType.medium),
  breakpoint: BreakpointFactory.create(BreakpointType.medium),
);

void configDesignToken({
  required bool isKeivi,
  required FontSizeType fontSizeType,
  required DimensionMobileType dimensionType,
  required BreakpointType breakpointType,
}) {
  final themeCollection2 = ThemeCollection2Blue();
  designToken = DesignToken(
    themeCollection1: ThemeCollection1Java(),
    themeColorCollections: ThemeColorCollectionsBluePurple(themeCollection2),
    themeCollection2: themeCollection2,
    themeCollection3: ThemeCollection3Magenta(),
    productTheme: isKeivi ? ProductThemeKeivi() : ProductThemeClassic(),
    kvTextStyle: KvTextStyleFactory.create(fontSizeType),
    dimensionMobile: DimensionMobileFactory.create(dimensionType),
    breakpoint: BreakpointFactory.create(breakpointType),
  );
}
