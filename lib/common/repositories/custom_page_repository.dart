import 'package:get/get.dart';

import '../../app/models/custom_page_model.dart';
import '../../app/providers/laravel_provider.dart';

class CustomPageRepository {
  late LaravelApiClient _laravelApiClient;

  CustomPageRepository() {
    this._laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<List<CustomPage>> all() {
    return _laravelApiClient.getCustomPages();
  }

  Future<CustomPage> get(String id) {
    return _laravelApiClient.getCustomPageById(id);
  }
}
