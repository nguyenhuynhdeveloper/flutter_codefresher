import '../../models/whatsapp/message_model.dart';

class UserModel {
  final String userName;
  String avatarUrl;
  List<MessageModel>? messages;
  final bool hasNewStory;

  UserModel({     //Đây là params constructor dạng named của UserModal
    required this.userName,
    required this.avatarUrl,
    this.messages,
    this.hasNewStory = false,
  });
}

List<UserModel> usersList = [
  UserModel(
    userName: 'Annupriya',
    avatarUrl: "https://cdn-icons-png.flaticon.com/512/147/147135.png",
    messages: <MessageModel>[
      MessageModel(
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        timeSent: "9Am",
      ),
    ],
    hasNewStory: true,
  ),
  UserModel(
    userName: 'dev',
    avatarUrl: "https://cdn-icons-png.flaticon.com/512/147/147133.png",
    messages: <MessageModel>[
      MessageModel(
        message: 'Sed commodo eros a sem auctor iaculis',
        timeSent: "8Am",
        hasBeenSeen: true,
      ),
    ],
    hasNewStory: true,
  ),
  UserModel(
    userName: 'Pujali',
    avatarUrl: "https://cdn-icons-png.flaticon.com/512/147/147131.png",
    messages: <MessageModel>[
      MessageModel(
        message: 'Nullam in dui dapibus, volutpat arcu in, scelerisque urna',
        timeSent: "6Am",
        hasBeenSeen: true,
      ),
    ],
    hasNewStory: true,
  ),
  UserModel(
    userName: 'Dipen',
    avatarUrl: "https://cdn-icons-png.flaticon.com/512/168/168724.png",
    messages: <MessageModel>[
      MessageModel(
        message: 'Nunc porttitor ex suscipit, varius nisl nec, dapibus nisi',
        timeSent: "Yesterday",
      ),
    ],
    hasNewStory: true,
  ),
  UserModel(
    userName: 'Unknow Users',
    avatarUrl: "https://cdn-icons-png.flaticon.com/512/147/147132.png",
    messages: <MessageModel>[
      MessageModel(
        message: 'Sed ac ex egestas, lobortis mauris ac, facilisis felis',
        timeSent: "Yesterday",
      ),
    ],
  ),
  UserModel(
    userName: 'Anjila',
    avatarUrl: "https://cdn-icons-png.flaticon.com/512/147/147143.png",
    messages: <MessageModel>[
      MessageModel(
        message: 'Integer pellentesque lorem euismod nisl molestie ornare',
        timeSent: "San20",
        hasBeenSeen: true,
      ),
    ],
    hasNewStory: true,
  ),
  UserModel(
    userName: 'A really really really really really really long name Users',
    avatarUrl: "https://cdn-icons-png.flaticon.com/512/147/147130.png",
    messages: <MessageModel>[
      MessageModel(
        message:
            'Pellentesque venenatis felis pellentesque ligula consectetur consequat',
        timeSent: "San20",
      ),
    ],
  ),
];
