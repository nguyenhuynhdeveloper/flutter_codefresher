import 'dart:io';

class CanNotFlyException extends IOException {
  @override
  String toString() {
    return 'This object can not fly';
  }
}
