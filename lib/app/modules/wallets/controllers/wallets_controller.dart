import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/wallet_model.dart';
import '../../../models/wallet_transaction_model.dart';
import '../../../../common/repositories/payment_repository.dart';

class WalletsController extends GetxController {
  late final wallets = <Wallet>[].obs;
  late final walletTransactions = <WalletTransaction>[].obs;
  late final selectedWallet = new Wallet(id: '', name: '', balance: 0).obs;
  late PaymentRepository _paymentRepository;

  WalletsController() {
    _paymentRepository = new PaymentRepository();
  }

  @override
  void onInit() async {
    await refreshWallets();
    super.onInit();
  }

  Future refreshWallets({bool? showMessage}) async {
    await getWallets();
    initSelectedWallet();
    await getWalletTransactions();
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "List of wallets refreshed successfully".tr));
    }
  }

  Future getWallets() async {
    try {
      wallets.assignAll(await _paymentRepository.getWallets());
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getWalletTransactions() async {
    try {
      walletTransactions.assignAll(
          await _paymentRepository.getWalletTransactions(selectedWallet.value));
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  void initSelectedWallet() {
    if (!selectedWallet.value.hasData && wallets.isNotEmpty) {
      selectedWallet.value = wallets.elementAt(0);
    }
  }
}
