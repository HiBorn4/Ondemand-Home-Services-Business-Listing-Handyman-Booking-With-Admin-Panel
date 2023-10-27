// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';

import 'e_service_model.dart';
import 'media_model.dart';
import 'parents/model.dart';

class Category extends Model {
  late String id;
  late String name;
  late String description;
  late Color color;
  late Media image;
  late bool featured;
  late List<Category> subCategories;
  late List<EService> eServices;

  Category(
      {required this.id,
      required this.name,
      required this.description,
      required this.color,
      required this.image,
      required this.featured,
      required this.subCategories,
      required this.eServices});

  Category.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    name = transStringFromJson(json, 'name');
    color = colorFromJson(json, 'color');
    description = transStringFromJson(json, 'description');
    image = mediaFromJson(json, 'image');
    featured = boolFromJson(json, 'featured');
    eServices = listFromJsonArray(json, ['e_services', 'featured_e_services'],
        (v) => EService.fromJson(v));
    subCategories =
        listFromJson(json, 'sub_categories', (v) => Category.fromJson(v));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['color'] = '#${this.color.value.toRadixString(16)}';
    return data;
  }

  @override
  bool operator(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Category &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          color == other.color &&
          image == other.image &&
          featured == other.featured &&
          subCategories == other.subCategories &&
          eServices == other.eServices;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      color.hashCode ^
      image.hashCode ^
      featured.hashCode ^
      subCategories.hashCode ^
      eServices.hashCode;
}
