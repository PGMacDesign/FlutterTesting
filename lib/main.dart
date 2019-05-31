//region Main Function

import 'package:flutter/material.dart';

//import 'package:flutter/cupertino.dart';
//import 'package:flutter/gestures.dart';

///Main Function
void main() {
  runApp(new MyApp());
}

//endregion

//region classes

///Core Root Widget. Following -- https://www.youtube.com/watch?v=6ZCz6Ylqk3A
///Come back to this after - https://github.com/2d-inc/developer_quest
class MyApp extends StatelessWidget {
  ///Returns a {@link MaterialApp}
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            home: new Scaffold(
                appBar: new AppBar(
                    title: new Text("My Test"),
                ),
	            body: new Card(
		            //Allows multiple widgets within it (Top to bottom mapping)
		            child: new Column(
			            //Array of Children
			            children: <Widget>[
//			                new Image(image: null),
			                new Image.asset("assets/landscape_sample_photo.png"),
				            new Text("Some stuff")
			            ],
		            ),
	            ),
            ),
        );
    }

    @override
    StatelessElement createElement() {
//	    return super.createElement();
	    return new StatelessElement(this);
    }
	
}

//endregion
