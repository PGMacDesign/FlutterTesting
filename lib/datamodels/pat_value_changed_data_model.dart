/// This class is used as a tester to see what replacing the callbacks that use <int> with this data model would change. Used for future reference for callbacks
class PatValueChangedModel {
	String str1;
	String str2;
	int someValue;
	
	PatValueChangedModel({
		this.str1,
		this.str2,
		this.someValue
	});
	
	/// Replacement for the GSON @Serialized annotation (with the parsed JSON at the end)
	factory PatValueChangedModel.fromJson(Map<String, dynamic> parsedJson){
		return new PatValueChangedModel(
				str1: parsedJson['str1'],
				str2 : parsedJson['str2'],
				someValue : parsedJson ['someValue']
		);
	}
}

