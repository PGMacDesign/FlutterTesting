
import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/datamodels/pat_value_changed_data_model.dart';

import 'custom_layout_attribute_selector.dart';
class StackLayoutAttributes extends StatefulWidget {
	StackLayoutAttributes({this.onUpdateType, this.onUpdateAlignment});
	
	final ValueChanged<PatValueChangedModel> onUpdateType;
	final ValueChanged<PatValueChangedModel> onUpdateAlignment;
	
	@override
	State<StatefulWidget> createState() => StackLayoutAttributesState();
}
class StackLayoutAttributesState extends State<StackLayoutAttributes> {
	
	bool _alignmentDisabled = false;
	
	void _updateType(PatValueChangedModel patValeChangedModel) {
		widget.onUpdateType(patValeChangedModel);
		setState(() {
			_alignmentDisabled = ((patValeChangedModel.someValue >= 1));
		});
	}
	
	@override
	Widget build(BuildContext context) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceAround,
			mainAxisSize: MainAxisSize.max,
			children: [
				Expanded(
					child: LayoutAttributeSelector(
						title: 'Type',
						values: [
							'align',
							'position',
							'pat test'
						],
						onChange: _updateType,
					),
				),
				Expanded(
					child: LayoutAttributeSelector(
						title: 'Alignment',
						values: [
							'top\nstart',
							'top\ncenter',
							'top\nend',
							'center\nstart',
							'center',
							'center\nend',
							'bottom\nstart',
							'bottom\ncenter',
							'bottom\nend',
						],
						disabled: _alignmentDisabled,
						onChange: widget.onUpdateAlignment,
					),
				),
			],
		);
	}
}
