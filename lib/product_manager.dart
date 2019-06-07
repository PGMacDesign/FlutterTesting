import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
    String startingProduct;
	final Function addProduct;
	
//  ProductManager(String startingPont) {
//    this.startingProduct = startingPont;
//  }
	
	/// Adding the curly brackets around the input var allow for access in usage (parent)
    ProductManager({this.startingProduct, this.addProduct}){
    
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
    Function someFunction;
	
    @override
    void initState() {
    	//Goes back up one tier to the *ProductManager* class.
		this._products.add(widget.startingProduct);
    	//Super is at the end on purpose
    	super.initState();
    }

  @override
  Widget build(BuildContext context) {
//    	Scrollable scrollable = new Scrollable(
//		    viewportBuilder: null,
//		    axisDirection: AxisDirection.down,
//		    controller: new ScrollController(
//			    initialScrollOffset: 0.0,
//			    keepScrollOffset: true
//		    ),
//	    );
	    return new Column(children: [
		  new Container(
			  //Pixels that will be augmented by DP
			  margin: EdgeInsets.all(10.0),
			  child: new RaisedButton(
				  onPressed: () {
					  var s = "Button Clicked!";
					  var y = 1;
					  // This is similar to setting the adapter.setData(_products)
					  /// This way of doing it is passing down from parent class and updating here.
					  this.setState(() {
						  this._products.add("New Value");
					  });
					  /// This way of doing it is passing back up the chain to the parent widget and letting it handle it. References the function passed down!
//					  this.widget.addProduct("dddd");
				  },
				  // Ripple Color
				  splashColor: Colors.deepPurple,
				  color: Theme
						  .of(context)
						  .primaryColor,
				  elevation: 8,
				  textColor: Colors.white,
				  disabledColor: Colors.grey,
				  child: new Text("Add Product"),
			  ),
		  ),
		  new Products(this._products),
	  ]);
  }

    /// This is the equivalent of setData + notifyDatasetChanged() in a recyclerview
    @override
    void didUpdateWidget(ProductManager oldWidget) {
	    super.didUpdateWidget(oldWidget);
    }
	
	
}
