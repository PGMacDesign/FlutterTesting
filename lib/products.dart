import 'package:flutter/material.dart';

/// Better way is to use the stateless widget here since it allows for dddd
class Products extends StatelessWidget {
  
    List<String> _products;
    
    Products(List<String> products){
        this._products = products;
    }
    
    //Identical to the constructor above, shorthand way of writing it
//    Products(this._products);
    
    @override
    Widget build(BuildContext context) {
        return new Column(
          children: _products.map((element) => new Card(
            //Allows multiple widgets within it (Top to bottom mapping)
            child: new Column(
              //Array of Children
              children: <Widget>[
//			                new Image(image: null),
                new Image.asset("assets/landscape_sample_photo.png"),
                new Text(element),
                new FlutterLogo(
                  curve: Curves.fastLinearToSlowEaseIn,
                ),
              ],
            ),
          )).toList(
                  growable: true
          ),
        );
    }
}
