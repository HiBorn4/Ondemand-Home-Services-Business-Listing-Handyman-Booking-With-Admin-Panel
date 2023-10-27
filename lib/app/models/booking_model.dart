// ignore_for_file: unnecessary_null_comparison, override_on_non_overriding_member

import 'address_model.dart';
import 'booking_status_model.dart';
import 'coupon_model.dart';
import 'e_provider_model.dart';
import 'e_service_model.dart';
import 'option_model.dart';
import 'parents/model.dart';
import 'payment_model.dart';
import 'tax_model.dart';
import 'user_model.dart';

class Booking extends Model {
  late String id;
  late String hint;
  late bool cancel;
  late double duration;
  late int quantity;
  late BookingStatus status;
  late User user;
  late EService eService;
  late EProvider eProvider;
  late List<Option> options;
  late List<Tax> taxes;
  late Address address;
  late Coupon coupon;
  late DateTime bookingAt;
  late DateTime startAt;
  late DateTime endsAt;
  late Payment payment;

  Booking({
    required this.id,
    this.hint = "",
    this.cancel = true,
    required this.duration,
    required this.quantity,
    required this.status,
    required this.user,
    required this.eService,
    required this.eProvider,
    required this.options,
    required this.taxes,
    required this.address,
    required this.coupon,
    required this.bookingAt,
    required this.startAt,
    required this.endsAt,
    required this.payment,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      hint: json['hint'],
      cancel: json['cancel'],
      duration: json['duration'],
      quantity: json['quantity'],
      status: BookingStatus.fromJson(json['booking_status']),
      user: User.fromJson(json['user']),
      eService: EService.fromJson(json['e_service']),
      eProvider: EProvider.fromJson(json['e_provider']),
      options: (json['options'] as List)
          .map((option) => Option.fromJson(option))
          .toList(),
      taxes: (json['taxes'] as List).map((tax) => Tax.fromJson(tax)).toList(),
      address: Address.fromJson(json['address']),
      coupon: Coupon.fromJson(json['coupon']),
      bookingAt: DateTime.parse(json['booking_at']),
      startAt: DateTime.parse(json['start_at']),
      endsAt: DateTime.parse(json['ends_at']),
      payment: Payment.fromJson(json['payment']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hint': hint,
      'cancel': cancel,
      'duration': duration,
      'quantity': quantity,
      'status': status.toJson(),
      'user': user.toJson(),
      'e_service': eService.toJson(),
      'e_provider': eProvider.toJson(),
      'options': options.map((option) => option.toJson()).toList(),
      'taxes': taxes.map((tax) => tax.toJson()).toList(),
      'address': address.toJson(),
      'coupon': coupon.toJson(),
      'booking_at': bookingAt.toUtc().toString(),
      'start_at': startAt.toUtc().toString(),
      'ends_at': endsAt.toUtc().toString(),
      'payment': payment.toJson(),
    };
  }

  double getTotal() {
    double total = getSubtotal();
    total += getTaxesValue();
    total += getCouponValue();
    return total;
  }

  double getTaxesValue() {
    double total = getSubtotal();
    double taxValue = 0.0;
    taxes.forEach((Tax element) {
      if (element.type == 'percent') {
        taxValue += (total * element.value / 100);
      } else {
        taxValue += element.value;
      }
    });
    return taxValue;
  }

  double getCouponValue() {
    double total = getSubtotal();
    if (coupon == null || !(coupon.hasData)) {
      return 0;
    } else {
      if (coupon.discountType == 'percent') {
        return -(total * coupon.discount / 100);
      } else {
        return -coupon.discount;
      }
    }
  }

  double getSubtotal() {
    double total = 0.0;
    if (eService.priceUnit == 'fixed') {
      total = eService.price * (quantity >= 1 ? quantity : 1);
      options.forEach((element) {
        total += element.price * (quantity >= 1 ? quantity : 1);
      });
    } else {
      total = eService.price * duration;
      options.forEach((element) {
        total += element.price;
      });
    }
    return total;
  }

  @override
  bool operator(Object other) =>
      identical(this, other) ||
      other is Booking &&
          runtimeType == other.runtimeType &&
          id == other.id && // Check all the properties for equality
          hint == other.hint &&
          cancel == other.cancel &&
          duration == other.duration &&
          quantity == other.quantity &&
          status == other.status &&
          user == other.user &&
          eService == other.eService &&
          eProvider == other.eProvider &&
          options == other.options &&
          taxes == other.taxes &&
          address == other.address &&
          coupon == other.coupon &&
          bookingAt == other.bookingAt &&
          startAt == other.startAt &&
          endsAt == other.endsAt &&
          payment == other.payment;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      hint.hashCode ^
      cancel.hashCode ^
      duration.hashCode ^
      quantity.hashCode ^
      status.hashCode ^
      user.hashCode ^
      eService.hashCode ^
      eProvider.hashCode ^
      options.hashCode ^
      taxes.hashCode ^
      address.hashCode ^
      coupon.hashCode ^
      bookingAt.hashCode ^
      startAt.hashCode ^
      endsAt.hashCode ^
      payment.hashCode;
}
