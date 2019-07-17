
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:flutter_testing_v2/layout_type.dart';
import 'package:flutter_testing_v2/customui/ui_builder_utils.dart';

///This class houses a nested scrolling top header which will shrink and expand on movement and will have an image with text overlay.
///This is the header portion with the sticky scrollview
class PinnedScrollingImageHeader implements SliverPersistentHeaderDelegate {
	
	//region Instance Vars
	
	final LayoutGroup layoutGroup;
	final VoidCallback onLayoutToggle;
	double maxExtent;
	double minExtent;
	String imageAssetPath, topTitleTextString;
	MaterialColor topTitleTextColor;
	
	//endregion
	
	//region Constructor
	
	///Constructor
	PinnedScrollingImageHeader({
		this.layoutGroup,
		this.onLayoutToggle,
		this.minExtent,
		this.maxExtent,
		this.imageAssetPath,
		this.topTitleTextString,
		this.topTitleTextColor
	});
	
	//endregion
	
	//region Override Methods
	
	@override
	Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
		Stack toReturn = new Stack(
			fit: StackFit.expand,
			children: <Widget>[
				//Image at the top
				Image.asset(
					this.imageAssetPath,
					fit: BoxFit.cover,
				),
				//From ui_builder_utils
				UIUtilities.buildContainerWithGradientAtBottom(),
				//Custom Positioned Text
				new Positioned(
					left: 16.0,
					right: 16.0,
					bottom: 16.0,
					child: new Text(
						(this.topTitleTextString == null) ? "" : this.topTitleTextString,
						style: new TextStyle(
								fontSize: 32,
								color: (this.topTitleTextColor == null) ? Colors.white : this.topTitleTextColor
						),
					),
				)
			
			],
		);
		return toReturn;
	}
	
	@override
	bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
		return true;
	}
	
	@override
	FloatingHeaderSnapConfiguration get snapConfiguration => null;

//endregion

}