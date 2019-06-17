import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/customui/custom_layout_attribute_selector.dart';
import 'package:flutter_testing_v2/datamodels/pat_value_changed_data_model.dart';


class BaselineLayoutAttributes extends StatefulWidget {
	BaselineLayoutAttributes({this.onUpdateCrossAxisAlignment});
	
	final ValueChanged<PatValueChangedModel> onUpdateCrossAxisAlignment;
	
	@override
	State<StatefulWidget> createState() => new BaselineLayoutAttributesState();
}

class BaselineLayoutAttributesState extends State<BaselineLayoutAttributes> {
	@override
	Widget build(BuildContext context) {
		return new Row(
			mainAxisAlignment: MainAxisAlignment.spaceAround,
			mainAxisSize: MainAxisSize.max,
			children: [
				new Expanded(
					child: new LayoutAttributeSelector(
						title: 'Cross Axis Alignment',
						values: [
							'baseline',
							'start',
							'end',
							'center',
							//'stretch',
						],
						onChange: widget.onUpdateCrossAxisAlignment,
					),
				),
			],
		);
	}
}
