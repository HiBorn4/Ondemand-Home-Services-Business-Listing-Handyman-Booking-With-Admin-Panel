import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/media_model.dart';
import '../../../models/user_model.dart';
import '../../../../common/repositories/user_repository.dart';
import '../../../services/auth_service.dart';
import '../../../services/settings_service.dart';
import '../../global_widgets/phone_verification_bottom_sheet_widget.dart';

class ProfileController extends GetxController {
  late var user = new User().obs;
  late var avatar = new Media().obs;
  late final hidePassword = true.obs;
  late final oldPassword = "".obs;
  late final newPassword = "".obs;
  late final confirmPassword = "".obs;
  late final smsSent = "".obs;
  late GlobalKey<FormState> profileForm;
  late UserRepository _userRepository;

  ProfileController() {
    _userRepository = new UserRepository();
  }

  @override
  void onInit() {
    user.value = Get.find<AuthService>().user.value;
    avatar.value = new Media(thumb: user.value.avatar.thumb);
    super.onInit();
  }

  Future refreshProfile({bool? showMessage}) async {
    await getUser();
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "List of faqs refreshed successfully".tr));
    }
  }

  void saveProfileForm() async {
    Get.focusScope!.unfocus();
    if (profileForm.currentState!.validate()) {
      try {
        profileForm.currentState!.save();
        user.value.deviceToken = '';
        user.value.password = (newPassword.value == confirmPassword.value
            ? newPassword.value
            : null)!;
        user.value.avatar = avatar.value;
        if (Get.find<SettingsService>().setting.value.enableOtp) {
          await _userRepository.sendCodeToPhone();
          Get.bottomSheet(
            PhoneVerificationBottomSheetWidget(),
            isScrollControlled: false,
          );
        } else {
          user.value = await _userRepository.update(user.value);
          Get.find<AuthService>().user.value = user.value;
          Get.showSnackbar(
              Ui.SuccessSnackBar(message: "Profile saved successfully".tr));
        }
      } catch (e) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
      } finally {}
    } else {
      Get.showSnackbar(Ui.ErrorSnackBar(
          message: "There are errors in some fields please correct them!".tr));
    }
  }

  Future<void> verifyPhone() async {
    try {
      await _userRepository.verifyPhone(smsSent.value);
      user.value = await _userRepository.update(user.value);
      Get.find<AuthService>().user.value = user.value;
      Get.back();
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Profile saved successfully".tr));
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  void resetProfileForm() {
    avatar.value = new Media(thumb: user.value.avatar.thumb);
    profileForm.currentState!.reset();
  }

  Future getUser() async {
    try {
      user.value = await _userRepository.getCurrentUser();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future<void> deleteUser() async {
    try {
      await _userRepository.deleteCurrentUser();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
}
