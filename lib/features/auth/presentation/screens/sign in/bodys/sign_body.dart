import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halla/core/common/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/screens/log%20in/login_screen.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/pin_code_screen.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart';

class SignBody extends StatefulWidget {
  const SignBody({super.key});

  @override
  State<SignBody> createState() => _SignBodyState();
}

class _SignBodyState extends State<SignBody> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  late FocusNode emailFocus;
  late FocusNode phoneFocus;
  late FocusNode passwordFocus;
  late FocusNode confirmPasswordFocus;

  @override
  void initState() {
    super.initState();
    emailFocus = FocusNode();
    phoneFocus = FocusNode();
    passwordFocus = FocusNode();
    confirmPasswordFocus = FocusNode();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SvgPicture.asset(
              AppImages.signVector,
              height: 200.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormField(
                      control: emailController,
                      focusNode: emailFocus,
                      hintText: "Email",
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(phoneFocus),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      control: phoneController,
                      focusNode: phoneFocus,
                      hintText: "Phone",
                      prefixIcon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(passwordFocus),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      control: passwordController,
                      focusNode: passwordFocus,
                      hintText: "Password",
                      prefixIcon: Icons.lock_outlined,
                      suffixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(confirmPasswordFocus),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      control: confirmPasswordController,
                      focusNode: confirmPasswordFocus,
                      hintText: "Confirm Password",
                      prefixIcon: Icons.lock_outlined,
                      suffixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true,
                      onEditingComplete: () => FocusScope.of(context).unfocus(),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: register Sign in
                        navigatePush(context, const PinCodeScreen());
                      },
                      child: const Text("Register"),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    _or(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _iconsSouxile(
                          image: AppImages.facebookIcon,
                          onTap: () {
                            // ToDo : login FaceBook
                          },
                        ),
                        _iconsSouxile(
                          image: AppImages.googleIcon,
                          onTap: () {
                            // ToDo : login google
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigatePushReplace(context, const LoginScreen());
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.gray,
                            ),
                            children: [
                              const TextSpan(
                                  text: "Already I have An Acount ? "),
                              TextSpan(
                                text: 'Login.',
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
          ],
        ),
      ),
    );
  }

  Widget _or() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
          "OR",
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

  Widget _iconsSouxile({
    required String image,
    required Function() onTap,
  }) {
    return GestureDetector(
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
          image.toString(),
        ),
      ),
    );
  }
}
