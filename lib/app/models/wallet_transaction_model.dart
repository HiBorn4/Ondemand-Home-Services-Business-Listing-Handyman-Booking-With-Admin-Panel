// ignore_for_file: unnecessary_null_comparison

import 'dart:math';

import 'parents/model.dart';
import 'user_model.dart';

enum TransactionActions { CREDIT, DEBIT }

class WalletTransaction extends Model {
  late String id;
  late double amount;
  late String description;
  late TransactionActions action;
  late DateTime dateTime;
  late User user;

  WalletTransaction(
      {required this.id,
      required this.amount,
      required this.description,
      required this.action,
      required this.user});

  WalletTransaction.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    description = stringFromJson(json, 'description');
    amount = doubleFromJson(json, 'amount');
    user = objectFromJson(json, 'user', (value) => User.fromJson(value));
    dateTime = dateFromJson(json, 'created_at', defaultValue: DateTime.now());
    if (json != null) {
      if (json['action'] == 'credit') {
        action = TransactionActions.CREDIT;
      } else if (json['action'] == 'debit') {
        action = TransactionActions.DEBIT;
      }
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['action'] = this.action;
    data['user'] = this.user;
    return data;
  }

  String getDescription() {
    description = description;
    return description.substring(
        description.length - min(description.length, 20), description.length);
  }
}
