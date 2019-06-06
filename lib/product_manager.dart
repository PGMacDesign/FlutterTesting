import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  String startingProduct;

  ProductManager(String startingPont) {
    this.startingProduct = startingPont;
  }

  @override
  State<StatefulWidget> createState() {
    /// Note, the keyword below bypasses the need for a dedicated constructor + setting the fields + using them
    return new _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  /// List is initialized as an Array
//  List<String> _products = ["Food Tester"]; //If you use this, the first one in the list will be the String(s) here.
  List<String> _products = [];

	
    @override
    void initState() {
    	//Goes back up one tier to the *ProductManager* class.
		this._products.add(widget.startingProduct);
    	//Super is at the end on purpose
    	super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return new Column(children: [
      new Container(
        //Pixels that will be augmented by DP
        margin: EdgeInsets.all(10.0),
        child: new RaisedButton(
          onPressed: () {
            var s = "Button Clicked!";
            var y = 1;
            // This is similar to setting the adapter.setData(_products)
            this.setState(() {
              this._products.add("New Value");
            });
          },
          // Ripple Color
          splashColor: Colors.lightBlue,
          child: new Text("Add Product"),
        ),
      ),
      new Products(this._products),
    ]);
  }
}
