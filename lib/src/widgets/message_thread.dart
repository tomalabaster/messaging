import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../messaging.dart';
import '../models/message.dart';
import 'text_message_in.dart';
import 'text_message_out.dart';

typedef MessageAlignment = Alignment? Function(Message message);
typedef MessageWidgetBuilder = Widget Function(
  Message message,
  bool firstInSet,
  bool lastInSet,
);
typedef DateWidgetBuilder = Widget Function(DateTime dateTime);
typedef AvatarWidgetBuilder<T> = Widget Function<T>(
  T sender,
  bool firstInSet,
  bool lastInSet,
);

class MessageThread<T> extends StatefulWidget {
  final List<Message> messages;
  final MessageAlignment? messageAlignment;
  final MessageWidgetBuilder? messageWidget;
  final DateWidgetBuilder? dateWidget;
  final AvatarWidgetBuilder<T>? avatarWidget;
  final T? sender;

  MessageThread({
    Key? key,
    required List<Message> messages,
    this.messageAlignment,
    this.messageWidget,
    this.dateWidget,
    this.avatarWidget,
    this.sender,
  })  : this.messages = List.of(messages),
        super(key: key);

  @override
  _MessageThreadState<T> createState() => _MessageThreadState<T>();
}

class _MessageThreadState<T> extends State<MessageThread> {
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
    final groupings = this._messageDateGroupings(this.widget.messages);

    return LayoutBuilder(builder: (context, constraints) {
      return CustomScrollView(
        controller: this._scrollController,
        slivers: groupings.keys
            .map((e) {
              final messages = groupings[e]!;

              return [
                SliverToBoxAdapter(child: this._widgetForDate(e)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final message = messages[index];
                      final alignment = this._messageAlignment(message);

                      final previousMessage =
                          index == 0 ? null : messages[index - 1];
                      final nextMessage = index == messages.length - 1
                          ? null
                          : messages[index + 1];

                      final previousAlignment = previousMessage == null
                          ? null
                          : this._messageAlignment(previousMessage);
                      final nextAlignment = nextMessage == null
                          ? null
                          : this._messageAlignment(nextMessage);

                      final firstInSet = previousAlignment != alignment;
                      final lastInSet = nextAlignment != alignment;

                      final avatar = this._widgetForAvatar(
                        message.sender as T,
                        firstInSet,
                        lastInSet,
                      );

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: this
                              ._rowMainAxisAlignmentFromAlignment(alignment),
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (this.widget.sender != message.sender) avatar,
                            Flexible(
                              child: ConstrainedBox(
                                constraints: constraints.copyWith(
                                  maxWidth: constraints.maxWidth - 100,
                                ),
                                child: this._widgetForMessage(
                                  message,
                                  firstInSet,
                                  lastInSet,
                                ),
                              ),
                            ),
                            if (this.widget.sender == message.sender) avatar,
                          ],
                        ),
                      );
                    },
                    childCount: messages.length,
                  ),
                ),
              ];
            })
            .expand((e) => e)
            .toList(),
      );
    });
  }

  Map<DateTime, List<Message>> _messageDateGroupings(List<Message> messages) {
    final orderedMessages = List.of(messages)
      ..sortBy((element) => element.timeSent);

    return orderedMessages.groupListsBy((element) {
      final localDate = element.timeSent.toLocal();

      return DateTime(localDate.year, localDate.month, localDate.day);
    });
  }

  Alignment _messageAlignment(Message message) {
    return this.widget.messageAlignment?.call(message) ??
        this._defaultMessageAlignment(message);
  }

  Alignment _defaultMessageAlignment(Message message) {
    return message.sender == this.widget.sender
        ? Alignment.centerRight
        : Alignment.centerLeft;
  }

  MainAxisAlignment _rowMainAxisAlignmentFromAlignment(Alignment alignment) {
    if (alignment.x < 0) {
      return MainAxisAlignment.start;
    } else if (alignment.x > 0) {
      return MainAxisAlignment.end;
    } else {
      return MainAxisAlignment.center;
    }
  }

  Widget _widgetForDate(DateTime date) {
    return this.widget.dateWidget?.call(date) ??
        this._defaultWidgetForDate(date);
  }

  Widget _defaultWidgetForDate(DateTime date) {
    final now = DateTime.now();
    final dateString =
        DateFormat(now.year == date.year ? 'MMM dd' : 'MMM dd yyyy')
            .format(date);

    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        child: Text(dateString),
      ),
    );
  }

  Widget _widgetForAvatar(T sender, bool firstInSet, bool lastInSet) {
    return this.widget.avatarWidget?.call(sender, firstInSet, lastInSet) ??
        this.defaultWidgetForAvatar(sender, firstInSet, lastInSet);
  }

  Widget defaultWidgetForAvatar(T sender, bool firstInSet, bool lastInSet) {
    if (lastInSet) {
      final senderString = sender?.toString() ?? '';
      final firstCharacter = senderString.isNotEmpty ? senderString[0] : '';

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: CircleAvatar(
          maxRadius: 15,
          child: Text(firstCharacter),
        ),
      );
    } else {
      return const SizedBox(width: 40);
    }
  }

  Widget _widgetForMessage(
    Message message,
    bool firstInSet,
    bool lastInSet,
  ) {
    return this.widget.messageWidget?.call(message, firstInSet, lastInSet) ??
        this._defaultWidgetForMessage(message, firstInSet, lastInSet);
  }

  Widget _defaultWidgetForMessage(
    Message message,
    bool firstInSet,
    bool lastInSet,
  ) {
    switch (message.messageType) {
      case MessageType.text:
        return this.widget.sender == message.sender
            ? TextMessageOut(
                message: message,
                firstInSet: firstInSet,
                lastInSet: lastInSet,
              )
            : TextMessageIn(
                message: message,
                firstInSet: firstInSet,
                lastInSet: lastInSet,
              );
      default:
        return const SizedBox.shrink();
    }
  }
}
