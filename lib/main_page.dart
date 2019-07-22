import 'package:flutter/material.dart';
import 'package:flutter_testing_v2/pages/baseline_page.dart';
import 'package:flutter_testing_v2/pages/my_expanded_page.dart';
import 'package:flutter_testing_v2/pages/my_stack_page.dart';
import 'package:flutter_testing_v2/pages/page_view_page.dart';
import 'package:flutter_testing_v2/pages/row_column_demo_page.dart';
import 'package:flutter_testing_v2/pages/top_scrolling_recyclerview_page.dart';
import 'package:flutter_testing_v2/pages/padding_page.dart';

import 'layout_type.dart';
import 'package:flutter_testing_v2/misc/my_logging.dart';

///todo need to adjust the button between layouts 1/2 so that I can go back to the previous one
class MainPage extends StatefulWidget {
	MainPage({Key key}) : super(key: key);
	
	@override
	_MainPageState createState() => new _MainPageState();
}

/// Main Page State
class _MainPageState extends State<MainPage> {
	
	//region Class Vars
	
	/// This is for the horizontal scroll on the bottom nav bar
	LayoutGroup _layoutGroup = LayoutGroup.nonScrollable;
	//Layouts are for the body
	LayoutType _layoutSelection1 = LayoutType.rowColumn;
	LayoutType _layoutSelection2 = LayoutType.pageView;
	
	//endregion
	
	//region Class Methods
	
	/// Triggers whenever a layout group is being swapped
	void _onLayoutGroupToggle() {
		setState(() {
			this._layoutGroup = this._layoutGroup == LayoutGroup.nonScrollable
					? LayoutGroup.scrollable : LayoutGroup.nonScrollable;
		});
	}
	
	/// Triggers when a layout is selected
	void _onLayoutSelected(LayoutType selection) {
		setState(() {
			if (this._layoutGroup == LayoutGroup.nonScrollable) {
				this._layoutSelection1 = selection;
			} else {
				this._layoutSelection2 = selection;
			}
		});
	}
	
	/// Triggers when the bottom nav bar is selected
	void _onSelectTab(int index) {
		if (this._layoutGroup == LayoutGroup.nonScrollable) {
			switch (index) {
				case 0:
					this._onLayoutSelected(LayoutType.rowColumn);
					break;
				case 1:
					this._onLayoutSelected(LayoutType.baseline);
					break;
				case 2:
					this._onLayoutSelected(LayoutType.stack);
					break;
				case 3:
					this._onLayoutSelected(LayoutType.expanded);
					break;
				case 4:
					this._onLayoutSelected(LayoutType.padding);
					break;
			}
		} else {
			switch (index) {
				case 0:
					this._onLayoutSelected(LayoutType.pageView);
					break;
				case 1:
					this._onLayoutSelected(LayoutType.list);
					break;
				case 2:
					this._onLayoutSelected(LayoutType.slivers);
					break;
				case 3:
					this._onLayoutSelected(LayoutType.ScrollViewLayout);
					break;
				case 4:
					this._onLayoutSelected(LayoutType.nested);
					break;
			}
		}
	}
	
	/// Determines the color if it is selected or not. If it is selected, set color1, else, color2
	/// Note that this will change the color / tint of the image like Android's PorterDuff.SRC_IN logic
	Color _colorTabMatching({LayoutType layoutSelection}) {
		if (this._layoutGroup == LayoutGroup.nonScrollable) {
			return this._layoutSelection1 == layoutSelection ? Colors.lightBlue : Colors.grey;
		} else {
			return this._layoutSelection2 == layoutSelection ? Colors.lightBlue : Colors.grey;
		}
	}
	
	/// Build a bottom nav bar item (tabs at the bottom)
	BottomNavigationBarItem _buildBottomNavBarItem(
			{IconData icon, LayoutType layoutSelection}) {
		String text = layoutName(layoutSelection);
		return new BottomNavigationBarItem(
			icon: new Icon(
				icon,
				color: this._colorTabMatching(layoutSelection: layoutSelection),
			),
			title: new Text(
				text,
				style: new TextStyle(
					color: this._colorTabMatching(layoutSelection: layoutSelection),
				),
			),
		);
	}
	
