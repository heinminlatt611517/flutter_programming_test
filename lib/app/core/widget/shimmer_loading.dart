import 'package:flutter/material.dart';
import 'package:flutter_programming_test/app/core/values/color_manager.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: ColorManager.greyLight,
            highlightColor: ColorManager.grey1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Container(
                    height: 20,
                    color: Colors.grey,
                  ),
                  subtitle: Container(
                    height: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}
