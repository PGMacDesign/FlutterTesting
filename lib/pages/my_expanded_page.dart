import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/layout_type.dart';
import 'package:flutter_testing_v2/customui/main_app_bar.dart';
import 'package:flutter_testing_v2/customui/ui_builder_utils.dart';

/// Class shows boxes expanding the screen and how the different ratios affect how it is drawn
class ExpandedPage extends StatelessWidget implements HasLayoutGroup {
	final LayoutGroup layoutGroup;
	final VoidCallback onLayoutToggle;

	/// Main Constructor
	ExpandedPage(
			{Key key, this.layoutGroup, this.onLayoutToggle}
			) : super(key: key);
	
	/// Main Build Operator
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new MainAppBar(
				layoutGroup: this.layoutGroup,
				layoutType: LayoutType.expanded,
				onLayoutToggle: this.onLayoutToggle,
			),
			body: new Container(
				child: this._buildContent(),
			),
		);
	}
	
	///Builds a single box to use. The vars passed in determine the various size arguments
	Widget _buildBox({int points, Color color, Color textColor = Colors.white}) {
		var fontsizeVar = 10.0;
		fontsizeVar = (fontsizeVar * ((points >= 1) ? points : 1));
		if(fontsizeVar >= 100){
			fontsizeVar = 100;
		}
		return new Expanded(
			flex: points,
			child: new Container(
				constraints: new BoxConstraints.expand(),
//				constraints: new BoxConstraints.tightForFinite(),
				color: color,
				child: new Center(
					child: new Text(
						'$points',
						style: new TextStyle(fontSize: fontsizeVar, color: textColor),
					),
				),
			),
		);
	}
	
	/// Builds the return size of the entire layout (all sub-layouts nested within this)
	static Size _goldenRatio(BoxConstraints constraints) {
		return _goldenRatio2(constraints, false);
	}
	
	/// Need to research Overloading more - https://medium.com/@dumazy/enhance-your-classes-with-operator-overloading-in-dart-f1124bd813a0
	/// Builds the return size of the entire layout (all sub-layouts nested within this)
	static Size _goldenRatio2(BoxConstraints constraints, bool useFullScreen) {
		///Using a 'golden ratio' will fit phones more frequently
		double ratio = 13.0 / 8.0;
		///Using a ratio of 1:1 will make for a perfect square
//		double ratio = 1 / 1;
		///Using a ratio of 1:2 will make for a rectangle with a width > height
//		double ratio = 1 / 2;
		///Using a ratio of 2:1 will make for a rectangle with a height > width
//		double ratio = 2 / 1;
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
	
	
	/// This builds out the boxes on the screen
	Widget _buildContent() {
		return UIUtilities.centeredLayout(null, true,
			child: new Column(
				children: [
					this._buildBox(points: 8, color: Colors.red),
					new Expanded(
						flex: 5,
						child: new Row(
							children: [
								this._buildBox(points: 5, color: Colors.indigo),
								new Expanded(
									flex: 3,
									child: new Column(
										children: [
											new Expanded(
												flex: 2,
												child: new Row(
													children: [
														new Expanded(
															flex: 1,
															child: new Column(
																children: [
																	this._buildBox(points: 1, color: Colors.green),
																	this._buildBox(points: 1, color: Colors.blue),
																	new Expanded(
																		flex: 1,
																		child: new Column(
																			children: [
																				this._buildBox(points: 1, color: Colors.orange),
																				this._buildBox(points: 1, color: Colors.yellow),
																			],
																		),
																	),
																],
															),
														),
														this._buildBox(points: 2, color: Colors.brown),
													],
												),
											),
											this._buildBox(points: 3, color: Colors.purple),
										],
									),
								),
							],
						),
					),
				],
			),
		);
	}
}
