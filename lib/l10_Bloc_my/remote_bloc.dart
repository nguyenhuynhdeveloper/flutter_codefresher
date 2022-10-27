

import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'remote_event.dart';
import 'remote_state.dart';

class RemoteBloc {
  var state = RemoteState(70); // init giá trị khởi tạo của RemoteState. Giả sử TV ban đầu có âm lượng 70

  // tạo 2 controller
  // 1 cái quản lý event, đảm nhận nhiệm vụ nhận event từ UI
  final eventController = StreamController<RemoteEvent>();   // <RemoteEvent> là kiểu dữ liệu trả về

  // 1 cái quản lý state, đảm nhận nhiệm vụ truyền state đến UI
  //final stateController = StreamController<RemoteState>();   //Cái này không thể lắng nghe ở nhiều màn hình
  final stateController = BehaviorSubject<RemoteState>();  // <RemoteState> Là kiểu dữ liệu trả về

  RemoteBloc() {
    // lắng nghe khi eventController push event mới
    eventController.stream.listen((RemoteEvent event) {
      // người ta thường tách hàm này ra 1 hàm riêng và đặt tên là: mapEventToState
      // đúng như cái tên, hàm này nhận event xử lý và cho ra output là state

      if (event is IncrementEvent) {
        // nếu eventController vừa add vào 1 IncrementEvent thì chúng ta xử lý tăng âm lượng
        state = RemoteState(state.volume + event.increment);
      } else if (event is DecrementEvent) {
        // xử lý giảm âm lượng
        state = RemoteState(state.volume - event.decrement);
      } else {
        // xử lý mute
        state = RemoteState(0);
      }

      // add state mới vào stateController để bên UI nhận được
      stateController.sink.add(state);
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}


class ChannelBloc {
  var channelState = ChannelState(10);

  final channelEventController = StreamController<ChannelEvent>();
  final channelStateController = BehaviorSubject<ChannelState>();

  ChannelBloc() {
    channelEventController.stream.listen((ChannelEvent event) {
      if (event is ChannelIncrementEvent) {
        channelState = ChannelState(channelState.channel + event.increment);
      } else if (event is ChannelDecrementEvent) {
        channelState = ChannelState(channelState.channel - event.decrement);
      } else {
        channelState = ChannelState(0);
      }
      channelStateController.sink.add(channelState);
    });
  }
  void dispose() {
    channelStateController.close();
    channelEventController.close();
  }
}

