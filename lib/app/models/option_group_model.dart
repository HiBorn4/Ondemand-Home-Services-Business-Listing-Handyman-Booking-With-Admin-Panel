// ignore_for_file: override_on_non_overriding_member

import 'option_model.dart';
import 'parents/model.dart';

class OptionGroup extends Model {
  late String id;
  late String name;
  late bool allowMultiple;
  late List<Option> options;

  OptionGroup({required this.id, required this.name, required this.options});

  OptionGroup.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    name = transStringFromJson(json, 'name');
    allowMultiple = boolFromJson(json, 'allow_multiple');
    options = listFromJson(json, 'options', (v) => Option.fromJson(v));
  }

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["allow_multiple"] = allowMultiple;
    return map;
  }

  @override
  bool operator(Object other) =>
      identical(this, other) ||
      super == other &&
          other is OptionGroup &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          allowMultiple == other.allowMultiple &&
          options == other.options;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      name.hashCode ^
      allowMultiple.hashCode ^
      options.hashCode;
}
