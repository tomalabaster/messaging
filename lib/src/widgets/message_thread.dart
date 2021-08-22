import 'package:flutter/widgets.dart';
import 'package:messaging/src/widgets/text_message_in.dart';

import '../../messaging.dart';
import '../models/message.dart';
import 'text_message_out.dart';

typedef MessageAlignment = Alignment? Function(Message message);
typedef WidgetForMessage = Widget Function(
  Message message,
  bool firstInSet,
  bool lastInSet,
);

class MessageThread extends StatefulWidget {
  final List<Message> messages;
  final MessageAlignment? messageAlignment;
  final WidgetForMessage? widgetForMessage;
  final Object? sender;

  MessageThread({
    Key? key,
    required List<Message> messages,
    this.messageAlignment,
    this.widgetForMessage,
    this.sender,
  })  : this.messages = List.of(messages),
        super(key: key);

  @override
  _MessageThreadState createState() => _MessageThreadState();
}

class _MessageThreadState extends State<MessageThread> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    this._scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(covariant MessageThread oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (this.widget.messages.length != oldWidget.messages.length) {
      final lastMessage =
          this.widget.messages.isEmpty ? null : this.widget.messages.last;
      final oldLastMessage =
          oldWidget.messages.isEmpty ? null : oldWidget.messages.last;

      if (lastMessage != oldLastMessage) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          this._scrollController.animateTo(
                this._scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeIn,
              );
        });
      }
    }
  }

  @override
  void dispose() {
    this._scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ListView.builder(
        controller: this._scrollController,
        itemCount: this.widget.messages.length,
        itemBuilder: (context, index) {
          final message = this.widget.messages[index];
          final alignment = this._messageAlignment(message);

          final previousMessage =
              index == 0 ? null : this.widget.messages[index - 1];
          final nextMessage = index == this.widget.messages.length - 1
              ? null
              : this.widget.messages[index + 1];

          final previousAlignment = previousMessage == null
              ? null
              : this._messageAlignment(previousMessage);
          final nextAlignment =
              nextMessage == null ? null : this._messageAlignment(nextMessage);

          return Row(
            mainAxisAlignment: this._mainAxisAlignmentFromAlignment(alignment),
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: constraints.copyWith(
                    maxWidth: constraints.maxWidth - 100,
                  ),
                  child: this._defaultWidgetForMessage(
                    message,
                    previousAlignment != alignment,
                    nextAlignment != alignment,
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }

  Alignment _messageAlignment(Message message) {
    return this.widget.messageAlignment?.call(message) ??
        this._defaultMessageAlignment(message);
  }

  Alignment _defaultMessageAlignment(Message message) {
    final sender = this.widget.sender;

    if (sender == null) {
      return this.widget.messages.indexOf(message) % 6 < 3
          ? Alignment.centerRight
          : Alignment.centerLeft;
    } else {
      return message.sender == sender
          ? Alignment.centerRight
          : Alignment.centerLeft;
    }
  }

  MainAxisAlignment _mainAxisAlignmentFromAlignment(Alignment alignment) {
    if (alignment.x < 0) {
      return MainAxisAlignment.start;
    } else if (alignment.x > 0) {
      return MainAxisAlignment.end;
    } else {
      return MainAxisAlignment.center;
    }
  }

  Widget _defaultWidgetForMessage(
    Message message,
    bool firstInSet,
    bool lastInSet,
  ) {
    final defaultAlignment = this._messageAlignment(message);

    switch (message.messageType) {
      case MessageType.text:
        return defaultAlignment.x < 0
            ? TextMessageIn(
                message: message,
                firstInSet: firstInSet,
                lastInSet: lastInSet,
              )
            : TextMessageOut(
                message: message,
                firstInSet: firstInSet,
                lastInSet: lastInSet,
              );
      default:
        return const SizedBox.shrink();
    }
  }
}
