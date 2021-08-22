import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/message_type.dart';

part 'message.freezed.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required Object sender,
    @Default(null) String? message,
    required MessageType messageType,
    @Default(null) String? mediaUrl,
    required DateTime timeSent,
    @Default(null) DateTime? timeDelivered,
    @Default(null) DateTime? timeRead,
  }) = _Message;
}
