import 'package:flutter/material.dart';
import 'page2.dart';
import 'remote_bloc.dart';
import 'remote_event.dart';
import 'remote_state.dart';

final bloc = RemoteBloc();
final channelBloc = ChannelBloc();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(('Page 1')),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<RemoteState>(
              // sử dụng StreamBuilder để lắng nghe Stream <=== new
              stream: bloc.stateController.stream,
              // truyền stream của stateController vào để lắng nghe <=== new
              initialData: bloc.state,
              // giá trị khởi tạo chính là volume 70 hiện tại <=== new
              builder:
                  (BuildContext context, AsyncSnapshot<RemoteState> snapshot) {
                RemoteState? _newState = snapshot.data;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Text('Kênh hiện tại: ${_newState?.channel}'),      // Lấy ra giá trị kênh hiện tại
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
              builder:
                  (BuildContext context, AsyncSnapshot<ChannelState> snapshot) {
                ChannelState? _newState = snapshot.data;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text('Kênh hiện tại: ${_newState?.channel}'),

                  ],
                ); // update UI <=== new
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Page2();
                  }));
                },
                child: Text('Go to Screen 2')),
          ],
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
                  channelBloc.channelEventController.sink.add(ChannelIncrementEvent(1));   // Phát sự kiện tăng kênh
                },
                // add event <=== new
                child: Icon(Icons.plus_one),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  channelBloc.channelEventController.sink.add(ChannelDecrementEvent(1));    // Phát sự kiện giảm kênh
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

  @override
  void dispose() {
    super.dispose();
    bloc.dispose(); // dispose bloc <=== new
  }
}
