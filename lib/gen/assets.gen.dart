/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/work_sans.ttf
  String get workSans => 'assets/fonts/work_sans.ttf';

  /// List of all assets
  List<String> get values => [workSans];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_close_eye.svg
  SvgGenImage get icCloseEye => const SvgGenImage('assets/icons/ic_close_eye.svg');

  /// File path: assets/icons/ic_down_arrow.svg
  SvgGenImage get icDownArrow => const SvgGenImage('assets/icons/ic_down_arrow.svg');

  /// File path: assets/icons/ic_down_arrow_one.svg
  SvgGenImage get icDownArrowOne => const SvgGenImage('assets/icons/ic_down_arrow_one.svg');

  /// File path: assets/icons/ic_error_400.svg
  SvgGenImage get icError400 => const SvgGenImage('assets/icons/ic_error_400.svg');

  /// File path: assets/icons/ic_flag.svg
  SvgGenImage get icFlag => const SvgGenImage('assets/icons/ic_flag.svg');

  /// File path: assets/icons/ic_home.svg
  SvgGenImage get icHome => const SvgGenImage('assets/icons/ic_home.svg');

  /// File path: assets/icons/ic_open_eye.svg
  SvgGenImage get icOpenEye => const SvgGenImage('assets/icons/ic_open_eye.svg');

  /// File path: assets/icons/ic_place_holder.png
  AssetGenImage get icPlaceHolder => const AssetGenImage('assets/icons/ic_place_holder.png');

  /// File path: assets/icons/ic_report.svg
  SvgGenImage get icReport => const SvgGenImage('assets/icons/ic_report.svg');

  /// File path: assets/icons/ic_right.svg
  SvgGenImage get icRight => const SvgGenImage('assets/icons/ic_right.svg');

  /// File path: assets/icons/ic_self_assessment.svg
  SvgGenImage get icSelfAssessment => const SvgGenImage('assets/icons/ic_self_assessment.svg');

  /// File path: assets/icons/ic_setting.svg
  SvgGenImage get icSetting => const SvgGenImage('assets/icons/ic_setting.svg');

  /// List of all assets
  List<dynamic> get values => [
        icCloseEye,
        icDownArrow,
        icDownArrowOne,
        icError400,
        icFlag,
        icHome,
        icOpenEye,
        icPlaceHolder,
        icReport,
        icRight,
        icSelfAssessment,
        icSetting
      ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
