//region Main Function

/// NOTE! Use as few Stateful widgets as possible and use as many Stateless widgets as possible.

/// Note on the stateful vs stateless widgets:
/// Statelees: Input data (can change externally) --> Widget --> Renders the UI (Re-renders when onDatasetChanged() hits)
/// Stateful: Input data (can change externally) --> Widget (internal state) --> Renders the UI (Re-renders when state data is changed)
import 'package:flutter/material.dart';

import './product_manager.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/gestures.dart';

///Main Function
void main() {
  runApp(new MyApp());
}

//endregion
/// NOTE! Use as few Stateful widgets as possible and use as many Stateless widgets as possible.

///
//region classes

///Core Root Widget. Following -- https://www.youtube.com/watch?v=6ZCz6Ylqk3A
///Come back to this after - https://github.com/2d-inc/developer_quest
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
	    home: Scaffold(
		    appBar: new AppBar(
			    title: new Text("My Test"),
		    ),
		    body: ProductManager("Initial String"),
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
