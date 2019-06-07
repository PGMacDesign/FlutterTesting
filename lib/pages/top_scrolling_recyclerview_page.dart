
import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/customui/hero_header_ui.dart';
import 'package:flutter_testing_v2/layout_type.dart';
import 'package:flutter_testing_v2/customui/ui_builder_utils.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';

//region StatelessWidget

///This is the body portion with the images loaded into (recyclerview)
class ScrollingPage extends StatelessWidget implements HasLayoutGroup {
	
	final LayoutGroup layoutGroup;
	final VoidCallback onLayoutToggle;
	
	ScrollingPage({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
	
	final List<String> assetNames = [
		'assets/travolta_lost.gif',
		'assets/landscape_sample_photo.jpg',
	];
	
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			body: _scrollView(context),
		);
	}
	
	Widget _scrollView(BuildContext context){
		Container container = new Container(
			child: new CustomScrollView(
				slivers: <Widget>[
					new SliverPersistentHeader(
						delegate: new PinnedScrollingImageHeader(
							layoutGroup: this.layoutGroup,
							onLayoutToggle: this.onLayoutToggle,
							minExtent: 150.0,
							maxExtent: 250.0,
							imageAssetPath: assetNames[1],
							topTitleTextString: "Stuff!",
							topTitleTextColor: Colors.lightBlue
						),
						pinned: true,
					),
					new SliverGrid(
						delegate: new SliverChildBuilderDelegate(
							(BuildContext context, int index) {
								return new Container(
									alignment: Alignment.center,
									padding: _edgeInsetsForIndex(index),
									child: new Image.asset(assetNames[index % assetNames.length]),
								);
							},
							childCount: assetNames.length * 10
						),
						gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
							maxCrossAxisExtent: 200.0,
							mainAxisSpacing: 0.0,
							crossAxisSpacing: 0.0,
							childAspectRatio: 0.75,
						)
					)
				],
			),
		);
		return container;
	}
}
//endregion

//region Misc Methods

EdgeInsets _edgeInsetsForIndex(int index){
	if(index %2 == 0){
		return EdgeInsets.only(
			top: 4.0, left: 8.0, right: 4.0, bottom: 4.0
		);
	} else {
		return EdgeInsets.only(
			top: 4.0, left: 4.0, right: 8.0, bottom: 4.0
		);
	}
}

//endregion