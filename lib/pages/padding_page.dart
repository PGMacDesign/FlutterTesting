import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_testing_v2/layout_type.dart';
import 'package:flutter_testing_v2/customui/main_app_bar.dart';
import 'package:flutter_testing_v2/customui/ui_builder_utils.dart';

/// Page demos how to utilize different padding values
class PaddingPage extends StatelessWidget implements HasLayoutGroup {
	PaddingPage({Key key, this.layoutGroup, this.onLayoutToggle})
			: super(key: key);
	final LayoutGroup layoutGroup;
	final VoidCallback onLayoutToggle;
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new MainAppBar(
				layoutGroup: layoutGroup,
				layoutType: LayoutType.padding,
				onLayoutToggle: onLayoutToggle,
			),
			body: new Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: [
					new VerticalPadding(
						color: Colors.green[100],
						child: UIUtilities.buildStandardTextView(text: 'First', backgroundColor: Colors.green, textColor: Colors.white),
					),
					new VerticalPadding(
						color: Colors.red[100],
						child: UIUtilities.buildStandardTextView(text: 'Second', backgroundColor: Colors.red, textColor: Colors.white),
					),
					new SizedBox(
						height: 50.0,
						child: UIUtilities.buildStandardTextView(text: '50 pt', backgroundColor: Colors.white, textColor: Colors.black),
					),
					new VerticalPadding(
						color: Colors.blue[100],
						child: UIUtilities.buildStandardTextView(text: 'Third', backgroundColor: Colors.blue, textColor: Colors.white),
					),
					new Expanded(
						flex: 1,
						child: UIUtilities.buildStandardTextView(text: 'flex: 1', backgroundColor: Colors.white),
					),
					new VerticalPadding(
						color: Colors.purple[100],
						child: UIUtilities.buildStandardTextView(text: 'Fourth', backgroundColor: Colors.purple, textColor: Colors.white, textFontSize: 30.0),
					),
					new Expanded(
						flex: 2,
						child: UIUtilities.buildStandardTextView(text: 'flex: 2', backgroundColor: Colors.white, textColor: Colors.black),
					),
					new VerticalPadding(
						color: Colors.brown[100],
						child: UIUtilities.buildStandardTextView(text: 'Fifth', backgroundColor: Colors.brown, textColor: Colors.white),
					),
				],
			),
		);
	}
}

/// Vertical Padding class that contains a centered child with padding on the edges
/// If color is null, it will default to white
class VerticalPadding extends StatelessWidget {
	VerticalPadding({
		@required this.child,
		this.padding = 16.0,
		this.color = Colors.white,
	});
	
	final double padding;
	final Widget child;
	final Color color;
	
	@override
	Widget build(BuildContext context) {
		return new Container(
			color: this.color,
			//Adds Symmetrical padding on all sides
			padding: new EdgeInsets.symmetric(vertical: padding),
			child: this.child,
		);
	}
}
