import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/app_show_dialog.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/core/utils/validation.dart";
import "package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart";
import "package:halla/features/auth/presentation/screens/log%20in/widgets/nfc_button.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/nfc_write_screen.dart";
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

  late FocusNode emailFocus;
  late FocusNode passwordFocus;

  @override
  void initState() {
    super.initState();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
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
            AppNavigator.navigatePushReplaceRemoveAll(
                context, const HomeLayout());
          }
          if (state is AuthFailure) {
            Navigator.pop(context);
            print(state.message);
          }
          if (state is AuthGoogleState) {
            if (state.isExit) {
              AppNavigator.navigatePushReplaceRemoveAll(
                  context, const HomeLayout());
            } else {
              AppNavigator.navigatePushReplaceRemoveAll(
                  context, const NfcWriteScreen());
            }
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
                      hintText: S.of(context).email,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocus,
                      fieldType: FieldType.email,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(passwordFocus),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      control: passwordController,
                      hintText: S.of(context).password,
                      prefixIcon: Icons.lock_outlined,
                      suffixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true,
                      focusNode: passwordFocus,
                      fieldType: FieldType.password,
                      onEditingComplete: () => FocusScope.of(context).unfocus(),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
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
                    GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.gray,
                            ),
                            children: <InlineSpan>[
                              TextSpan(text: S.of(context).iDontHaveAnAccount),
                              TextSpan(
                                text: S.of(context).register,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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

  Widget _iconsSouxile({
    required String image,
    required Function() onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 50.w,
          height: 50.w,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppTheme.isLight(context)
                ? AppColors.primaryObesty
                : AppColors.blackLight,
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
          ),
          child: SvgPicture.asset(
            image,
          ),
        ),
      );
}
