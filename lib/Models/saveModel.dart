class SaveModel {
  String? postName;
  String? postDes;
  String? uid;
  String? postImage;
  String? postId;
  SaveModel(
      {this.postId, this.postDes, this.postName, this.postImage, this.uid});

  factory SaveModel.fromMap(map) {
    return SaveModel(
      postId: map['postId'] ?? "",
      postDes: map['postDes'] ?? "",
      postImage: map['postImage'] ?? "",
      uid: map['uid'] ?? "",
      postName: map['postName'] ?? "",
    );
  }
  toMap() {
    return {
      'postName': postName,
      'uid': uid,
      'postDes': postDes,
      'postImage': postImage,
      'postId': postId,
    };
  }
}
