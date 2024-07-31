import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/utils/encryption.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomShareContactIcon extends StatefulWidget {
  const CustomShareContactIcon(
      {super.key, required this.userId, this.iconColor});
  final String userId;
  final Color? iconColor;

  @override
  State<CustomShareContactIcon> createState() => _CustomShareContactIconState();
}

class _CustomShareContactIconState extends State<CustomShareContactIcon> {
  final EncryptedBackend encryptedBackend = EncryptedBackendImpl();
  String message = '';
  @override
  void initState() {
    super.initState();
    message = encryptedBackend.encrypted(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: SizedBox(
                width: 230.w,
                height: 230.w,
                child: QrImageView(
                  data: message,
                  size: 230.w,
                  backgroundColor: AppTheme.isLight(context)
                      ? Colors.transparent
                      : AppColors.white,
                ),
              ),
              content: Text(
                "Scan Qr-Code",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      },
      icon: ImageIcon(
        AssetImage(
          AppImages.shareContact,
        ),
        color: widget.iconColor,
        size: 18.sp,
      ),
    );
  }
}
