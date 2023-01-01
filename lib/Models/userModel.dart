class UserModel {
  String? name;
  String? email;
  String? uid;
  String? postId;
  String? password;
  final mySaved;

  UserModel(
      {this.mySaved,
      this.email,
      this.name,
      this.password,
      this.uid,
      this.postId});

  factory UserModel.fromMap(map) {
    return UserModel(
      email: map['email'] ?? "",
      password: map['password'] ?? "",
      uid: map['uid'] ?? "",
      postId: map['postId'] ?? "",
      name: map['name'] ?? "",
      mySaved: map['mySaved'],
    );
  }
  toMap() {
    return {
      'name': name,
      'uid': uid,
      'email': email,
      'password': password,
      'postId': postId,
      'mySaved': mySaved
    };
  }
}
