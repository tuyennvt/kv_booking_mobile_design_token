import 'breakpoint.dart';
import 'breakpoint_m.dart';
import 'breakpoint_s.dart';
import 'breakpoint_type.dart';

class BreakpointFactory {
  const BreakpointFactory._();

  static Breakpoint create(BreakpointType breakpointType) {
    switch (breakpointType) {
      case BreakpointType.small:
        return BreakpointS();
      case BreakpointType.medium:
        return BreakpointM();
    }
  }
}
