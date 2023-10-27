import 'parents/model.dart';

class FaqCategory extends Model {
  late String id;
  late String name;

  FaqCategory({required this.id, required this.name});

  FaqCategory.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    name = transStringFromJson(json, 'name');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
