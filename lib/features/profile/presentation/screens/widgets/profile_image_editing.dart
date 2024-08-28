import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/common/presentation/widgets/circle_image.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';

class ProfileImageEditing extends StatefulWidget {
  const ProfileImageEditing({super.key});

  @override
  State<ProfileImageEditing> createState() => ProfileImageEditingState();
}

class ProfileImageEditingState extends State<ProfileImageEditing> {
  final ImagePicker _picker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (image != null)
            ? Container(
                height: 120.w,
                width: 120.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(image!),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : CircleImage(
                imageUrl: UserCubit.get(context).user!.imageUrl,
                height: 120.w,
                width: 120.w,
              ),
        IconButton(
          onPressed: _pickImage,
          icon: ImageIcon(
            AssetImage(
              AppImages.editImageIcon,
            ),
            color: AppColors.primary,
          ),
        )
      ],
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File? croppedFile = await _cropImage(File(pickedFile.path));
      setState(() {
        if (croppedFile != null) {
          image = croppedFile;
        } else {
          image = null;
        }
      });
    }
  }

  Future<File?> _cropImage(File file) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarColor: AppColors.primary,
          toolbarWidgetColor: AppColors.primaryObesty,
          hideBottomControls: true,
          lockAspectRatio: true,
          cropStyle: CropStyle.circle,
          initAspectRatio: CropAspectRatioPreset.square,
          cropFrameColor: AppColors.transparent,
          cropGridColor: AppColors.transparent,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );
    return File(croppedFile!.path);
  }
}
