import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/constants/constants.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/app_show_dialog.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/core/utils/validation.dart";
import "package:halla/features/auth/presentation/blocs/sign%20cubit/sign_in_cubit.dart";
import "package:halla/features/auth/presentation/screens/log%20in/login_screen.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/nfc_write_screen.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/personal_information_screen.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/sms_code_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart";
import "package:halla/features/auth/presentation/screens/widgets/facebook_button.dart";
import "package:halla/features/auth/presentation/screens/widgets/google_button.dart";
import "package:halla/features/auth/presentation/screens/widgets/or_widget.dart";
import "package:halla/generated/l10n.dart";

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          title: Text(
            S.of(context).register,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: 0.75.sh,
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
            ),
            // body
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      AppImages.signVectorSvg,
                      height: 200.h,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    BlocListener<SignInCubit, SignInState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          loadingEmail: () => AppShowDialog.loading(context),
                          error: (String error) {
                            AppShowDialog.error(context, error);
                          },
                          successGetCodeSms: () {
                            AppNavigator.navigatePopDialog(context);
                            AppNavigator.navigatePush(
                              context,
                              SmsCodeScreen(
                                phoneNumber: phoneController.text.trim(),
                              ),
                            );
                          },
                          nfcAvailable: (isAvailable) {
                            if (isAvailable == true) {
                              AppNavigator.navigatePushReplace(
                                context,
                                NfcWriteScreen(),
                              );
                            } else {
                              AppNavigator.navigatePushReplace(
                                context,
                                PersonalInformationScreen(),
                              );
                            }
                          },
                        );
                      },
                      child: Expanded(
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
                                onEditingComplete: () => FocusScope.of(context)
                                    .requestFocus(phoneFocus),
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
                                onChanged: (p0) {
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<SignInCubit>().authSignUp(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                          pinCode:
                                              AppConstants.generatePinCode(),
                                          phoneNumber:
                                              phoneController.text.trim(),
                                        );
                                  }
                                },
                                child: Text(S.of(context).register),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              OrWidget(),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FacebookButton(),
                                  GoogleButton(),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppNavigator.navigatePushReplace(
                                      context, const LoginScreen());
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
                                          text: S
                                              .of(context)
                                              .alreadyIHaveAnAcount,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
