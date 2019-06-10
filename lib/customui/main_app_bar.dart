import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/layout_type.dart';


class MainAppBar extends AppBar {
	MainAppBar({
		LayoutGroup layoutGroup,
		LayoutType layoutType,
		PreferredSize bottom,
		VoidCallback onLayoutToggle,
	}) : super(
		leading: new IconButton(
			icon: new Icon(
					layoutGroup == (LayoutGroup.nonScrollable)
							? Icons.filter_1 : Icons.filter_2
			),
			//Callback upon the layout toggle function
			onPressed: onLayoutToggle,
		),
		title: new Text(layoutName(layoutType)),
		elevation: 1.0,
		bottom: bottom,
	);
}
