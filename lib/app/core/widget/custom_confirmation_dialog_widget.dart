import 'package:flutter/material.dart';
import 'package:flutter_programming_test/app/core/values/font_manager.dart';
import 'package:get/get.dart';

import '../helper/app_enum.dart';
import '../values/color_manager.dart';
import '../values/values_manager.dart';
import 'button_widget.dart';

class CustomConfirmationDialogWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? onConfirm;
  final Function()? onCancel;

  const CustomConfirmationDialogWidget(
      {Key? key, this.title, this.message, this.onConfirm, this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppPadding.p20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      width: AppSize.s180,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
          border: Border.all(color: ColorManager.primary.withOpacity(0.9))),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: AppPadding.p8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: title == ""
                    ? Image.asset(
                        "assets/images/success.png",
                        width: AppSize.s40,
                        height: AppSize.s40,
                      )
                    : title == "fillDataAlert"
                        ? Image.asset(
                            "assets/images/warning.png",
                            width: AppSize.s40,
                            height: AppSize.s40,
                          )
                        : Text(title ?? "",
                            style: TextStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s18)),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                message ?? "",
                style:
                    Theme.of(context).textTheme.caption!.copyWith(height: 1.7),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: AppPadding.p8, top: AppPadding.p8),
              child: Row(
                mainAxisAlignment: onCancel == null
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  if (onCancel != null)
                    SizedBox(
                        width: AppSize.s100,
                        child: ButtonView(
                          onPressed: onCancel!,
                          buttonText: "cancel".tr,
                          buttonType: ButtonType.OutlinedButton,
                          buttonColor: ColorManager.white.withOpacity(0.8),
                          height: AppSize.s30,
                        )),
                  if (onCancel != null)
                    const SizedBox(
                      width: AppPadding.p16,
                    ),
                  SizedBox(
                      width: AppSize.s100,
                      child: ButtonView(
                        onPressed: onConfirm!,
                        buttonText: "ok".tr,
                        buttonType: ButtonType.ElevatedButton,
                        height: AppSize.s30,
                        fontSize: AppSize.s14,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
