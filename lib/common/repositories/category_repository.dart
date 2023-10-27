import 'package:get/get.dart';

import '../../app/models/category_model.dart';
import '../../app/providers/laravel_provider.dart';

class CategoryRepository {
  late LaravelApiClient _laravelApiClient;

  CategoryRepository() {
    this._laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<List<Category>> getAll() {
    return _laravelApiClient.getAllCategories();
  }

  Future<List<Category>> getAllParents() {
    return _laravelApiClient.getAllParentCategories();
  }

  Future<List<Category>> getAllWithSubCategories() {
    return _laravelApiClient.getAllWithSubCategories();
  }

  Future<List<Category>> getSubCategories(String categoryId) {
    return _laravelApiClient.getSubCategories(categoryId);
  }

  Future<List<Category>> getFeatured() {
    return _laravelApiClient.getFeaturedCategories();
  }
}
