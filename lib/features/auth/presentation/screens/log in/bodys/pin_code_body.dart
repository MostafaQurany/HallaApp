import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart';
import 'package:halla/features/auth/presentation/screens/widgets/pin_code_text_form_field.dart';
import 'package:halla/features/home/presentation/screens/home_layout.dart';
import 'package:halla/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class PinCodeBody extends StatefulWidget {
  const PinCodeBody({
    super.key,
  });

  @override
  State<PinCodeBody> createState() => _PinCodeBodyState();
}

class _PinCodeBodyState extends State<PinCodeBody> {
  final TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? pinCode;
  @override
  void initState() {
    super.initState();
    pinCode = UserCubit.get(context).user!.pinCode;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 160.h,
                    child: Lottie.asset(AppImages.pinCodeLottie)),
                Form(
                  key: formKey,
                  child: CustomPinCodeField(
                    pinController: pinController,
                    validator: (value) {
                      if (pinCode == null) {
                        AuthState state = context.read<AuthBloc>().state;
                        if (state is NfcReadNfc) {
                          if (value != state.nfcMessage.pinCode) {
                            return S.of(context).pinIsIncorrect;
                          }
                        }
                      } else {
                        if (value != pinCode) {
                          return S.of(context).pinIsIncorrect;
                        }
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).forgetPassword,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.errorborder),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoading) {
                      AppShowDialog.loading(context);
                    }
                    if (state is AuthGetUserSuccess) {
                      AppNavigator.navigatePushReplaceRemoveAll(
                          context, const HomeLayout());
                    }
                    if (state is AuthFailure) {
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          AuthState state = context.read<AuthBloc>().state;
                          if (state is NfcReadNfc) {
                            context.read<AuthBloc>().add(
                                  AuthCheckPinCode(
                                    userId: state.nfcMessage.uId,
                                    pinCode: pinController.text.trim(),
                                    userPinCode: state.nfcMessage.pinCode,
                                  ),
                                );
                          } else {
                            AppNavigator.navigatePush(
                                context, const HomeLayout());
                          }
                        }
                      },
                      child: Text(S.of(context).verified),
                    );
                  },
                ),
                SizedBox(
                  height: 60.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
