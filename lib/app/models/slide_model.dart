import 'package:flutter/material.dart';

import 'e_provider_model.dart';
import 'e_service_model.dart';
import 'media_model.dart';
import 'parents/model.dart';

class Slide extends Model {
  late int order;
  late String text;
  late String button;
  late String textPosition;
  late Color textColor;
  late Color buttonColor;
  late Color backgroundColor;
  late Color indicatorColor;
  late Media image;
  late String imageFit;
  late EService eService;
  late EProvider eProvider;
  late bool enabled;

  Slide({
    required this.order,
    required this.text,
    required this.button,
    required this.textPosition,
    required this.textColor,
    required this.buttonColor,
    required this.backgroundColor,
    required this.indicatorColor,
    required this.image,
    required this.imageFit,
    required this.eService,
    required this.eProvider,
    required this.enabled,
  });

  Slide.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    order = intFromJson(json, 'order');
    text = transStringFromJson(json, 'text');
    button = transStringFromJson(json, 'button');
    textPosition = stringFromJson(json, 'text_position');
    textColor = colorFromJson(json, 'text_color');
    buttonColor = colorFromJson(json, 'button_color');
    backgroundColor = colorFromJson(json, 'background_color');
    indicatorColor = colorFromJson(json, 'indicator_color');
    image = mediaFromJson(json, 'image');
    imageFit = stringFromJson(json, 'image_fit');
    final eServiceValue = json['e_service_id'] != null
        ? EService(id: json['e_service_id'].toString())
        : null;

    if (eServiceValue != null) {
      eService = eServiceValue;
    }

    eProvider = json['e_provider_id'] != null
        ? EProvider(id: json['e_provider_id'].toString())
        : null;
    
    enabled = boolFromJson(json, 'enabled');
  }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    return data;
  }
}
