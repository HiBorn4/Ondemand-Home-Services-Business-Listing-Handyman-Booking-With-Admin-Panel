import 'package:get/get.dart';

import '../../app/models/slide_model.dart';
import '../../app/providers/laravel_provider.dart';

class SliderRepository {
  late LaravelApiClient _laravelApiClient;

  SliderRepository() {
    this._laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<List<Slide>> getHomeSlider() {
    return _laravelApiClient.getHomeSlider();
  }
}
