import 'package:buoi1/can_not_fly_exception.dart';
import 'package:buoi1/person.dart';

// Đơn kế thừa, chỉ kế thừa từ 1 class cha
class Developer extends Person {
  Developer({
    required String name,
    required int age,
    required String address,
  }) : super(
          name: name,
          age: age,
          address: address,
        );

  @override     // Phải override lại method abstract
  void flirting() {
    print('Làm chat bot tự nhắn tin');
  }

  void fly() {
    throw CanNotFlyException();
  }

  void _skying() {}
}
