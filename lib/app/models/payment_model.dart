// ignore_for_file: unnecessary_null_comparison

import 'parents/model.dart';
import 'payment_method_model.dart';
import 'payment_status_model.dart';

class Payment extends Model {
  late String id;
  late String description;
  late double amount;
  late PaymentMethod paymentMethod;
  late PaymentStatus paymentStatus;

  Payment(
      {required this.id,
      required this.description,
      required this.amount,
      required this.paymentMethod,
      required this.paymentStatus});

  Payment.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    description = stringFromJson(json, 'description');
    amount = doubleFromJson(json, 'amount');
    paymentMethod = objectFromJson(
        json, 'payment_method', (v) => PaymentMethod.fromJson(v));
    paymentStatus = objectFromJson(
        json, 'payment_status', (v) => PaymentStatus.fromJson(v));
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['amount'] = this.amount;
    if (paymentMethod != null) {
      data['payment_method_id'] = this.paymentMethod.id;
    }
    if (paymentStatus != null) {
      data['payment_status_id'] = this.paymentStatus.id;
    }
    return data;
  }
}
