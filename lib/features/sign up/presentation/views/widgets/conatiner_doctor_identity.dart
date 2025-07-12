import 'dart:io';
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ContainerDoctorIdentity extends StatefulWidget {
  const ContainerDoctorIdentity({
    super.key,
    required this.imgPath,
    required this.txt1,
    required this.txt2,
    required this.onFilePicked,
    this.useCamera = false,
  });

  final String imgPath;
  final String txt1;
  final String txt2;
  final Function(File) onFilePicked;
  final bool useCamera;

  @override
  State<ContainerDoctorIdentity> createState() => _ContainerDoctorIdentityState();
}

class _ContainerDoctorIdentityState extends State<ContainerDoctorIdentity> {
  String? fileName;

  Future<void> pickFile() async {
    File? file;

    if (widget.useCamera) {
      // استخدام الكاميرا
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        file = File(pickedImage.path);
        fileName = pickedImage.name;
      }
    } else {
      // استخدام file picker للملفات أو الصور من الجهاز
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        file = File(result.files.single.path!);
        fileName = result.files.single.name;
      }
    }

    if (file != null) {
      setState(() {});
      widget.onFilePicked(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickFile,
      child: Container(
        height: context.screenHeight * 0.22,
        width: context.screenWidth * 0.95,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.txt1, style: Styles.textstyle14),
            SizedBox(height: 10.h),
            Text(widget.txt2, style: Styles.textstyle12),
            SizedBox(height: 10.h),
            if (fileName != null)
              Text(
                fileName!,
                style: Styles.textstyle12.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            else
              SizedBox(height: 48.h, child: Image.asset(widget.imgPath)),
          ],
        ),
      ),
    );
  }
}
