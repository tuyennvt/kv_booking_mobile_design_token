import 'font_size_type.dart';
import 'kv_text_style.dart';
import 'kv_text_style_desktop.dart';
import 'kv_text_style_mobile430.dart';

class KvTextStyleFactory {
  const KvTextStyleFactory._();

  static KvTextStyle create(FontSizeType fontSizeType) {
    switch (fontSizeType) {
      case FontSizeType.mobile:
        return KvTextStyleMobile430();
      case FontSizeType.desktop:
        return KvTextStyleDesktop();
    }
  }
}
