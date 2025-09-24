import 'dimension_mobile.dart';
import 'dimension_mobile_m.dart';
import 'dimension_mobile_s.dart';
import 'dimension_type.dart';

class DimensionMobileFactory {
  const DimensionMobileFactory._();

  static DimensionMobile create(DimensionMobileType dimensionType) {
    switch (dimensionType) {
      case DimensionMobileType.small:
        return DimensionMobileS();
      case DimensionMobileType.medium:
        return DimensionMobileM();
    }
  }
}
