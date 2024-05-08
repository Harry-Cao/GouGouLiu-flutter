// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ChatModel extends _ChatModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ChatModel(
    DateTime createTime,
    String typeString,
    String userId, {
    String? text,
    String? photoUrl,
  }) {
    RealmObjectBase.set(this, 'createTime', createTime);
    RealmObjectBase.set(this, 'typeString', typeString);
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'photoUrl', photoUrl);
  }

  ChatModel._();

  @override
  DateTime get createTime =>
      RealmObjectBase.get<DateTime>(this, 'createTime') as DateTime;
  @override
  set createTime(DateTime value) =>
      RealmObjectBase.set(this, 'createTime', value);

  @override
  String get typeString =>
      RealmObjectBase.get<String>(this, 'typeString') as String;
  @override
  set typeString(String value) =>
      RealmObjectBase.set(this, 'typeString', value);

  @override
  String get userId => RealmObjectBase.get<String>(this, 'userId') as String;
  @override
  set userId(String value) => RealmObjectBase.set(this, 'userId', value);

  @override
  String? get text => RealmObjectBase.get<String>(this, 'text') as String?;
  @override
  set text(String? value) => RealmObjectBase.set(this, 'text', value);

  @override
  String? get photoUrl =>
      RealmObjectBase.get<String>(this, 'photoUrl') as String?;
  @override
  set photoUrl(String? value) => RealmObjectBase.set(this, 'photoUrl', value);

  @override
  Stream<RealmObjectChanges<ChatModel>> get changes =>
      RealmObjectBase.getChanges<ChatModel>(this);

  @override
  ChatModel freeze() => RealmObjectBase.freezeObject<ChatModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'createTime': createTime.toEJson(),
      'typeString': typeString.toEJson(),
      'userId': userId.toEJson(),
      'text': text.toEJson(),
      'photoUrl': photoUrl.toEJson(),
    };
  }

  static EJsonValue _toEJson(ChatModel value) => value.toEJson();
  static ChatModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'createTime': EJsonValue createTime,
        'typeString': EJsonValue typeString,
        'userId': EJsonValue userId,
        'text': EJsonValue text,
        'photoUrl': EJsonValue photoUrl,
      } =>
        ChatModel(
          fromEJson(createTime),
          fromEJson(typeString),
          fromEJson(userId),
          text: fromEJson(text),
          photoUrl: fromEJson(photoUrl),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ChatModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, ChatModel, 'ChatModel', [
      SchemaProperty('createTime', RealmPropertyType.timestamp),
      SchemaProperty('typeString', RealmPropertyType.string),
      SchemaProperty('userId', RealmPropertyType.string),
      SchemaProperty('text', RealmPropertyType.string, optional: true),
      SchemaProperty('photoUrl', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class MessageModel extends _MessageModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  MessageModel({
    DateTime? createTime,
    String? ownerId,
    String? userId,
    Iterable<ChatModel> messages = const [],
    int unReadNum = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<MessageModel>({
        'unReadNum': 0,
      });
    }
    RealmObjectBase.set(this, 'createTime', createTime);
    RealmObjectBase.set(this, 'ownerId', ownerId);
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set<RealmList<ChatModel>>(
        this, 'messages', RealmList<ChatModel>(messages));
    RealmObjectBase.set(this, 'unReadNum', unReadNum);
  }

  MessageModel._();

  @override
  DateTime? get createTime =>
      RealmObjectBase.get<DateTime>(this, 'createTime') as DateTime?;
  @override
  set createTime(DateTime? value) =>
      RealmObjectBase.set(this, 'createTime', value);

  @override
  String? get ownerId =>
      RealmObjectBase.get<String>(this, 'ownerId') as String?;
  @override
  set ownerId(String? value) => RealmObjectBase.set(this, 'ownerId', value);

  @override
  String? get userId => RealmObjectBase.get<String>(this, 'userId') as String?;
  @override
  set userId(String? value) => RealmObjectBase.set(this, 'userId', value);

  @override
  RealmList<ChatModel> get messages =>
      RealmObjectBase.get<ChatModel>(this, 'messages') as RealmList<ChatModel>;
  @override
  set messages(covariant RealmList<ChatModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get unReadNum => RealmObjectBase.get<int>(this, 'unReadNum') as int;
  @override
  set unReadNum(int value) => RealmObjectBase.set(this, 'unReadNum', value);

  @override
  Stream<RealmObjectChanges<MessageModel>> get changes =>
      RealmObjectBase.getChanges<MessageModel>(this);

  @override
  MessageModel freeze() => RealmObjectBase.freezeObject<MessageModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'createTime': createTime.toEJson(),
      'ownerId': ownerId.toEJson(),
      'userId': userId.toEJson(),
      'messages': messages.toEJson(),
      'unReadNum': unReadNum.toEJson(),
    };
  }

  static EJsonValue _toEJson(MessageModel value) => value.toEJson();
  static MessageModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'createTime': EJsonValue createTime,
        'ownerId': EJsonValue ownerId,
        'userId': EJsonValue userId,
        'messages': EJsonValue messages,
        'unReadNum': EJsonValue unReadNum,
      } =>
        MessageModel(
          createTime: fromEJson(createTime),
          ownerId: fromEJson(ownerId),
          userId: fromEJson(userId),
          messages: fromEJson(messages),
          unReadNum: fromEJson(unReadNum),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(MessageModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, MessageModel, 'MessageModel', [
      SchemaProperty('createTime', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('ownerId', RealmPropertyType.string, optional: true),
      SchemaProperty('userId', RealmPropertyType.string, optional: true),
      SchemaProperty('messages', RealmPropertyType.object,
          linkTarget: 'ChatModel', collectionType: RealmCollectionType.list),
      SchemaProperty('unReadNum', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
