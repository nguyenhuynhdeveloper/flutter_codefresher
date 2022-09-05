
//Tăng giảm âm lượng
abstract class RemoteEvent {}

// event tăng âm lượng, user muốn tăng lên bao nhiêu thì truyền vào biến increment
class IncrementEvent extends RemoteEvent {
  IncrementEvent(this.increment);
  final int increment;
}

// event giảm âm lượng, user muốn giảm bao nhiêu thì truyền vào biến decrement
class DecrementEvent extends RemoteEvent {
  DecrementEvent(this.decrement);
  final int decrement;
}

// event mute
class MuteEvent extends RemoteEvent {}

// Tăng giảm kênh
abstract class ChannelEvent {}

// event tăng kênh user muốn tăng lên bao nhiêu thì truyền vào biến increment
class ChannelIncrementEvent extends ChannelEvent {
  ChannelIncrementEvent(this.increment);
  final int increment;
}

// event giảm kênh, user muốn giảm bao nhiêu thì truyền vào biến decrement
class ChannelDecrementEvent extends ChannelEvent {
  ChannelDecrementEvent(this.decrement);
  final int decrement;
}

// // event mute
// class MuteEvent extends RemoteEvent {}



