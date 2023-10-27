/*
 * Copyright (c) 2020 .
 */

import 'dart:core';

import 'parents/model.dart';

class EProviderType extends Model {
  late String id;
  late String name;
  late double commission;

  EProviderType(
      {required this.id, required this.name, required this.commission});

  EProviderType.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    name = transStringFromJson(json, 'name');
    commission = doubleFromJson(json, 'commission');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['commission'] = this.commission;
    return data;
  }
}
