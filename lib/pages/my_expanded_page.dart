import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/layout_type.dart';
import 'package:flutter_testing_v2/customui/main_app_bar.dart';

class ExpandedPage extends StatelessWidget implements HasLayoutGroup {
	final LayoutGroup layoutGroup;
	final VoidCallback onLayoutToggle;

	ExpandedPage(
			{Key key, this.layoutGroup, this.onLayoutToggle}
			) : super(key: key);
	
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
	
	Widget _buildBox({int points, Color color, Color textColor = Colors.white}) {
		return new Expanded(
			flex: points,
			child: new Container(
				constraints: new BoxConstraints.expand(),
				color: color,
				child: new Center(
					child: new Text(
						'$points',
						style: new TextStyle(fontSize: 32.0, color: textColor),
					),
				),
			),
		);
	}
	
	Size _goldenRatio(BoxConstraints constraints) {
		double ratio = 13.0 / 8.0;
		if (constraints.maxHeight / constraints.maxWidth > ratio) {
			double height = constraints.maxWidth * ratio;
			return new Size(constraints.maxWidth, height);
		} else {
			double width = constraints.maxHeight / ratio;
			return new Size(width, constraints.maxHeight);
		}
	}
	
	Widget _centeredLayout({Widget child}) {
		return new LayoutBuilder(builder: (content, constraints) {
			Size size = this._goldenRatio(constraints);
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
	
	Widget _buildContent() {
		return this._centeredLayout(
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
