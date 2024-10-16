// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/domain/entities/nfc_message.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custom_nfc_close_error.dart';
import 'package:lottie/lottie.dart';

import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/personal_information_screen.dart';
import 'package:halla/generated/l10n.dart';
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
    super.initState();
    context.read<AuthBloc>().add(GetIsNfcOpenEvent());
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
                context.read<AuthBloc>().closeNfcStatusStream();
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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            AppShowDialog.loading(context);
          }
          if (state is AuthFailure) {
            AppShowDialog.showErrorMessage(context, state.message);
          }
          if (state is NfcState) {
            if (state.isOpen) {
              _slideTransitionController.reverse();
              if (_nfcIsOpen != state.isOpen) {
                UserState userState = context.read<UserCubit>().state;
                if (userState is UserLoggedIn) {
                  nfcMessage = NfcMessage(
                    id: const Uuid().v1(),
                    uId: userState.user!.id,
                    email: userState.user!.email,
                    phone: userState.user!.primePhone,
                    pinCode: userState.user!.pinCode,
                  );
                  context.read<AuthBloc>().add(
                        WriteOnNfcEvent(
                          nfcMessage: nfcMessage!,
                        ),
                      );
                }
              }
            } else {
              _slideTransitionController.forward();
            }
            _nfcIsOpen = state.isOpen;
          }
          if (state is NfcUseState) {
            UserState userState = context.read<UserCubit>().state;
            if (userState is UserLoggedIn) {
              userState.user!.nfcList.add(state.nfcId);
              context.read<AuthBloc>().add(
                    AuthUploadUserEvent(user: userState.user!),
                  );
            }
          }

          if (state is AuthUploadSuccess) {
            AppNavigator.navigatePop(context);
            context.read<AuthBloc>().closeNfcStatusStream();
            AppNavigator.navigatePushReplaceRemoveAll(
              context,
              const PersonalInformationScreen(),
            );
          }
        },
        builder: (context, state) {
          if (state is GetIsNfcAvailableState && !state.isAvailable) {
            return const Center(
              child: Text(
                "Your device dont support NFC.",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
