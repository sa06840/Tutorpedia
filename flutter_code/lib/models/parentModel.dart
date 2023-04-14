class ParentModel {
  String? uid;
  String? email;
  String? firstName;
  String? studentCode;

  ParentModel({this.uid, this.email, this.firstName, this.studentCode});

  // receiving data from server
  factory ParentModel.fromMap(map) {
    return ParentModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      studentCode: map['studentCode'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'studentCode': studentCode,
    };
  }
}
