import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/core/utils/validation.dart";
import "package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart";
import "package:halla/features/auth/presentation/screens/log%20in/login_screen.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/pin_code_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart";
import "package:halla/generated/l10n.dart";

class SignBody extends StatefulWidget {
  const SignBody({super.key});

  @override
  State<SignBody> createState() => _SignBodyState();
}

class _SignBodyState extends State<SignBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              AppImages.signVector,
              height: 200.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  // TODO:show snake pare
                  print(state.message);
                }
                if (state is AuthSuccess) {
                  context.read<AuthBloc>().add(
                        AuthUploadUserEvent(
                          user: state.user,
                        ),
                      );
                }
                if (state is AuthUploadSuccess) {
                  context.read<AuthBloc>().add(
                        AuthGetSmsCodeEvent(
                          phoneNumber: phoneController.text.trim(),
                        ),
                      );
                }
                if (state is AuthGetCodeSmsSiccessState) {
                  navigatePush(
                      context,
                      PinCodeScreen(
                        phoneNumber: phoneController.text.trim(),
                      ));
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const CircularProgressIndicator();
                }
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CustomTextFormField(
                          control: emailController,
                          focusNode: emailFocus,
                          hintText: S.of(context).email,
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
                          hintText: S.of(context).phone,
                          prefixIcon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                          fieldType: FieldType.phone,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(passwordFocus),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomTextFormField(
                          control: passwordController,
                          focusNode: passwordFocus,
                          hintText: S.of(context).password,
                          prefixIcon: Icons.lock_outlined,
                          suffixIcon: Icons.remove_red_eye_outlined,
                          obscureText: true,
                          fieldType: FieldType.password,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(confirmPasswordFocus),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomTextFormField(
                          control: confirmPasswordController,
                          focusNode: confirmPasswordFocus,
                          hintText: S.of(context).confirmPassword,
                          prefixIcon: Icons.lock_outlined,
                          suffixIcon: Icons.remove_red_eye_outlined,
                          fieldType: FieldType.confPasword,
                          confirmPassword: passwordController.text,
                          obscureText: true,
                          onEditingComplete: () =>
                              FocusScope.of(context).unfocus(),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    AuthSignUp(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  );
                            }
                          },
                          child: Text(S.of(context).register),
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
                          children: <Widget>[
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
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: S.of(context).alreadyIHaveAnAcount,
                                  ),
                                  TextSpan(
                                    text: S.of(context).login,
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }

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
