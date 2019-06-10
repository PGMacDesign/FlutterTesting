
import 'package:flutter/material.dart';

class LayoutAttributeSelector extends StatefulWidget {
	
	LayoutAttributeSelector({
		this.title,
		this.values,
		this.disabled = false,
		this.onChange,
	});
	
	final String title;
	final List<String> values;
	final bool disabled;
	final ValueChanged<int> onChange;
	
	@override
	State<StatefulWidget> createState() => LayoutAttributeSelectorState();
}

class LayoutAttributeSelectorState extends State<LayoutAttributeSelector> {
	int valueIndex = 0;
	
	void next() {
		this.valueIndex = ((this.valueIndex + 1) < this.widget.values.length)
				? this.valueIndex + 1 : 0;
		this.update();
	}
	
	void previous() {
		this.valueIndex = (this.valueIndex > 0)
				? (this.valueIndex - 1) : (this.widget.values.length - 1);
		this.update();
	}
	
	void update() {
		this.widget.onChange(this.valueIndex);
		this.setState(() {});
	}
	
	@override
	Widget build(BuildContext context) {
		return Container(
			child: Column(children: [
				Divider(color: Colors.black54),
				Text(this.widget.title),
				Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: <Widget>[
						IconButton(
							padding: EdgeInsets.all(4.0),
							icon: Icon(Icons.arrow_back),
							onPressed: (this.widget.disabled)
									? null : previous,
						),
						Text(
							this.widget.values[this.valueIndex],
							maxLines: 2,
							textAlign: TextAlign.center,
							style: TextStyle(
								fontWeight: FontWeight.w700,
								color: (this.widget.disabled)
										? Colors.black26 : Colors.black87,
							),
						),
						IconButton(
							padding: EdgeInsets.all(4.0),
							icon: Icon(Icons.arrow_forward),
							onPressed: (this.widget.disabled)
									? null : next,
						),
					],
				),
			]),
		);
	}
}
