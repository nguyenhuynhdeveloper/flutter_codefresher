//import kiểu vẽ giao diện
import 'package:flutter/material.dart';

//import các biến cố định
import 'package:flutter_18/Lesson6/constants/custom_colors.dart';
//import các widget common
import 'package:flutter_18/Lesson6/models/whatsapp/user_model.dart';
//import CSS file
import 'package:flutter_18/Lesson6/styles/text_style.dart';

class WhatsAppPage extends StatelessWidget {
  const WhatsAppPage({Key? key}) : super(key: key);
  static String routeName = "WhatsAppPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkGreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("WhatsApp Clone"),
        actions: [    // action là 1 mản các icon mà có thể bấm vào thực hiện chức năng gì đó
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),

        ],
      ),
      body: SafeArea(     //Phạm vi khu vực mà tránh được vùng tai thỏ
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,   // với column thì CrossAxisAlignment là chiều ngang
          children: const [
            SizedBox(
              height: 150,
              child: WAStories(),   // Trong Sizebox cao 150 . sẽ chứa child WAStories() tự tạo bên trong
            ),
            Expanded(         // Expanded widget con bên trong chiếm hết toàn bộ không gian của widget cha
              child: MessagesPannel(),
            ),
          ],
        ),
      ),
    );
  }
}

class WAStories extends StatelessWidget {
  const WAStories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<UserModel> newStoriers =    // UserModel là 1 class mà được định nghĩa chứa đầy đủ các dữ liệu của 1 đối tượng
        usersList.where((user) => user.hasNewStory == true).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(20.0),  // ListView.buider có thuộc tính padding : EdgeInsets.all(20) Là padding tất cả 4 chiều ra 20px
      itemCount: newStoriers.length,    //Số lượng phần tử của ListView
      itemBuilder: (context, index) {    //Từng item của ListView
        return GestureDetector(   //widget GestureDetector  Phát hiện cử chỉ của người dùng
          onTap: () {},   // onTap Là 1 method báo sẽ làm cái gì
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(     //hiện ảnh dạng hình tròn .  với cách backgroundImage
                  maxRadius: 35,
                  backgroundImage: NetworkImage(newStoriers[index].avatarUrl),
                ),
              ),
              Text(
                newStoriers[index].userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
      scrollDirection: Axis.horizontal,  // Với hướng vuốt của ListView.Buid là hướng ngang
    );
  }
}

class MessagesPannel extends StatelessWidget {
  const MessagesPannel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 120,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15.0,
                      top: 15.0,
                      right: 10.0,
                    ),
                    child: CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: NetworkImage(usersList[index].avatarUrl),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          usersList[index].userName,
                          style: CustomTextStyle.titleStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          usersList[index].messages!.last.message,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(usersList[index].messages!.last.timeSent),
                      const SizedBox(height: 10),
                      usersList[index].messages!.last.hasBeenSeen == true
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.check_circle_outline,
                              color: Colors.grey,
                            ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
