import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buildLoadingIndicator({required double width, required double height}) {
  return Center(
    child: SizedBox(
      width: width,
      height: height,
      child: Lottie.asset('assets/lottie/loading.json'),
    ),
  );
}
