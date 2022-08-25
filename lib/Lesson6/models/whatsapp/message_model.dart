class MessageModel {
  final String message;
  final String timeSent;
  final bool hasBeenSeen;

  MessageModel({
    required this.message,
    required this.timeSent,
    this.hasBeenSeen = false,
  });
}
