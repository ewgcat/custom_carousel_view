import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

bool isBlank(String? value) {
   if (value == null || value.isEmpty) {
    return true;
   } else if ('null' == value.toLowerCase()) {
    return true;
   }
   return value.replaceAll(' ', '').isEmpty;
 }
/// 图片加载（支持本地与网络图片）
class LoadImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String placeholder;

  /// 在内存解码缓存指定大小(width*height)，默认true
  final bool useMemCache;

  /// 设置圆角弧度
  final BorderRadius? borderRadius;

  /// 是否使用WebP格式，默认true
  final bool isWebP;

  const LoadImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder = "assets/images/default_img.png",
    this.useMemCache = true,
    this.borderRadius,
    this.isWebP = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (isBlank(imageUrl)) {
      imageWidget =
          _LoadAssetImage(placeholder, height: height, width: width, fit: fit);
    } else if (imageUrl.startsWith('http')) {
      final Widget _image =
          _LoadAssetImage(placeholder, height: height, width: width, fit: fit);
      imageWidget = useMemCache
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (_, __) => CupertinoActivityIndicator(),
              errorWidget: (_, __, dynamic error) => _image,
              width: width,
              height: height,
              fit: fit,
              memCacheWidth: width?.toInt(),
              memCacheHeight: height?.toInt(),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (_, __) => CupertinoActivityIndicator(),
              errorWidget: (_, __, dynamic error) => _image,
              width: width,
              height: height,
              fit: fit,
            );
    } else {
      imageWidget = _LoadAssetImage(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
        cacheWidth: width?.toInt(),
        cacheHeight: height?.toInt(),
      );
    }

    if (null == borderRadius) {
      return imageWidget;
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        clipBehavior: Clip.hardEdge,
        child: imageWidget,
      );
    }
  }
}

/// 加载本地资源图片
class _LoadAssetImage extends StatelessWidget {

  final String image;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final Color? color;

  const _LoadAssetImage(this.image,
      {Key? key,
      this.width,
      this.height,
      this.cacheWidth,
      this.cacheHeight,
      this.fit,
      this.color})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool isFile = File(image).existsSync();
    return isFile
        ? Image.file(
            File(image),
            height: height,
            width: width,
            cacheWidth: cacheWidth,
            cacheHeight: cacheHeight,
            fit: fit,
            color: color,
            /// 忽略图片语义
            excludeFromSemantics: true,
          )
        : Image.asset(
            image,
            height: height,
            width: width,
            cacheWidth: cacheWidth,
            cacheHeight: cacheHeight,
            fit: fit,
            color: color,
            /// 忽略图片语义
            excludeFromSemantics: true,
          );
  }
}

