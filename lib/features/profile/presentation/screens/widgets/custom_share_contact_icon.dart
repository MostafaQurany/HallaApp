import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/utils/encryption.dart';
import 'package:halla/generated/l10n.dart';
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
        showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: const Duration(milliseconds: 200),
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          transitionBuilder: (context, a1, a2, widget) {
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: widget,
              ),
            );
          },
          pageBuilder: (context, animation1, animation2) {
            return AlertDialog(
              title: SizedBox(
                height: 300.w,
                width: 300.w,
                child: Center(
                  child: QrImageView(
                    data: message,
                    version: QrVersions.auto,
                    gapless: true,
                    backgroundColor: AppColors.white,
                    errorStateBuilder: (cxt, err) {
                      return Center(
                        child: Text(
                          'Uh oh! Something went wrong...',
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
              ),
              content: Text(
                S.of(context).scanQrcodeToAddContact,
                style: Theme.of(context).textTheme.bodyLarge,
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
      ),
    );
  }
}
