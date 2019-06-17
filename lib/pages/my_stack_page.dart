
import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/customui/custom_stack_layout_attributes.dart';
import 'package:flutter_testing_v2/customui/main_app_bar.dart';
import 'package:flutter_testing_v2/datamodels/pat_value_changed_data_model.dart';

import 'package:flutter_testing_v2/layout_type.dart';

/// This class shows a demo of stacking items on top of one another and adjusting the layout within those stacks
class StackPage extends StatefulWidget implements HasLayoutGroup {
	
	///Class Vars
	final LayoutGroup layoutGroup;
	final VoidCallback onLayoutToggle;
	
	///Constructor
	StackPage({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
	
	@override
	_StackPageState createState() => new _StackPageState();
	
}

class _StackPageState extends State<StackPage> {
	
	int _useAlignmentInt = 0;
	AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;
	
	AlignmentDirectional alignmentFromIndex(int index) {
		switch (index) {
			case 0:
				return AlignmentDirectional.topStart;
			case 1:
				return AlignmentDirectional.topCenter;
			case 2:
				return AlignmentDirectional.topEnd;
			case 3:
				return AlignmentDirectional.centerStart;
			case 4:
				return AlignmentDirectional.center;
			case 5:
				return AlignmentDirectional.centerEnd;
			case 6:
				return AlignmentDirectional.bottomStart;
			case 7:
				return AlignmentDirectional.bottomCenter;
			case 8:
				return AlignmentDirectional.bottomEnd;
		}
		return AlignmentDirectional.center;
	}
	
	void updateAlignment(PatValueChangedModel patValueChangedModel) {
		int index = patValueChangedModel.someValue;
		setState(() {
			this._alignmentDirectional = this.alignmentFromIndex(index);
		});
	}
	
	void updateType(PatValueChangedModel patValueChangedModel) {
		setState(() {
			this._useAlignmentInt = patValueChangedModel.someValue;
		});
	}
	
	Widget _buildStack() {
		/// This is if the first one is the 'align' option
		if (this._useAlignmentInt == 0) {
			return Stack(
				alignment: this._alignmentDirectional,
				children: <Widget>[
					new SizedBox(
						width: 300.0,
						height: 300.0,
						child: Container(
							color: Colors.green,
						),
					),
					new SizedBox(
						width: 200.0,
						height: 200.0,
						child: Container(
							color: Colors.yellow,
						),
					),
					new SizedBox(
						width: 100.0,
						height: 100.0,
						child: Container(
							color: Colors.red,
						),
					),
				],
			);
			//Second one is if using the 'position' one
		} else if (this._useAlignmentInt == 1){
			return new Stack(
				alignment: this._alignmentDirectional,
				children: <Widget>[
					new SizedBox(
						width: 300.0,
						height: 300.0,
						child: new Container(
							color: Colors.yellow,
						),
					),
					new Positioned(
						left: 20.0,
						top: 20.0,
						width: 100.0,
						height: 100.0,
						child: new Container(
							color: Colors.indigo,
						),
					),
					new Positioned(
						right: 40.0,
						top: 40.0,
						width: 100.0,
						height: 100.0,
						child: new Container(
							color: Colors.red,
						),
					),
					new Positioned(
						left: 40.0,
						bottom: 40.0,
						width: 100.0,
						height: 100.0,
						child: new Container(
							color: Colors.green,
						),
					),
					new Positioned(
						bottom: 20.0,
						right: 20.0,
						width: 100.0,
						height: 100.0,
						child: new Container(
							color: Colors.blue,
						),
					),
				],
			);
		} else {
			return new Stack(
				alignment: this._alignmentDirectional,
				children: <Widget>[
					///Even though this SizedBox is up top and the other widgets are not nested within it, they are all still constrained by it!!!
					new SizedBox(
						width: 300.0,
						height: 300.0,
						child: new Container(
							color: Colors.yellow,
						),
					),
					new Positioned(
						left: 20.0,
						top: 20.0,
						width: 100.0,
						height: 100.0,
						child: new Container(
							color: Colors.indigo,
						),
					),
					new Positioned(
						right: 40.0,
						top: 40.0,
						width: 100.0,
						height: 100.0,
						child: new Container(
							color: Colors.red,
						),
					),
					new Positioned(
						left: 40.0,
						bottom: 40.0,
						width: 100.0,
						height: 100.0,
						child: new Container(
							color: Colors.green,
						),
					),
					new Positioned(
						bottom: 20.0,
						right: 20.0,
						width: 100.0,
						height: 100.0,
						child: new Container(
							color: Colors.blue,
						),
					),
					new Positioned(
						bottom: 100,
						right: 100,
						width: 100.0,
						height: 100.0,
						child: new Center(
							child: new Text(
								"Center Text",
								textAlign: TextAlign.center,
								style: new TextStyle(
									color: Colors.black,
									fontWeight: FontWeight.bold
								),
							),
						),
					),

				],
			);
		}
	}
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new MainAppBar(
				layoutGroup: this.widget.layoutGroup,
				layoutType: LayoutType.stack,
				bottom: new PreferredSize(
					preferredSize: new Size(0.0, 80.0),
					child: this._buildLayoutAttributesPage(),
				),
				onLayoutToggle: this.widget.onLayoutToggle,
			),
			body: new Center(
				child: this._buildStack(),
			),
		);
	}
	
	Widget _buildLayoutAttributesPage() {
		return new StackLayoutAttributes(
			onUpdateType: this.updateType,
			onUpdateAlignment: this.updateAlignment,
		);
	}
}

