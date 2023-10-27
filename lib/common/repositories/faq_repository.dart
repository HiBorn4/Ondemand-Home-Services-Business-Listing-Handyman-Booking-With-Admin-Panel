import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../app/models/faq_category_model.dart';
import '../../app/models/faq_model.dart';
import '../../app/providers/laravel_provider.dart';
import '../../app/providers/mock_provider.dart';

class FaqRepository {
  late MockApiClient _apiClient;
  late LaravelApiClient _laravelApiClient;

  FaqRepository() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    this._apiClient = MockApiClient(httpClient: Dio());
  }

  Future<List<FaqCategory>> getCategoriesWithFaqs() {
    return _apiClient.getCategoriesWithFaqs();
  }

  Future<List<FaqCategory>> getFaqCategories() {
    return _laravelApiClient.getFaqCategories();
  }

  Future<List<Faq>> getFaqs(String categoryId) {
    return _laravelApiClient.getFaqs(categoryId);
  }
}
