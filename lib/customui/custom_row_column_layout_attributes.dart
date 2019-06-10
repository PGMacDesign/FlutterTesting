import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/customui/custom_layout_attribute_selector.dart';

class RowColumnLayoutAttributes extends StatelessWidget {
	RowColumnLayoutAttributes(
	  {this.onUpdateLayout,
	  this.onUpdateMainAxisAlignment,
	  this.onUpdateCrossAxisAlignment,
	  this.onUpdateMainAxisSize});
	
	final ValueChanged<int> onUpdateLayout;
	final ValueChanged<int> onUpdateMainAxisAlignment;
	final ValueChanged<int> onUpdateCrossAxisAlignment;
	final ValueChanged<int> onUpdateMainAxisSize;
	
	@override
	Widget build(BuildContext context) {
		return new Row(
		    mainAxisAlignment: MainAxisAlignment.spaceAround,
		    mainAxisSize: MainAxisSize.max,
		    children: [
			      new Expanded(
			          flex: 1,
			          child: new Column(children: <Widget>[
				        new LayoutAttributeSelector(
			              title: 'Layout',
			              values: ['row', 'column'],
			              onChange: this.onUpdateLayout,
			            ),
				        new LayoutAttributeSelector(
			              title: 'Main Axis Size',
			              values: ['min', 'max'],
			              onChange: this.onUpdateMainAxisSize,
			            ),
			          ])),
			    new Expanded(
			          flex: 1,
			          child: new Column(children: [
				          new LayoutAttributeSelector(
				              title: 'Main Axis Alignment',
				              values: [
				                'start',
				                'end',
				                'center',
				                'space\nbetween',
				                'space\naround',
				                'space\nevenly'
				              ],
				              onChange: this.onUpdateMainAxisAlignment,
				            ),
				          new LayoutAttributeSelector(
				              title: 'Cross Axis Alignment',
				              values: [
				                'start',
				                'end',
				                'center',
				                'stretch', /*'baseline'*/
				              ],
				              onChange: this.onUpdateCrossAxisAlignment,
			            ),
			          ])),
			    ]);
	}
}
