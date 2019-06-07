//region Main Function

/// NOTE! Use as few Stateful widgets as possible and use as many Stateless widgets as possible.

/// Note on the stateful vs stateless widgets:
/// Statelees: Input data (can change externally) --> Widget --> Renders the UI (Re-renders when onDatasetChanged() hits)
/// Stateful: Input data (can change externally) --> Widget (internal state) --> Renders the UI (Re-renders when state data is changed)
/// Lifecycle Logic:
/// Stateless: Constructor --> build(). Note that build can be called multiple times
/// Stateful:  Constructor --> initState() --> build() --> setState() --> didUpdateWidget()--> build()
import 'package:flutter/material.dart';

import './product_manager.dart';
import 'package:flutter_testing_v2/pages/top_scrolling_recyclerview_page.dart';

import 'layout_type.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/gestures.dart';

///Main Function
void main() {
  runApp(new MyApp2());
}

//endregion
/// NOTE! Use as few Stateful widgets as possible and use as many Stateless widgets as possible.

///
//region classes

class MyApp2 extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			body: new ScrollingPage(
				layoutGroup: LayoutGroup.scrollable,
				onLayoutToggle: null, //todo
			),
		);
	}
}


//Currently not working, throwing exception;  type 'Color' is not a subtype of type 'MaterialColor'
//var customColor = new Color.fromRGBO(20, 20, 20, 20);

///Core Root Widget. Following -- https://www.youtube.com/watch?v=6ZCz6Ylqk3A
///Come back to this after - https://github.com/2d-inc/developer_quest
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
	        theme: new ThemeData(
		        primarySwatch: Colors.blue,
//		        primarySwatch: customColor,
		        brightness: Brightness.light,
		        
	        ),
	        home: Scaffold(
			    appBar: new AppBar(
				    title: new Text("My Test"),
			    ),
			    body: ProductManager(startingProduct : "Initial String"),
	        )
        );
	}
//	@override
//	State<StatefulWidget> createState() {
//		return new _MyAppState();
//	}

}

/// NOTE! You cannot change / handle data in a stateless widget! (Basically, it is static)
/// The Underscore serves as "private" designation
//class _MyAppState extends StatelessWidget {
class _MyAppState extends StatelessWidget {
	///Returns a {@link MaterialApp}
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			home: new Scaffold(
				appBar: new AppBar(
					title: new Text("My Test"),
				),
				body: new Column(
					children: <Widget>[
						//Container used to be here
						//Product Card went here
					],
				),
			),
		);
	}

//    @override
//    StatelessElement createElement() {
////	    return super.createElement();
//	    return new StatelessElement(this);
//    }

}

//endregion

//region Class Functions

void printStuff(var str) {
    if (str == null) {
        print("N/A");
    } else {
        print(str);
    }
}

//endregion
