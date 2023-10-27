// ignore_for_file: unnecessary_null_comparison, override_on_non_overriding_member

import 'package:get/get.dart';

import 'media_model.dart';
import 'parents/model.dart';

class Option extends Model {
  late String id;
  late String optionGroupId;
  late String eServiceId;
  late String name;
  late double price;
  late Media image;
  late String description;
  late var checked = false.obs;

  Option(
      {required this.id,
      required this.optionGroupId,
      required this.eServiceId,
      required this.name,
      required this.price,
      required this.image,
      required this.description,
      required this.checked});

  Option.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    optionGroupId = stringFromJson(json, 'option_group_id', defaultValue: '0');
    eServiceId = stringFromJson(json, 'e_service_id', defaultValue: '0');
    name = transStringFromJson(json, 'name');
    price = doubleFromJson(json, 'price');
    description = transStringFromJson(json, 'description');
    image = mediaFromJson(json, 'image');
  }

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    if (id != null) map["id"] = id;
    if (name != null) map["name"] = name;
    if (price != null) map["price"] = price;
    if (description != null) map["description"] = description;
    if (checked != null) map["checked"] = checked.value;
    if (optionGroupId != null) map["option_group_id"] = optionGroupId;
    if (eServiceId != null) map["e_service_id"] = eServiceId;
    if (this.image != null) {
      map['image'] = this.image.toJson();
    }
    return map;
  }

  @override
  bool operator(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Option &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          optionGroupId == other.optionGroupId &&
          eServiceId == other.eServiceId &&
          name == other.name &&
          price == other.price &&
          image == other.image &&
          description == other.description &&
          checked == other.checked;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      optionGroupId.hashCode ^
      eServiceId.hashCode ^
      name.hashCode ^
      price.hashCode ^
      image.hashCode ^
      description.hashCode ^
      checked.hashCode;
}
