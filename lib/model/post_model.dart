class Post {
  String? userId;
  String? title;
  String? content;
  String? date;
  String? imgUrl;


  Post(this.userId, this.title, this.content, this.date, this.imgUrl);

  Post.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        title = json["title"],
        content = json['content'],
        date = json['date'],
        imgUrl = json["imgUrl"];

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'title' : title,
    'content': content,
    'date': date,
    "imgUrl" : imgUrl
  };
}