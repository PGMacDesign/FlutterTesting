import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/layout_type.dart';
import 'package:flutter_testing_v2/customui/main_app_bar.dart';
import 'package:flutter_testing_v2/customui/baseline_layout_attributes.dart';

class BaselinePage extends StatefulWidget implements HasLayoutGroup {
	BaselinePage({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
	final LayoutGroup layoutGroup;
	final VoidCallback onLayoutToggle;
	
	@override
	State<StatefulWidget> createState() => new BaselinePageState();
}

class BaselinePageState extends State<BaselinePage> {
	CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.baseline;
	
	CrossAxisAlignment _crossAxisAlignmentFromIndex(int index) {
		switch (index) {
			case 0:
				return CrossAxisAlignment.baseline;
			case 1:
				return CrossAxisAlignment.start;
			case 2:
				return CrossAxisAlignment.end;
			case 3:
				return CrossAxisAlignment.center;
			case 4:
				return CrossAxisAlignment.stretch;
		}
		return CrossAxisAlignment.start;
	}
	
	void _updateCrossAxisAlignment(int index) {
		setState(() {
			this._crossAxisAlignment = _crossAxisAlignmentFromIndex(index);
		});
	}
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new MainAppBar(
				layoutGroup: this.widget.layoutGroup,
				layoutType: LayoutType.baseline,
				bottom: new PreferredSize(
					preferredSize: new Size(0.0, 80.0),
					child: _buildLayoutAttributesPage(),
				),
				onLayoutToggle: this.widget.onLayoutToggle,
			),
			body: new Container(
				padding: new EdgeInsets.all(15.0),
				child: _buildContent(),
			),
		);
	}
	
	Widget _buildContent() {
		return new Column(
			children: [
				new Container(
					color: Colors.yellow,
					child: new Row(
						crossAxisAlignment: this._crossAxisAlignment,
						textBaseline: TextBaseline.alphabetic,
						children: [
							new Text(
								'Flutter',
								style: new TextStyle(fontSize: 24.0, color: Colors.blue),
							),
							new SizedBox(width: 5.0),
							new Text(
								'Layout',
								style: new TextStyle(fontSize: 32.0, color: Colors.red),
							),
							new SizedBox(width: 5.0),
							new Text(
								'Is',
								style: new TextStyle(fontSize: 18.0, color: Colors.indigo),
							),
							new SizedBox(width: 5.0),
							new Text(
								'Great',
								style: new TextStyle(fontSize: 26.0, color: Colors.green),
							),
						],
					),
				),
				new SizedBox(height: 30.0),
				new Container(
					color: Colors.yellow,
					child: new Row(
						crossAxisAlignment: this._crossAxisAlignment,
						textBaseline: TextBaseline.alphabetic,
						children: [
							new Text(
								'Big',
								style: new TextStyle(fontSize: 48.0, color: Colors.blue),
							),
							new SizedBox(width: 5.0),
							new Text(
								'Medium',
								style: new TextStyle(fontSize: 32.0, color: Colors.red),
							),
							new SizedBox(width: 5.0),
							new Text(
								'Small',
								style: new TextStyle(fontSize: 16.0, color: Colors.indigo),
							),
						],
					),
				),
			],
		);
	}
	
	Widget _buildLayoutAttributesPage() {
		return new BaselineLayoutAttributes(
			onUpdateCrossAxisAlignment: this._updateCrossAxisAlignment,
		);
	}
}

