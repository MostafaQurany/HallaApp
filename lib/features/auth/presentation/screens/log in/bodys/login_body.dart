import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/constants/constants.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/utils/app_show_dialog.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/core/utils/validation.dart";
import "package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart";
import "package:halla/features/auth/presentation/screens/log%20in/widgets/nfc_button.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/nfc_write_screen.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/sign_screen.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/sms_code_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart";
import "package:halla/features/auth/presentation/screens/widgets/facebook_button.dart";
import "package:halla/features/auth/presentation/screens/widgets/google_button.dart";
import "package:halla/features/home/presentation/screens/home_layout.dart";
import "package:halla/generated/l10n.dart";

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPhone = false;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;

  @override
  void initState() {
    super.initState();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    emailController.addListener(emailLestner);
  }

  emailLestner() {
    if (emailController.text.isEmpty) {
      setState(() {
        _isPhone = false;
      });
    } else if (emailController.text.startsWith('01')) {
      setState(() {
        _isPhone = true;
      });
    } else {
      setState(() {
        _isPhone = false;
      });
    }
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            AppShowDialog.loading(context);
          }
          if (state is AuthSuccess) {
            AppNavigator.navigatePop(context);
            AppNavigator.navigatePushReplaceRemoveAll(
                context, const HomeLayout());
          }
          if (state is AuthFailure) {
            Navigator.pop(context);
            AppShowDialog.showErrorMessage(context, state.message);
          }
          if (state is AuthGoogleState) {
            AppNavigator.navigatePop(context);
            if (state.isExit) {
              AppNavigator.navigatePushReplaceRemoveAll(
                  context, const HomeLayout());
            } else {
              AppNavigator.navigatePushReplaceRemoveAll(
                  context, const NfcWriteScreen());
            }
          }
          if (state is AuthGetCodeSmsSiccessState) {
            AppNavigator.navigatePop(context);
            context.read<AuthBloc>().isLogWithPhone = true;
            AppNavigator.navigatePushReplace(
              context,
              SmsCodeScreen(
                phoneNumber: emailController.text.trim(),
              ),
            );
          }
          if (state is AuthSentMessageSuccess) {
            AppNavigator.navigatePop(context);
            AppNavigator.navigatePop(context);
            AppNavigator.navigatePop(context);
            AppShowDialog.showHelpSnckPar(
              context,
              S.of(context).checkYourEmail(5),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 40.h,
                    ),
                    SvgPicture.asset(
                      AppImages.loginVectorSvg,
                      height: 200.h,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      control: emailController,
                      hintText: S.of(context).emailOrPhoneNumber01,
                      prefixIcon: _isPhone
                          ? Icons.phone_outlined
                          : Icons.email_outlined,
                      keyboardType: _isPhone
                          ? TextInputType.phone
                          : TextInputType.emailAddress,
                      focusNode: emailFocus,
                      fieldType: _isPhone ? FieldType.phone : FieldType.email,
                      onEditingComplete: () => _isPhone
                          ? FocusScope.of(context).unfocus()
                          : FocusScope.of(context).requestFocus(passwordFocus),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    AnimatedSwitcher(
                      duration: AppConstants.durationSlide,
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        final offsetAnimation = Tween<Offset>(
                          begin: const Offset(2.0, 0.0),
                          end: const Offset(0.0, 0.0),
                        ).animate(animation);

                        return SlideTransition(
                            position: offsetAnimation, child: child);
                      },
                      child: !_isPhone
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomTextFormField(
                                  control: passwordController,
                                  hintText: S.of(context).password,
                                  prefixIcon: Icons.lock_outlined,
                                  suffixIcon: Icons.remove_red_eye_outlined,
                                  obscureText: true,
                                  focusNode: passwordFocus,
                                  fieldType: _isPhone
                                      ? FieldType.none
                                      : FieldType.password,
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AppShowDialog.forgetPassword(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        S.of(context).forgetPassword,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColors.primary,
                                              fontSize: 12.sp,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (_isPhone) {
                            context.read<AuthBloc>().add(
                                  AuthGetSmsCodeEvent(
                                    phoneNumber: emailController.text.trim(),
                                  ),
                                );
                          } else {
                            context.read<AuthBloc>().add(
                                  AuthLogIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                          }
                        }
                      },
                      child: Text(S.of(context).login),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    _or(),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FacebookButton(),
                        GoogleButton(),
                        NfcButton(),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).iDontHaveAnAccount,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.gray,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            AppNavigator.navigatePushReplace(
                              context,
                              const SignScreen(),
                            );
                          },
                          child: Text(
                            S.of(context).register,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

  Widget _or() => Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            S.of(context).or,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.gray,
                ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      );
}
