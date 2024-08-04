import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/shared/extensions/context_exts.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({required this.url, super.key, this.width, this.height});

  final String url;
  final double? width;
  final double? height;
  @override
  Widget build(Object context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      placeholder: (context, _) => _buildPlaceHolder(context),
      errorWidget: (context, err, _) => _buildPlaceHolder(context),
      fit: BoxFit.cover,
    );
  }

  Container _buildPlaceHolder(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      color: context.colorScheme.inversePrimary,
    );
  }
}
