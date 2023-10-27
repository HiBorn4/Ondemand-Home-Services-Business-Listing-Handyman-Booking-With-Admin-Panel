// ignore_for_file: unnecessary_null_comparison, override_on_non_overriding_member

/*
 * Copyright (c) 2020 .
 */

import 'dart:core';

import 'address_model.dart';
import 'availability_hour_model.dart';
import 'e_provider_type_model.dart';
import 'media_model.dart';
import 'parents/model.dart';
import 'review_model.dart';
import 'tax_model.dart';
import 'user_model.dart';

class EProvider extends Model {
  late String id;
  late String name;
  late String description;
  late List<Media> images;
  late String phoneNumber;
  late String mobileNumber;
  late EProviderType type;
  late List<AvailabilityHour> availabilityHours;
  late double availabilityRange;
  late bool available;
  late bool featured;
  late List<Address> addresses;
  late List<Tax> taxes;
  late List<User> employees;
  late double rate;
  late List<Review> reviews;
  late int totalReviews;
  late bool verified;
  late int bookingsInProgress;

  EProvider(
      {required this.id,
      required this.name,
      required this.description,
      required this.images,
      required this.phoneNumber,
      required this.mobileNumber,
      required this.type,
      required this.availabilityHours,
      required this.availabilityRange,
      required this.available,
      required this.featured,
      required this.addresses,
      required this.employees,
      required this.rate,
      required this.reviews,
      required this.totalReviews,
      required this.verified,
      required this.bookingsInProgress});

  EProvider.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    name = transStringFromJson(json, 'name');
    description = transStringFromJson(json, 'description');
    images = mediaListFromJson(json, 'images');
    phoneNumber = stringFromJson(json, 'phone_number');
    mobileNumber = stringFromJson(json, 'mobile_number');
    type = objectFromJson(
        json, 'e_provider_type', (v) => EProviderType.fromJson(v));
    availabilityHours = listFromJson(
        json, 'availability_hours', (v) => AvailabilityHour.fromJson(v));
    availabilityRange = doubleFromJson(json, 'availability_range');
    available = boolFromJson(json, 'available');
    featured = boolFromJson(json, 'featured');
    addresses = listFromJson(json, 'addresses', (v) => Address.fromJson(v));
    taxes = listFromJson(json, 'taxes', (v) => Tax.fromJson(v));
    employees = listFromJson(json, 'users', (v) => User.fromJson(v));
    rate = doubleFromJson(json, 'rate');
    reviews =
        listFromJson(json, 'e_provider_reviews', (v) => Review.fromJson(v));
    totalReviews =
        reviews.isEmpty ? intFromJson(json, 'total_reviews') : reviews.length;
    verified = boolFromJson(json, 'verified');
    bookingsInProgress = intFromJson(json, 'bookings_in_progress');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['available'] = this.available;
    data['phone_number'] = this.phoneNumber;
    data['mobile_number'] = this.mobileNumber;
    data['rate'] = this.rate;
    data['total_reviews'] = this.totalReviews;
    data['verified'] = this.verified;
    data['bookings_in_progress'] = this.bookingsInProgress;
    return data;
  }

  String get firstImageUrl => this.images.first.url;

  String get firstImageThumb => this.images.first.thumb;

  String get firstImageIcon => this.images.first.icon;

  String? get firstAddress {
    if (this.addresses.isNotEmpty) {
      return this.addresses.first.address;
    }
    return '';
  }

  @override
  bool get hasData {
    return id != null && name != null && description != null;
  }

  Map<String, List<String>> groupedAvailabilityHours() {
    Map<String, List<String>> result = {};
    this.availabilityHours.forEach((element) {
      if (result.containsKey(element.day)) {
        result[element.day]!.add(element.startAt + ' - ' + element.endAt);
      } else {
        result[element.day] = [element.startAt + ' - ' + element.endAt];
      }
    });
    return result;
  }

  List<String> getAvailabilityHoursData(String day) {
    List<String> result = [];
    this.availabilityHours.forEach((element) {
      if (element.day == day) {
        result.add(element.data);
      }
    });
    return result;
  }

  @override
  bool operator(Object other) =>
      identical(this, other) ||
      super == other &&
          other is EProvider &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          images == other.images &&
          phoneNumber == other.phoneNumber &&
          mobileNumber == other.mobileNumber &&
          type == other.type &&
          availabilityRange == other.availabilityRange &&
          available == other.available &&
          featured == other.featured &&
          addresses == other.addresses &&
          rate == other.rate &&
          reviews == other.reviews &&
          totalReviews == other.totalReviews &&
          verified == other.verified &&
          bookingsInProgress == other.bookingsInProgress;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      images.hashCode ^
      phoneNumber.hashCode ^
      mobileNumber.hashCode ^
      type.hashCode ^
      availabilityRange.hashCode ^
      available.hashCode ^
      featured.hashCode ^
      addresses.hashCode ^
      rate.hashCode ^
      reviews.hashCode ^
      totalReviews.hashCode ^
      verified.hashCode ^
      bookingsInProgress.hashCode;
}
