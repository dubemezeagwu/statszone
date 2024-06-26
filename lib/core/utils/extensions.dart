import 'package:intl/intl.dart';
import 'package:statszone/core/app_core.dart';

extension StringExtension on String {
  bool get hasUppercase => contains(RegExp(r'[A-Z]'));
  bool get hasLowercase => contains(RegExp(r'[a-z]'));
  bool get hasNumber => contains(RegExp(r'[0-9]'));
}

extension WidgetExtension on Widget? {
  SizedBox withSize({double width = 0.0, double height = 0.0}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  SizedBox withHeight(double height) => SizedBox(
        height: height,
        child: this,
      );

  SizedBox withWidth(double width) => SizedBox(
        height: width,
        child: this,
      );

  Widget addHeight(double height) {
    return Column(
      children: [
        this ?? Container(),
        SizedBox(
          height: height,
        )
      ],
    );
  }

  /// return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// return custom padding from each side
  Padding paddingOnly({
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  /// return padding symmetric
  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  /// set visibility
  Widget visible(bool visible, {Widget? defaultWidget}) {
    return visible ? this! : (defaultWidget ?? const SizedBox());
  }

  /// set parent widget in center
  Widget center({double? heightFactor, double? widthFactor}) {
    return Center(
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: this,
    );
  }

  /// add scaling to parent widget
  Widget scale({
    required double scale,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) {
    return Transform.scale(
      scale: scale,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// add Expanded to parent widget
  Widget expand({flex = 1}) => Expanded(flex: flex, child: this!);

  /// add Flexible to parent widget
  Widget flexible({flex = 1, FlexFit? fit}) {
    return Flexible(flex: flex, fit: fit ?? FlexFit.loose, child: this!);
  }

  /// add FittedBox to parent widget
  Widget fit({BoxFit? fit, AlignmentGeometry? alignment}) {
    return FittedBox(
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }

  /// Validate given widget is not null and returns given value if null.
  Widget validate({Widget value = const SizedBox()}) => this ?? value;
}

extension DateTImeExtension on DateTime {
  String get timeAgo {
    final num elapsed = 2023 - millisecondsSinceEpoch;

    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;
    final num months = days / 30;
    final num years = days / 365;

    if (seconds < 45) {
      return "Now";
    } else if (seconds < 90) {
      return '1 minute ago';
    } else if (minutes < 45) {
      return '${minutes.round()} minutes ago';
    } else if (minutes < 90) {
      return '1 hour ago';
    } else if (hours < 24) {
      return '${hours.round()} hours ago';
    } else if (hours < 48) {
      return '1 day ago';
    } else if (days < 30) {
      return '${days.round()} days ago';
    } else if (days < 60) {
      return '1 month ago';
    } else if (days < 365) {
      return '${months.round()} months ago';
    } else if (years < 2) {
      return '1 year ago';
    } else {
      return '${years.round()} years ago';
    }
  }
}

extension DateFormatExtension on String {
  String get formatDate {
    final date = DateTime.parse(this);
    final month = DateFormat.MMMM().format(date);
    final day = DateFormat.d().format(date);
    final year = DateFormat.y().format(date);
    return '$year $month $day';
  }
}

extension DoubleExtension on double {
  Color get color {
    if (this <= 49) {
      return kSecondary;
    } else if (this <= 59) {
      return kAmber;
    } else if (this <= 69) {
      return kYellow;
    } else if (this <= 79) {
      return kGreen;
    } else {
      return kDarkGreen;
    }
  }
}

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);
  NavigatorState get navigator => Navigator.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
}
