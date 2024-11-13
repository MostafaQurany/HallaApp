// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/domain/entities/nfc_message.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/blocs/nfc%20cubit/nfc_cubit.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/personal_information_screen.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custom_nfc_close_error.dart';
import 'package:halla/generated/l10n.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

class NfcWriteScreen extends StatefulWidget {
  const NfcWriteScreen({super.key});

  @override
  State<NfcWriteScreen> createState() => _NfcWriteScreenState();
}

class _NfcWriteScreenState extends State<NfcWriteScreen>
    with TickerProviderStateMixin {
  late AnimationController _slideTransitionController;
  late Animation<Offset> _animationOffset;
  bool _nfcIsOpen = false;
  NfcMessage? nfcMessage;

  @override
  void initState() {
    print("object");
    super.initState();
    context.read<NfcCubit>().getIsNfcOpenEvent();
    _slideTransitionController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationOffset = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideTransitionController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Put NFC Tag",
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                context.read<NfcCubit>().closeNfcStatusStream();
                AppNavigator.navigatePushReplaceRemoveAll(
                  context,
                  const PersonalInformationScreen(),
                );
              },
              child: Text(
                S.of(context).skip,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<NfcCubit, NfcState>(
        listener: (context, state) {
          state.whenOrNull(
            nfcLoading: () {
              AppShowDialog.loading(context);
            },
            nfcError: (error) {
              AppShowDialog.error(context, error);
            },
            nfcState: (isOpen) {
              if (isOpen) {
                _slideTransitionController.reverse();
              } else {
                _slideTransitionController.forward();
              }
              _nfcIsOpen = isOpen;
            },
            nfcUseState: (nfcUseState, nfcId) {
              UserState userState = context.read<UserCubit>().state;
              UserCubit.get(context).user!.nfcList.add(nfcId);
              context
                  .read<NfcCubit>()
                  .authUploadUser(UserCubit.get(context).user!);
            },
            uploadUserSuccess: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PersonalInformationScreen(),
              ),
            ),
          );
        },
        builder: (context, state) {
          state.whenOrNull(
            nfcAvailable: (isAvailable) {
              if (!isAvailable) {
                return const Center(
                  child: Text(
                    "Your device don't support NFC.",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            },
          );
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomNfcCloseError(
                    animationOffset: _animationOffset,
                    slideTransitionController: _slideTransitionController,
                  ),
                  SizedBox(
                    width: 1.sw,
                    height: 0.5.sh,
                    child: Lottie.asset(
                      AppImages.nfcWriteLottie,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        nfcMessage = NfcMessage(
                          id: const Uuid().v1(),
                          uId: UserCubit.get(context).user?.id ?? '',
                          email: UserCubit.get(context).user?.email ?? '',
                          phone: UserCubit.get(context).user?.primePhone ?? '',
                          pinCode: UserCubit.get(context).user?.pinCode ?? '',
                        );
                        context
                            .read<NfcCubit>()
                            .writeOnNfcEvent(nfcMessage: nfcMessage!);
                      },
                      child: Text("Write on NFC "))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
