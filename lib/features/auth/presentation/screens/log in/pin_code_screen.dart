import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/blocs/login%20cubit/login_cubit.dart';
import 'package:halla/features/auth/presentation/screens/widgets/pin_code_text_form_field.dart';
import 'package:halla/features/home/presentation/screens/home_layout.dart';
import "package:halla/generated/l10n.dart";
import 'package:lottie/lottie.dart';

class PinCodeScreen extends StatefulWidget {
  final String userId;

  final String pinCode;

  const PinCodeScreen({super.key, required this.userId, required this.pinCode});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          title: Text(
            S.of(context).enterPinCodePassword,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            _backGround(),
            Padding(
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
                      child: Lottie.asset(AppImages.pinCodeLottie),
                    ),
                    Form(
                      key: formKey,
                      child: CustomPinCodeField(
                        pinController: pinController,
                        validator: (value) {
                          if (value != widget.pinCode) {
                            return S.of(context).pinIsIncorrect;
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
                        onPressed: () {
                          AppShowDialog.showConfirmToDeleteGuest(context);
                        },
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
                    BlocListener<LoginCubit, LoginState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          getUserLoading: () => AppShowDialog.loading(context),
                          getUserError: (message) =>
                              AppShowDialog.error(context, message),
                          getUserSuccess: () =>
                              AppNavigator.navigatePushReplaceRemoveAll(
                            context,
                            HomeLayout(),
                          ),
                        );
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (pinController.text == widget.pinCode) {
                              context.read<LoginCubit>().getUser(widget.userId);
                            }
                          }
                        },
                        child: Text(S.of(context).verified),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  _backGround() {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
        width: double.maxFinite,
        height: 0.8.sh,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.primary.withOpacity(0.1),
              blurRadius: 1.sh,
            ),
          ],
        ),
        child: Image.asset(
          AppTheme.isLight(context)
              ? AppImages.loginSignBackgroundLight
              : AppImages.loginSignBackgroundDark,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
