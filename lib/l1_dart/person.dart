// tên file viết thường, phân biệt các từ bởi dấu gạch dưới: flutter_course
// tên class đặt theo Pascal: Viết hoa chữ cái của từ đầu tiên
abstract class Person {
  // non mutable
  final String name;
  final String address;
  final int age;
  String _identification = '';
  int quangduong = 0;

  void flirting();     // abstract : tính trừu tượng

  Person({
    required this.name,
    required this.age,
    required this.address,
  });

  Person.Developer(this.name, this.age) : address = '' {}

  // kiểu dữ liệu_trả_về tên_hàm(tham số)
  int run(int km) {
    quangduong += km;
    return quangduong;
  }
}
