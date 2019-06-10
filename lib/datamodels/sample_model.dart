class Student {
	String studentId;
	String studentName;
	int studentScores;
	
	Student({
		this.studentId,
		this.studentName,
		this.studentScores
	});
	
	/// Replacement for the GSON @Serialized annotation
	factory Student.fromJson(Map<String, dynamic> parsedJson){
		return Student(
				studentId: parsedJson['id'],
				studentName : parsedJson['name'],
				studentScores : parsedJson ['score']
		);
	}
}

