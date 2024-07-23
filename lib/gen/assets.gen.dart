/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/fee_send_image.png
  AssetGenImage get feeSendImage =>
      const AssetGenImage('assets/images/fee_send_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [feeSendImage];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/CaretDown.svg
  SvgGenImage get caretDown => const SvgGenImage('assets/svg/CaretDown.svg');

  /// File path: assets/svg/CheckCircle.svg
  SvgGenImage get checkCircle =>
      const SvgGenImage('assets/svg/CheckCircle.svg');

  /// File path: assets/svg/LineSegment.svg
  SvgGenImage get lineSegment =>
      const SvgGenImage('assets/svg/LineSegment.svg');

  /// File path: assets/svg/ListNumbers.svg
  SvgGenImage get listNumbers =>
      const SvgGenImage('assets/svg/ListNumbers.svg');

  /// File path: assets/svg/MapTrifold.svg
  SvgGenImage get mapTrifold => const SvgGenImage('assets/svg/MapTrifold.svg');

  /// File path: assets/svg/SignOut.svg
  SvgGenImage get signOut => const SvgGenImage('assets/svg/SignOut.svg');

  /// File path: assets/svg/TrafficSignal.svg
  SvgGenImage get trafficSignal =>
      const SvgGenImage('assets/svg/TrafficSignal.svg');

  /// File path: assets/svg/arrowUp.svg
  SvgGenImage get arrowUp => const SvgGenImage('assets/svg/arrowUp.svg');

  /// File path: assets/svg/calendar-2.svg
  SvgGenImage get calendar2 => const SvgGenImage('assets/svg/calendar-2.svg');

  /// File path: assets/svg/car_number.svg
  SvgGenImage get carNumber => const SvgGenImage('assets/svg/car_number.svg');

  /// File path: assets/svg/category.svg
  SvgGenImage get category => const SvgGenImage('assets/svg/category.svg');

  /// File path: assets/svg/feeIsSendIcon.svg
  SvgGenImage get feeIsSendIcon =>
      const SvgGenImage('assets/svg/feeIsSendIcon.svg');

  /// File path: assets/svg/mdi_mountain.svg
  SvgGenImage get mdiMountain =>
      const SvgGenImage('assets/svg/mdi_mountain.svg');

  /// File path: assets/svg/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/svg/profile.svg');

  /// File path: assets/svg/receipt-minus.svg
  SvgGenImage get receiptMinus =>
      const SvgGenImage('assets/svg/receipt-minus.svg');

  /// File path: assets/svg/translate.svg
  SvgGenImage get translate => const SvgGenImage('assets/svg/translate.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        caretDown,
        checkCircle,
        lineSegment,
        listNumbers,
        mapTrifold,
        signOut,
        trafficSignal,
        arrowUp,
        calendar2,
        carNumber,
        category,
        feeIsSendIcon,
        mdiMountain,
        profile,
        receiptMinus,
        translate
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  SvgPicture svg({
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
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
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
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
