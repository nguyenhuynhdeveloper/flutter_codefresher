

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
      body: Column(
        children: [
          StreamBuilder<RemoteState>(
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

                  Text('Âm lượng hiện tại: ${_newState?.volume}')
                ],
              ); // update UI <=== new
            },
          ),
          StreamBuilder<ChannelState>(
            // sử dụng StreamBuilder để lắng nghe Stream <=== new
            stream: channelBloc.channelStateController.stream,
            // truyền stream của stateController vào để lắng nghe <=== new
            initialData: channelBloc.channelState,
            // giá trị khởi tạo chính là volume 70 hiện tại <=== new
            builder: (BuildContext context, AsyncSnapshot<ChannelState> snapshot) {
              ChannelState? _newState = snapshot.data;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text('Âm lượng hiện tại: ${_newState?.channel}')
                ],
              ); // update UI <=== new
            },
          ),
        ],
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  channelBloc.channelEventController.sink.add(ChannelIncrementEvent(1));
                },
                // add event <=== new
                child: Icon(Icons.plus_one),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  channelBloc.channelEventController.sink.add(ChannelDecrementEvent(1));
                },
                // add event <=== new
                child: Icon(Icons.exposure_minus_1),
              )
            ],
          ),
          const SizedBox(
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
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  bloc.eventController.sink.add(DecrementEvent(10));
                },
                // add event <=== new
                child: Icon(Icons.volume_down),
              ),
              const SizedBox(
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