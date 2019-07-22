import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/customui/ui_builder_utils.dart';
import 'package:flutter_testing_v2/layout_type.dart';
import 'package:flutter_testing_v2/customui/main_app_bar.dart';

/// Pager Adapter From Android
class PageViewPage extends StatelessWidget implements HasLayoutGroup {
	PageViewPage({Key key, this.layoutGroup, this.onLayoutToggle})
			: super(key: key);
	final LayoutGroup layoutGroup;
	final VoidCallback onLayoutToggle;

	Widget _buildPageView() {
		/// Page view is a pager adapter from Android
		return new PageView(
			children: [
				UIUtilities.buildPageWithTextInCenter(textString: "1", backgroundColor: Colors.green),
				UIUtilities.buildPageWithTextInCenter(backgroundColor: Colors.blue),
				UIUtilities.buildPageWithTextInCenter(textString: "3", backgroundColor: Colors.indigo, textColor: Colors.amber),
				UIUtilities.buildPageWithTextInCenter(textString: null, backgroundColor: Colors.red),
				UIUtilities.buildPageWithTextInCenter(textString: "5", backgroundColor: Colors.black12, textColor: Colors.black),
			],
		);
	}
	
	///Main page is a scaffold with the App bar up top and the pager adapter below
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new MainAppBar(
				layoutGroup: layoutGroup,
				layoutType: LayoutType.pageView,
				onLayoutToggle: onLayoutToggle,
			),
			body: _buildPageView(),
		);
	}
}

