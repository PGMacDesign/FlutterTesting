
import 'package:flutter_testing_v2/customui/custom_row_column_layout_attributes.dart';
import 'package:flutter_testing_v2/datamodels/pat_value_changed_data_model.dart';
import 'package:flutter_testing_v2/layout_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/customui/main_app_bar.dart';

///This class features the demoing of some layout changing on the fly
class RowColumnPage extends StatefulWidget implements HasLayoutGroup {
	
	RowColumnPage({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
	final LayoutGroup layoutGroup;
	final VoidCallback onLayoutToggle;
	
	@override
	_RowColumnPageState createState() => new _RowColumnPageState();
	
}

class _RowColumnPageState extends State<RowColumnPage> {
	
	//region Class Methods
	bool _isRow = true;
	MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
	CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;
	MainAxisSize _mainAxisSize = MainAxisSize.min;
	
	//endregion
	
	//region Misc Update Methods
	
	void _updateLayout(PatValueChangedModel patChangedModel) {
		int index = patChangedModel.someValue;
		setState(() {
			this._isRow = index == 0;
		});
	}
	
	//endregion
	
	//region Main Axis Alignment
	
	/// This is the top right adjuster option that allows for changing the alignment
	MainAxisAlignment _mainAxisAlignmentFromIndex(PatValueChangedModel patChangedModel) {
		int index = patChangedModel.someValue;
		switch (index) {
			case 0:
				return MainAxisAlignment.start;
			case 1:
				return MainAxisAlignment.end;
			case 2:
				return MainAxisAlignment.center;
			case 3:
				return MainAxisAlignment.spaceBetween;
			case 4:
				return MainAxisAlignment.spaceAround;
			case 5:
				return MainAxisAlignment.spaceEvenly;
		}
		return MainAxisAlignment.start;
	}
	
	void _updateMainAxisAlignment(PatValueChangedModel patChangedModel) {
		int index = patChangedModel.someValue;
		setState(() {
			this._mainAxisAlignment = this._mainAxisAlignmentFromIndex(new PatValueChangedModel(someValue: index));
		});
	}
	
	//endregion
	
	//region Cross Axis Alignment
	
	/// This is for the bottom right option that allows for changing the alignment
	CrossAxisAlignment _crossAxisAlignmentFromIndex(PatValueChangedModel patChangedModel) {
		int index = patChangedModel.someValue;
		switch (index) {
			case 0:
				return CrossAxisAlignment.start;
			case 1:
				return CrossAxisAlignment.end;
			case 2:
				return CrossAxisAlignment.center;
			case 3:
				return CrossAxisAlignment.stretch;
			case 4:
				return CrossAxisAlignment.baseline;
		}
		return CrossAxisAlignment.start;
	}
	
	void _updateCrossAxisAlignment(PatValueChangedModel patChangedModel) {
		int index = patChangedModel.someValue;
		setState(() {
			this._crossAxisAlignment = this._crossAxisAlignmentFromIndex(new PatValueChangedModel(someValue: index));
		});
	}
	//endregion
	
	//region Main Axis Size under the flex.dart file
	void _updateMainAxisSize(PatValueChangedModel patChangedModel) {
		int index = patChangedModel.someValue;
		setState(() {
			this._mainAxisSize = index == 0 ? MainAxisSize.min : MainAxisSize.max;
		});
	}
	
	//endregion
	
	//region Build the Content (Body) section
	Widget buildContent() {
		if (this._isRow) {
			return Row(
				mainAxisAlignment: _mainAxisAlignment,
				crossAxisAlignment: _crossAxisAlignment,
				mainAxisSize: _mainAxisSize,
				children: [
					Icon(Icons.stars, size: 50.0),
					Icon(Icons.ac_unit, size: 100.0),
					Icon(Icons.stars, size: 50.0),
				],
			);
		} else {
			return Column(
				mainAxisAlignment: _mainAxisAlignment,
				crossAxisAlignment: _crossAxisAlignment,
				mainAxisSize: _mainAxisSize,
				children: [
					Icon(Icons.stars, size: 50.0),
					Icon(Icons.ac_unit, size: 100.0),
					Icon(Icons.stars, size: 50.0),
				],
			);
		}
	}
	
	//endregion
	
	//region Build the Attributes Page
	Widget _buildLayoutAttributesPage() {
		return RowColumnLayoutAttributes(
			onUpdateLayout: _updateLayout,
			onUpdateMainAxisAlignment: _updateMainAxisAlignment,
			onUpdateCrossAxisAlignment: _updateCrossAxisAlignment,
			onUpdateMainAxisSize: _updateMainAxisSize,
		);
	}
	
	
	//endregion
	
	//region Override Methods
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: MainAppBar(
				layoutGroup: widget.layoutGroup,
				layoutType: LayoutType.rowColumn,
				bottom: PreferredSize(
					preferredSize: Size(0.0, 160.0),
					child: _buildLayoutAttributesPage(),
				),
				onLayoutToggle: widget.onLayoutToggle,
			),
			body: Container(color: Colors.yellow, child: buildContent()),
		);
	}

	//endregion

}

