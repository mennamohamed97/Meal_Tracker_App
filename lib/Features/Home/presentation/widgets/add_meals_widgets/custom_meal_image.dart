import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mennaallah_mohamed/core/utils/app_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';

class CustomMealImage extends StatefulWidget {
  final Function(String) onImagePicked;

  const CustomMealImage({super.key, required this.onImagePicked});

  @override
  CustomMealImageState createState() => CustomMealImageState();
}

class CustomMealImageState extends State<CustomMealImage> {
  String? imagePath;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final savedImage = await _saveImageLocally(File(pickedFile.path));
      setState(() {
        imagePath = savedImage.path;
      });
      widget.onImagePicked(imagePath!);
    }
  }

  Future<File> _saveImageLocally(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    return await imageFile.copy(imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 80.sp,
          backgroundColor: Colors.grey[300],
          backgroundImage:
              imagePath != null ? FileImage(File(imagePath!)) : null,
          child: imagePath == null
              ? Image.asset(
                  AppImage.defaultImage,
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.fill,
                )
              : null,
        ),
        Positioned(
            bottom: 10,
            left: 110,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColor.myGreen,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 22.sp,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: _pickImage,
                  icon: Icon(Icons.camera_alt, color: AppColor.myGreen),
                ),
              ),
            )),
      ],
    );
  }
}
