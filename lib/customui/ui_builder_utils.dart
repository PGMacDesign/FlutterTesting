
import 'package:flutter/material.dart';

/// This class is mainly used for building and returning UI Elements to reduce boilerplate code.

/// Builds a Container with a gradient that is transparent on top and fades into 54% black transparent at the bottom.
/// Useful for photo overlays with text
Container buildContainerWithGradientAtBottom(){
	Container c = new Container(
		decoration: new BoxDecoration(
			gradient: new LinearGradient(
				colors: [
					Colors.transparent,
					Colors.black54
				],
				stops: [
					0.5, 1.0
				],
				begin: Alignment.topCenter,
				end: Alignment.bottomCenter,
				tileMode: TileMode.repeated
			)
		),
	);
	return c;
}

