import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/datamodels/pat_value_changed_data_model.dart';
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
	
	CrossAxisAlignment _crossAxisAlignmentFromIndex(PatValueChangedModel valueChangedModel) {
		int index = valueChangedModel.someValue;
		switch (index) {
			case 0:
				//Everything aligned with the bottom; looks like a structured sentence, slight margin on the bottom to better fit. Definitely looks cleanest
				return CrossAxisAlignment.baseline;
			case 1:
				//Everything is aligned with on top. NOTE! This is different than android (start) and means top instead of left?
				return CrossAxisAlignment.start;
			case 2:
				//Everything is aligned with on bottom. NOTE! This is different than android (end) and means bottom instead of right?
				return CrossAxisAlignment.end;
			case 3:
				//Everything is centered (Mirrors gravity == center from Android)
				return CrossAxisAlignment.center;
			case 4:
				return CrossAxisAlignment.stretch;
		}
		return CrossAxisAlignment.start;
	}
	
	///Callback function that is passed in order to update which alignment is to be set
	void _updateCrossAxisAlignment(PatValueChangedModel patChangedModel) {
		setState(() {
			this._crossAxisAlignment = _crossAxisAlignmentFromIndex(patChangedModel);
		});
	}
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			///Building our own [MainAppBar]
			appBar: new MainAppBar(
				layoutGroup: this.widget.layoutGroup,
				layoutType: LayoutType.baseline,
				///This is adjusting the bottom of the nav bar that is up top; little bit misleading, but it is the size of the object (Height)
				bottom: new PreferredSize(
					preferredSize: new Size(0.0, 80.0),
					child: this._buildLayoutAttributesPage(),
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
					///This row is making a horizontal View with multiple text views
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