	//region Main Body and Bottom Nav Bar Items
	
	/// Build the main body (Fragment) of the screen
	Widget _setupBody() {
		LayoutType layoutSelection = this._layoutGroup == (LayoutGroup.nonScrollable)
				? this._layoutSelection1
				: this._layoutSelection2;
		switch (layoutSelection) {
			case LayoutType.rowColumn:
				return new RowColumnPage(layoutGroup: this._layoutGroup, onLayoutToggle: this._onLayoutGroupToggle);
			case LayoutType.baseline:
				return new BaselinePage(layoutGroup: this._layoutGroup, onLayoutToggle: this._onLayoutGroupToggle);
			case LayoutType.stack:
				return new StackPage(layoutGroup: this._layoutGroup, onLayoutToggle: this._onLayoutGroupToggle);
			case LayoutType.expanded:
				return new ExpandedPage(layoutGroup: this._layoutGroup, onLayoutToggle: this._onLayoutGroupToggle);
			case LayoutType.padding:
				return new PaddingPage(layoutGroup: this._layoutGroup, onLayoutToggle: this._onLayoutGroupToggle);
			case LayoutType.pageView:
				return new PageViewPage(layoutGroup: this._layoutGroup, onLayoutToggle: this._onLayoutGroupToggle);
//			case LayoutType.list:
//				return new ListPage(layoutGroup: this._layoutGroup, onLayoutToggle: this._onLayoutGroupToggle);
//			case LayoutType.slivers:
//				return new SliversPage(layoutGroup: this._layoutGroup, onLayoutToggle: this._onLayoutGroupToggle);
			
			case LayoutType.ScrollViewLayout:
			default:
				return new ScrollingPage(layoutGroup: this._layoutGroup, onLayoutToggle: this._onLayoutGroupToggle);
//			case LayoutType.nested:
//				return new NestedPage(layoutGroup: _layoutGroup, onLayoutToggle: this._onLayoutGroupToggle);
		}
		return null;
	}
	
	/// Setup the bottom nav bar
	Widget _setupBottomNavigationBar() {
		if (this._layoutGroup == LayoutGroup.nonScrollable) {
			return new BottomNavigationBar(
				/// The fixed or shifting seems to augment the height and not the width. 
				type: BottomNavigationBarType.fixed,
//				type: BottomNavigationBarType.shifting,
				items: [
					this._buildBottomNavBarItem(
							icon: Icons.view_headline, layoutSelection: LayoutType.rowColumn),
					this._buildBottomNavBarItem(
							icon: Icons.format_size, layoutSelection: LayoutType.baseline),
					this._buildBottomNavBarItem(
							icon: Icons.layers, layoutSelection: LayoutType.stack),
					this._buildBottomNavBarItem(
							icon: Icons.line_weight, layoutSelection: LayoutType.expanded),
					this._buildBottomNavBarItem(
							icon: Icons.format_line_spacing, layoutSelection: LayoutType.padding),
				],
				onTap: this._onSelectTab,
			);
		} else {
			return new BottomNavigationBar(
				type: BottomNavigationBarType.fixed,
				items: [
					this._buildBottomNavBarItem(
							icon: Icons.view_week, layoutSelection: LayoutType.pageView),
					this._buildBottomNavBarItem(
							icon: Icons.format_list_bulleted, layoutSelection: LayoutType.list),
					this._buildBottomNavBarItem(
							icon: Icons.view_day, layoutSelection: LayoutType.slivers),
					this._buildBottomNavBarItem(
							icon: Icons.gradient, layoutSelection: LayoutType.ScrollViewLayout),
					this._buildBottomNavBarItem(
							icon: Icons.dashboard, layoutSelection: LayoutType.nested),
				],
				onTap: this._onSelectTab,
			);
		}
	}
	
	//endregion 
	
	//endregion
	
	//region Override Methods
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: this._setupBody(),
			bottomNavigationBar: this._setupBottomNavigationBar(),
		);
	}
	
	//endregion

}
