// import 'package:flutter/material.dart';
// import 'package:mobiliz/core/constants/assets.dart';
// import 'package:vector_graphics/vector_graphics.dart';

// class SvgIcon extends StatelessWidget {
//   const SvgIcon({
//     required this.icon,
//     this.fit = BoxFit.contain,
//     super.key,
//     this.width,
//     this.height,
//     this.color,
//     this.colorFilter,
//   });

//   final SvgIcons icon;
//   final double? width;
//   final double? height;
//   final BoxFit fit;
//   final Color? color;
//   final ColorFilter? colorFilter;

//   @override
//   Widget build(final BuildContext context) {
//     assert(
//       !(color != null && colorFilter != null),
//       'You cannot provide color and colorFilter at the same time',
//     );

//     var filter = colorFilter;
//     filter ??= switch (color) {
//       Color() => ColorFilter.mode(color!, BlendMode.srcIn),
//       null => null,
//     };

//     return VectorGraphic(
//       loader: AssetBytesLoader(icon.path),
//       width: width,
//       height: height,
//       colorFilter: colorFilter,
//       fit: fit,
//     );
//   }
// }
