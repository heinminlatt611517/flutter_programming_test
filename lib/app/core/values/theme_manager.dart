import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'values_manager.dart';
import 'styles_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main Colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      // ripple color
      splashColor: ColorManager.primaryOpacity70,
      colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
      // card view theme
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),
      //AppBarTheme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.primaryOpacity70,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16)),
      // Button theme
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70,
      ),
      // elevated button theme
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //         textStyle: getRegularStyle(color: ColorManager.white),
      //         primary: ColorManager.primary,
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(AppSize.s12)))),
      textButtonTheme: TextButtonThemeData(style: flatButtonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
      // Text theme
      textTheme: TextTheme(
          headline1: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s20),
          headline2: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s20),
          headline3: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s20),
          headline4: getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s16),
          headline5: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s20), // bold number text keyboard
          headline6: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s16), // bold text with primary color
          subtitle1: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s16),
          subtitle2: getMediumStyle(color: ColorManager.white, fontSize: FontSize.s16), // medium button text white
          caption:   getRegularStyle(color: ColorManager.darkGrey,fontSize: FontSize.s16), // crate text fontsize 16 color darkGrey
          bodyText1: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s20),//regular error black text label
          bodyText2: getBoldStyle(color:ColorManager.black,fontSize: FontSize.s20)
      ),
      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        //hint style
        hintStyle: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s16),

        // label style
        labelStyle: getMediumStyle(color: ColorManager.darkGrey,fontSize: FontSize.s20),

        // error style
        errorStyle: getRegularStyle(color: ColorManager.error,fontSize: FontSize.s20),

        //enable border
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        // focused border
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        //error border
        errorBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        //focused error border
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        floatingLabelStyle: getMediumStyle(color: ColorManager.darkGrey,fontSize: FontSize.s16),

      ));
}
