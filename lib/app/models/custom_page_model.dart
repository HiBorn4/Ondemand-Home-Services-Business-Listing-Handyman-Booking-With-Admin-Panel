// ignore_for_file: override_on_non_overriding_member

import 'parents/model.dart';

class CustomPage extends Model {
  late String id;
  late String title;
  late String content;
  late DateTime updatedAt;

  CustomPage(
      {required this.id,
      required this.title,
      required this.content,
      required this.updatedAt});

  CustomPage.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    title = transStringFromJson(json, 'title');
    content = transStringFromJson(json, 'content');
    updatedAt = dateFromJson(json, 'updated_at', defaultValue: DateTime.now());
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  bool operator(Object other) =>
      identical(this, other) ||
      super == other &&
          other is CustomPage &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          content == other.content &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      title.hashCode ^
      content.hashCode ^
      updatedAt.hashCode;
}
