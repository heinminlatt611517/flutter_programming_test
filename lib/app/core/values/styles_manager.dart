import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'values_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

// light style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.black87, minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
  ),
);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: Colors.grey[300],
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
  ),
);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  backgroundColor: Colors.black87,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
  ),
).copyWith(
  side: MaterialStateProperty.resolveWith<BorderSide>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return BorderSide(
          color: ColorManager.primaryOpacity70,
          width: 1,
        );
      }
       return BorderSide(
        color: ColorManager.primary,
        width: 1,
      ); // Defer to the widget's default.
    },
  ),
);
