
import 'package:flutter/material.dart';

class UIUtilities {
	
	/// This class is mainly used for building and returning UI Elements to reduce boilerplate code.
	
	/// Builds a Container with a gradient that is transparent on top and fades into 54% black transparent at the bottom.
	/// Useful for photo overlays with text
	static Container buildContainerWithGradientAtBottom(){
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
	static MaterialColor buildMaterialColorFromRGB(int r, int g, int b){
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
	static MaterialColor buildMaterialColorFromHex(String hexColor){
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
	static MaterialColor buildMaterialColorFromInt(int colorInt){
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
	static int convertHexToColorInt(String hexColor){
		hexColor = hexColor.toUpperCase().replaceAll("#", "");
		if (hexColor.length == 6) {
			hexColor = "FF" + hexColor;
		}
		return int.parse(hexColor, radix: 16);
	}
	
	/// Convert a hex String (#FAFAFA) to a Color Variable
	static Color convertHexToColor(String hexColor){
		return new Color(convertHexToColorInt(hexColor));
	}
	
	/// Build a Centered Layout Widget
	static Widget buildCenteredLayout({Widget child}) {
		return new LayoutBuilder(builder: (content, constraints) {
			Size size = buildCustomSize(constraints, null, false);
			return new Center(
				child: new Container(
					constraints: new BoxConstraints(
						maxWidth: size.width,
						maxHeight: size.height,
					),
					child: child,
				),
			);
		});
	}
	
	/// Determine the size ratio to use. If ratio passed is null and useFullScreen is null, returns golden ratio of 13/8.
	/// 	///Using a ratio of 1:1 will make for a perfect square
////		double ratio = 1 / 1;
//	///Using a ratio of 1:2 will make for a rectangle with a width > height
////		double ratio = 1 / 2;
//	///Using a ratio of 2:1 will make for a rectangle with a height > width
////		double ratio = 2 / 1;
	static Size buildCustomSize(BoxConstraints constraints, double ratio, bool useFullScreen) {
		if(useFullScreen == null){
			useFullScreen = false;
		}
		if(ratio == null) {
			/// Using a 'golden ratio' will fit phones more frequently
			ratio = 13.0 / 8.0;
		}
		if(useFullScreen){
			//This will make it full screen
			return new Size(constraints.maxWidth, constraints.maxHeight);
		} else {
			if (constraints.maxHeight / constraints.maxWidth > ratio) {
				double height = constraints.maxWidth * ratio;
				return new Size(constraints.maxWidth, height);
			} else {
				double width = constraints.maxHeight / ratio;
				return new Size(width, constraints.maxHeight);
			}
		}
	}
	
	/// Build a Widget that is centered
	static Widget centeredLayout(double ratio, bool useFullScreen, {Widget child}) {
		return new LayoutBuilder(builder: (content, constraints) {
			Size size = UIUtilities.buildCustomSize(constraints, ratio, useFullScreen);
			return new Center(
				child: new Container(
					constraints: new BoxConstraints(
						maxWidth: size.width,
						maxHeight: size.height,
					),
					child: child,
				),
			);
		});
	}
	
	static Widget buildLayoutWithColoredEdgePadding(){
	
	}
	
	/// Builds a text view with a background color, text color, and font size.
	/// The size of it is based off of a 'wrap_content' logic that uses the textFontSize to measure.
	/// More customized vars are available
	static Widget buildStandardTextView({String text = "", Color backgroundColor = Colors.white, Color textColor = Colors.black,
		AlignmentDirectional textAlignment = AlignmentDirectional.center, double textFontSize = 32.0}) {
		return new Container(
			///This alignment will adjust where the text views are
//			alignment: AlignmentDirectional.centerStart,
			alignment: textAlignment,
			color: backgroundColor,
			child: new Text(
				text,
				style: new TextStyle(color: textColor, fontSize: textFontSize),
				textAlign: TextAlign.center,
			),
		);
	}
}
