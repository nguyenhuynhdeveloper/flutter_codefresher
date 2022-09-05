

import 'package:flutter/material.dart';
import 'remote_event.dart';
import 'remote_state.dart';

import 'main.dart';

class Page2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text(('Page 2')),
      ),
      body: Center(
        child: StreamBuilder<RemoteState>(
          // sử dụng StreamBuilder để lắng nghe Stream <=== new
          stream: bloc.stateController.stream,
          // truyền stream của stateController vào để lắng nghe <=== new
          initialData: bloc.state,
          // giá trị khởi tạo chính là volume 70 hiện tại <=== new
          builder: (BuildContext context, AsyncSnapshot<RemoteState> snapshot) {
            RemoteState? _newState = snapshot.data;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Text('Kênh hiện tại: ${_newState?.channel}'),
                Text('Kênh hiện tại: '),
                Text('Âm lượng hiện tại: ${_newState?.volume}')
              ],
            ); // update UI <=== new
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  //bloc.eventController.sink.add(IncrementChanelEvent(increment: 1));
                },
                // add event <=== new
                child: Icon(Icons.plus_one),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  //bloc.eventController.sink.add(DecrementChannelEvent());
                },
                // add event <=== new
                child: Icon(Icons.exposure_minus_1),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  bloc.eventController.sink.add(IncrementEvent(5));
                },
                // add event <=== new
                child: Icon(Icons.volume_up),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  bloc.eventController.sink.add(DecrementEvent(10));
                },
                // add event <=== new
                child: Icon(Icons.volume_down),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  bloc.eventController.sink.add(MuteEvent());
                },
                // add event <=== new
                child: Icon(Icons.volume_mute),
              )
            ],
          )
        ],
      ),
    );
  }

}