// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MessageTearOff {
  const _$MessageTearOff();

  _Message call(
      {required Object sender,
      String? message = null,
      required MessageType messageType,
      String? mediaUrl = null,
      required DateTime timeSent,
      DateTime? timeDelivered = null,
      DateTime? timeRead = null}) {
    return _Message(
      sender: sender,
      message: message,
      messageType: messageType,
      mediaUrl: mediaUrl,
      timeSent: timeSent,
      timeDelivered: timeDelivered,
      timeRead: timeRead,
    );
  }
}

/// @nodoc
const $Message = _$MessageTearOff();

/// @nodoc
mixin _$Message {
  Object get sender => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  MessageType get messageType => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;
  DateTime get timeSent => throw _privateConstructorUsedError;
  DateTime? get timeDelivered => throw _privateConstructorUsedError;
  DateTime? get timeRead => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call(
      {Object sender,
      String? message,
      MessageType messageType,
      String? mediaUrl,
      DateTime timeSent,
      DateTime? timeDelivered,
      DateTime? timeRead});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? sender = freezed,
    Object? message = freezed,
    Object? messageType = freezed,
    Object? mediaUrl = freezed,
    Object? timeSent = freezed,
    Object? timeDelivered = freezed,
    Object? timeRead = freezed,
  }) {
    return _then(_value.copyWith(
      sender: sender == freezed
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Object,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: messageType == freezed
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      mediaUrl: mediaUrl == freezed
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      timeSent: timeSent == freezed
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeDelivered: timeDelivered == freezed
          ? _value.timeDelivered
          : timeDelivered // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeRead: timeRead == freezed
          ? _value.timeRead
          : timeRead // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) then) =
      __$MessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {Object sender,
      String? message,
      MessageType messageType,
      String? mediaUrl,
      DateTime timeSent,
      DateTime? timeDelivered,
      DateTime? timeRead});
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(_Message _value, $Res Function(_Message) _then)
      : super(_value, (v) => _then(v as _Message));

  @override
  _Message get _value => super._value as _Message;

  @override
  $Res call({
    Object? sender = freezed,
    Object? message = freezed,
    Object? messageType = freezed,
    Object? mediaUrl = freezed,
    Object? timeSent = freezed,
    Object? timeDelivered = freezed,
    Object? timeRead = freezed,
  }) {
    return _then(_Message(
      sender: sender == freezed
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Object,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: messageType == freezed
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      mediaUrl: mediaUrl == freezed
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      timeSent: timeSent == freezed
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeDelivered: timeDelivered == freezed
          ? _value.timeDelivered
          : timeDelivered // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeRead: timeRead == freezed
          ? _value.timeRead
          : timeRead // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_Message implements _Message {
  const _$_Message(
      {required this.sender,
      this.message = null,
      required this.messageType,
      this.mediaUrl = null,
      required this.timeSent,
      this.timeDelivered = null,
      this.timeRead = null});

  @override
  final Object sender;
  @JsonKey(defaultValue: null)
  @override
  final String? message;
  @override
  final MessageType messageType;
  @JsonKey(defaultValue: null)
  @override
  final String? mediaUrl;
  @override
  final DateTime timeSent;
  @JsonKey(defaultValue: null)
  @override
  final DateTime? timeDelivered;
  @JsonKey(defaultValue: null)
  @override
  final DateTime? timeRead;

  @override
  String toString() {
    return 'Message(sender: $sender, message: $message, messageType: $messageType, mediaUrl: $mediaUrl, timeSent: $timeSent, timeDelivered: $timeDelivered, timeRead: $timeRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Message &&
            (identical(other.sender, sender) ||
                const DeepCollectionEquality().equals(other.sender, sender)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.messageType, messageType) ||
                const DeepCollectionEquality()
                    .equals(other.messageType, messageType)) &&
            (identical(other.mediaUrl, mediaUrl) ||
                const DeepCollectionEquality()
                    .equals(other.mediaUrl, mediaUrl)) &&
            (identical(other.timeSent, timeSent) ||
                const DeepCollectionEquality()
                    .equals(other.timeSent, timeSent)) &&
            (identical(other.timeDelivered, timeDelivered) ||
                const DeepCollectionEquality()
                    .equals(other.timeDelivered, timeDelivered)) &&
            (identical(other.timeRead, timeRead) ||
                const DeepCollectionEquality()
                    .equals(other.timeRead, timeRead)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sender) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(messageType) ^
      const DeepCollectionEquality().hash(mediaUrl) ^
      const DeepCollectionEquality().hash(timeSent) ^
      const DeepCollectionEquality().hash(timeDelivered) ^
      const DeepCollectionEquality().hash(timeRead);

  @JsonKey(ignore: true)
  @override
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);
}

abstract class _Message implements Message {
  const factory _Message(
      {required Object sender,
      String? message,
      required MessageType messageType,
      String? mediaUrl,
      required DateTime timeSent,
      DateTime? timeDelivered,
      DateTime? timeRead}) = _$_Message;

  @override
  Object get sender => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  MessageType get messageType => throw _privateConstructorUsedError;
  @override
  String? get mediaUrl => throw _privateConstructorUsedError;
  @override
  DateTime get timeSent => throw _privateConstructorUsedError;
  @override
  DateTime? get timeDelivered => throw _privateConstructorUsedError;
  @override
  DateTime? get timeRead => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
