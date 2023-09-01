
// Khai báo ra 1 lớp class Album
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  //Khai báo 1 constructor tĩnh tên là fromJson có tham số nhận vào là 1 Map<String, dynamic>
  static Album fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  static Album fromJsonForMethodPOST (Map<String, dynamic> json) {
    return Album(
      userId: json['id'],
      id: json['id'],
      title: json['title'],
    );
  }
}

