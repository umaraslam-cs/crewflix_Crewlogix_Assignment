// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';


class CacheImageView extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final BoxFit boxfit;
  final double circlularPadding;
  final double errorIconSize;
  final bool isHome;
  final Color imageColor;

  const CacheImageView({
    super.key,
    required this.image,
    this.height = 100,
    this.width = 100,
    this.boxfit = BoxFit.cover,
    this.circlularPadding = 10,
    this.errorIconSize = 15,
    this.isHome = false,
    this.imageColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: boxfit,
      height: height,
      width: width,
      placeholder: (context, url) => isHome
          ? const ClipOval(
              child: Image(
                image: AssetImage("assets/images/placeholder.png"),
                fit: BoxFit.cover,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(circlularPadding),
              child: const Image(
                image: AssetImage("assets/images/placeholder.png"),
                fit: BoxFit.cover,
              ),
            ),
      errorWidget: (context, url, error) => Icon(
        Icons.error_outline,
        size: errorIconSize,
      ),
    );
  }
}
