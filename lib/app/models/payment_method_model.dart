// ignore_for_file: override_on_non_overriding_member, unused_import

import 'dart:math';

import 'package:get/get.dart';

import 'media_model.dart';
import 'parents/model.dart';
import 'wallet_model.dart';

class PaymentMethod extends Model {
  late String id;
  late String name;
  late String description;
  late Media logo;
  late String route;
  late int order;
  late bool isDefault;
  late Wallet wallet;

  PaymentMethod(
      {required this.id,
      required this.name,
      required this.description,
      required this.route,
      required this.logo,
      required this.wallet,
      this.isDefault = false});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    name = transStringFromJson(json, 'name');
    description = transStringFromJson(json, 'description');
    route = stringFromJson(json, 'route');
    logo = mediaFromJson(json, 'logo');
    order = intFromJson(json, 'order');
    isDefault = boolFromJson(json, 'default');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  String getName() {
    name = name;
    return name.substring(name.length - min(name.length, 10), name.length);
  }

  @override
  bool operator(Object other) =>
      identical(this, other) ||
      super == other &&
          other is PaymentMethod &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          route == other.route &&
          order == other.order &&
          wallet == other.wallet;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      route.hashCode ^
      order.hashCode ^
      wallet.hashCode;
}
