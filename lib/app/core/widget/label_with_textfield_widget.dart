import 'package:flutter/material.dart';

import '../values/color_manager.dart';
import '../values/values_manager.dart';

class LabelWithTextFieldWidget extends StatelessWidget {
  TextEditingController? textEditingController = TextEditingController();
  final String labelText;
  final String hintText;
  final Function(String)? onTextDataChange;
  final Function(String)? onSubmit;

  LabelWithTextFieldWidget(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.onTextDataChange,
      this.textEditingController,
      this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p16, left: AppPadding.p16, right: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != "")
            Text(
              labelText,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          if (labelText != "")
            const SizedBox(
              height: AppSize.s8,
            ),
          TextFormField(
            maxLines: labelText=='Description'? 5 :1,
            enabled: labelText == "Due Date"
                ? false
                : true,
            controller: textEditingController,
            keyboardType: TextInputType.multiline,
            onChanged: (String value) {
              onTextDataChange!(value);
            },
            onFieldSubmitted: (value){
              onSubmit!(value);
            },
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: ColorManager.black),
            decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: ColorManager.lightGrey), //<-- SEE HERE
                ),
                fillColor: ColorManager.white.withOpacity(0.8),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: ColorManager.lightGrey)),
          ),
        ],
      ),
    );
  }
}
