import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/utils/encryption.dart';
import 'package:halla/features/contacts/presentation/blocs/bloc/contacts_bloc.dart';
import 'package:halla/generated/l10n.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScan extends StatefulWidget {
  const QrCodeScan({super.key});

  @override
  QrCodeScanState createState() => QrCodeScanState();
}

class QrCodeScanState extends State<QrCodeScan> {
  late QRViewController _controller;

  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.5.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 0.3.sh,
            child: QRView(
              key: _qrKey,
              overlay: QrScannerOverlayShape(
                borderLength: 22.h,
                borderWidth: 10.w,
                borderRadius: BorderSide.strokeAlignOutside,
                borderColor: AppColors.primary,
              ),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            S.of(context).scanQrcodeToAddContact,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
      _controller.scannedDataStream.listen((scanData) {
        _controller.pauseCamera();
        String userId = UserCubit.get(context).user!.id;
        EncryptedBackend encryptedBackend = EncryptedBackendImpl();
        Navigator.pop(context);
        context.read<ContactsBloc>().add(
              AddContactServerEvent(
                userId: userId,
                contactId: encryptedBackend.decrypted(scanData.code ?? ''),
              ),
            );
      });
    });
  }
}
