// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../providers/laravel_provider.dart';
import '../../root/controllers/root_controller.dart';
import '../controllers/profile_controller.dart';

class DeleteAccountWidget extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: Ui.getBoxDecoration(),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Delete your account!",
                    style: Get.textTheme.bodyText2!
                        .merge(TextStyle(color: Colors.redAccent))),
                Text(
                    "Once you delete this account, there is no going back. Please be certain.",
                    style: Get.textTheme.caption!
                        .merge(TextStyle(color: Colors.redAccent))),
              ],
            ),
          ),
          SizedBox(width: 10),
          Obx(() {
            if (Get.find<LaravelApiClient>()
                .isLoading(task: 'deleteUser', tasks: [])) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.5,
                  ),
                ),
              );
            }
            return MaterialButton(
              onPressed: () {
                _showDeleteDialog(context);
              },
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.redAccent,
              child: Text("Delete".tr,
                  style: Get.textTheme.bodyText2!
                      .merge(TextStyle(color: Get.theme.primaryColor))),
              elevation: 0,
              highlightElevation: 0,
              hoverElevation: 0,
              focusElevation: 0,
            );
          }),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Delete your account!".tr,
            style: TextStyle(color: Colors.redAccent),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                    "Once you delete this account, there is no going back. Please be certain."
                        .tr,
                    style: Get.textTheme.bodyText1),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel".tr, style: Get.textTheme.bodyText1),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text(
                "Confirm".tr,
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () async {
                Get.back();
                await controller.deleteUser();
                await Get.find<RootController>().changePage(0);
              },
            ),
          ],
        );
      },
    );
  }
}
