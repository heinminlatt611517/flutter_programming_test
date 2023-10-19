import 'package:flutter/material.dart';
import '../helper/app_enum.dart';
import '../values/color_manager.dart';
import '../values/font_manager.dart';
import '../values/values_manager.dart';

class ButtonView extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color? buttonColor;
  final ButtonType buttonType;
  final double? fontSize;
  final double? width;
  final double? height;
  const ButtonView({Key? key, required this.onPressed,required this.buttonText,required this.buttonType,this.buttonColor,this.fontSize=AppSize.s20,this.width=100,this.height=50}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
     switch(buttonType){
      case ButtonType.TextButton :
        return textButton(context);
       case ButtonType.ElevatedButton :
         return elevatedButton(context,fontSize);
       case ButtonType.OutlinedButton:
         return outlinedButton(context);
    }
  }

  Widget elevatedButton(context,fontSize)
  {
    return ElevatedButton(onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size.fromHeight(height!)),
        backgroundColor:MaterialStateProperty.all<Color>(buttonColor??ColorManager.primary),
      ),
      child:FittedBox(child: Text(buttonText,style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: FontSize.s14,fontWeight: FontWeight.w600),)),);
  }

  Widget textButton(context)
  {
    return TextButton(
        style:ButtonStyle(
      backgroundColor:MaterialStateProperty.all<Color>(buttonColor??ColorManager.primary),
    ),
        onPressed: onPressed,
        child: Text(buttonText,style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: FontSize.s14,fontWeight: FontWeight.w600),)
    );
  }

  Widget outlinedButton(context)
  {
    return OutlinedButton(onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all<Color>(buttonColor??ColorManager.primary),
      ),
      child:Text(buttonText,style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: FontSize.s14,fontWeight: FontWeight.w600),),);
  }
}
