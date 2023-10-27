import 'parents/model.dart';

class PaymentStatus extends Model {
  late String id;
  late String status;
  late int order;

  PaymentStatus({required this.id, required this.status, required this.order});

  PaymentStatus.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    status = transStringFromJson(json, 'status');
    order = intFromJson(json, 'order');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['order'] = this.order;
    return data;
  }
}
