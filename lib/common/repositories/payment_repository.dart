import 'package:get/get.dart';

import '../../app/models/booking_model.dart';
import '../../app/models/payment_method_model.dart';
import '../../app/models/payment_model.dart';
import '../../app/models/wallet_model.dart';
import '../../app/models/wallet_transaction_model.dart';
import '../../app/providers/laravel_provider.dart';

class PaymentRepository {
  late LaravelApiClient _laravelApiClient;

  PaymentRepository() {
    _laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<List<PaymentMethod>> getMethods() {
    return _laravelApiClient.getPaymentMethods();
  }

  Future<List<Wallet>> getWallets() {
    return _laravelApiClient.getWallets();
  }

  Future<List<WalletTransaction>> getWalletTransactions(Wallet wallet) {
    return _laravelApiClient.getWalletTransactions(wallet);
  }

  Future<Wallet> createWallet(Wallet wallet) {
    return _laravelApiClient.createWallet(wallet);
  }

  Future<Wallet> updateWallet(Wallet wallet) {
    return _laravelApiClient.updateWallet(wallet);
  }

  Future<bool> deleteWallet(Wallet wallet) {
    return _laravelApiClient.deleteWallet(wallet);
  }

  Future<Payment> create(Booking booking) {
    return _laravelApiClient.createPayment(booking);
  }

  Future<Payment> createWalletPayment(Booking booking, Wallet wallet) {
    return _laravelApiClient.createWalletPayment(booking, wallet);
  }

  String getPayPalUrl(Booking booking) {
    return _laravelApiClient.getPayPalUrl(booking);
  }

  String getRazorPayUrl(Booking booking) {
    return _laravelApiClient.getRazorPayUrl(booking);
  }

  String getStripeUrl(Booking booking) {
    return _laravelApiClient.getStripeUrl(booking);
  }

  String getPayStackUrl(Booking booking) {
    return _laravelApiClient.getPayStackUrl(booking);
  }

  String getPayMongoUrl(Booking booking) {
    return _laravelApiClient.getPayMongoUrl(booking);
  }

  String getFlutterWaveUrl(Booking booking) {
    return _laravelApiClient.getFlutterWaveUrl(booking);
  }

  String getStripeFPXUrl(Booking booking) {
    return _laravelApiClient.getStripeFPXUrl(booking);
  }
}
