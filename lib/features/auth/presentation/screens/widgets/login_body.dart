import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halla/core/common/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final formKey = GlobalKey<FormState>();
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
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40.h,
              ),
              SvgPicture.asset(
                AppImages.loginVector,
                height: 200.h,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextFormField(
                control: emailController,
                hintText: "Email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocus,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(passwordFocus),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextFormField(
                control: passwordController,
                hintText: "Password",
                prefixIcon: Icons.lock_outlined,
                suffixIcon: Icons.remove_red_eye_outlined,
                obscureText: true,
                focusNode: passwordFocus,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
              ),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Login"),
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
                  GestureDetector(
                    onTap: () {
                      // ToDo : login NFC
                    },
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
                      child: Image.asset(
                        AppTheme.isLight(context)
                            ? AppImages.nfcIcon
                            : AppImages.nfcIconDark,
                      ),
                    ),
                  )
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
                      children: [
                        const TextSpan(text: "I Don't Have an Account ? "),
                        TextSpan(
                          text: 'Register.',
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
