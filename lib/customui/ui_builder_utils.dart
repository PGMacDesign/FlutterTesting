
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

/// Build and return a Primary color Object
MaterialColor buildMaterialColorFromRGB(int r, int g, int b){
	Color baseColor = new Color.fromRGBO(r, g, b, 0.5);
	Map<int, Color> color = {
		50:Color.fromRGBO(r, g, b, .1),
		100:Color.fromRGBO(r, g, b, .2),
		200:Color.fromRGBO(r, g, b, .3),
		300:Color.fromRGBO(r, g, b, .4),
		400:Color.fromRGBO(r, g, b, .5),
		500:Color.fromRGBO(r, g, b, .6),
		600:Color.fromRGBO(r, g, b, .7),
		700:Color.fromRGBO(r, g, b, .8),
		800:Color.fromRGBO(r, g, b, .9),
		900:Color.fromRGBO(r, g, b, 1),
	};
	return new MaterialColor(baseColor.value, color);
}

/// Build and return a Material color Object
MaterialColor buildMaterialColorFromHex(String hexColor){
	Color baseColor = convertHexToColor(hexColor);
	Map<int, Color> color = {
		50:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .1),
		100:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .2),
		200:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .3),
		300:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .4),
		400:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .5),
		500:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .6),
		600:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .7),
		700:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .8),
		800:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .9),
		900:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, 1),
	};
	return new MaterialColor(baseColor.value, color);
}

/// Build and return a Material color Object
MaterialColor buildMaterialColorFromInt(int colorInt){
	Color baseColor = new Color(colorInt);
	Map<int, Color> color = {
		50:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .1),
		100:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .2),
		200:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .3),
		300:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .4),
		400:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .5),
		500:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .6),
		600:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .7),
		700:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .8),
		800:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, .9),
		900:Color.fromRGBO(baseColor.red, baseColor.green, baseColor.blue, 1),
	};
	return new MaterialColor(baseColor.value, color);
}

/// Convert a hex String (#FAFAFA) to an int value
int convertHexToColorInt(String hexColor){
	hexColor = hexColor.toUpperCase().replaceAll("#", "");
	if (hexColor.length == 6) {
		hexColor = "FF" + hexColor;
	}
	return int.parse(hexColor, radix: 16);
}

/// Convert a hex String (#FAFAFA) to a Color Variable
Color convertHexToColor(String hexColor){
	return new Color(convertHexToColorInt(hexColor));
}