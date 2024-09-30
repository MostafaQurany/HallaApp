import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/common/domain/entities/company.dart";
import "package:halla/core/common/domain/entities/social_media.dart";
import "package:halla/core/common/domain/entities/user.dart";
import "package:halla/core/common/presentation/cubit/user/user_cubit.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/app_show_dialog.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/sms_code_screen.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_birthday_field.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_company_field.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_nationality_field.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_social_media_field.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/widgets/phones_widget.dart";
import "package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart";
import "package:halla/features/home/presentation/screens/home_layout.dart";
import "package:halla/generated/l10n.dart";

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyPhoneController = TextEditingController();
  final TextEditingController companyWebsiteController =
      TextEditingController();
  final TextEditingController companyPositonController =
      TextEditingController();

  final TextEditingController socialFacebookController =
      TextEditingController();
  final TextEditingController socialInstagramController =
      TextEditingController();
  final TextEditingController socialLinkedinController =
      TextEditingController();
  final TextEditingController socialTwitterController = TextEditingController();

  final GlobalKey<PhonesWidgetState> phonesWidgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  width: double.maxFinite,
                  height: 1.sh,
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
                        ? AppImages.personalInformationBackground
                        : AppImages.personalInformationBackgroundDark,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    AppShowDialog.loading(context);
                  }
                  if (state is AuthFailure) {
                    Navigator.pop(context);

                    AppShowDialog.showErrorMessage(context, state.message);
                  }
                  if (state is AuthPersonalInfoSuccess) {
                    AppNavigator.navigatePushReplaceRemoveAll(
                      context,
                      const HomeLayout(),
                    );
                  }
                  if (state is AuthGetCodeSmsSiccessState) {
                    AppNavigator.navigatePush(
                      context,
                      SmsCodeScreen(
                        phoneNumber: phonesWidgetKey.currentState!
                            .phonesController["prime phone"]!.text,
                      ),
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
                          children: <Widget>[
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              S.of(context).personalNinformation,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormField(
                              control: nameController,
                              hintText: S.of(context).fullName,
                              prefixIcon: Icons.person_2_outlined,
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            PhonesWidget(
                              key: phonesWidgetKey,
                            ),
                            BirthdayPickerTextField(
                              controller: dateOfBirthController,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomNationalityField(
                              controller: nationalityController,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomSocialMediaField(
                              socialFacebookController:
                                  socialFacebookController,
                              socialInstagramController:
                                  socialInstagramController,
                              socialLinkedinController:
                                  socialLinkedinController,
                              socialTwitterController: socialTwitterController,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            CustomCompanyField(
                              companyNameController: companyNameController,
                              companyPhoneController: companyPhoneController,
                              companyWebsiteController:
                                  companyWebsiteController,
                              companyPositonController:
                                  companyPositonController,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  User user = _featchData();
                                  if (context
                                      .read<AuthBloc>()
                                      .isSignWithSocial) {
                                    context.read<AuthBloc>().add(
                                          AuthGetSmsCodeEvent(
                                            phoneNumber: phonesWidgetKey
                                                .currentState!
                                                .phonesController[
                                                    "prime phone"]!
                                                .text,
                                          ),
                                        );
                                  } else {
                                    context.read<AuthBloc>().add(
                                          AuthPersonalInfoEvent(user: user),
                                        );
                                  }
                                }
                              },
                              child: Text(S.of(context).next),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );

  User _featchData() {
    Company company = Company(
      name: companyNameController.text,
      phoneNumber: companyPhoneController.text,
      website: companyWebsiteController.text,
      position: companyPositonController.text,
    );
    SocialMedia socialMedia = SocialMedia(
      facebook: socialFacebookController.text,
      instagram: socialInstagramController.text,
      linkedin: socialLinkedinController.text,
      twitter: socialTwitterController.text,
    );
    List<String> phoneNumbers = phonesWidgetKey.currentState?.getPhones() ?? [];
    User user = UserCubit.get(context).user!;

    if (user.primePhone.isEmpty) {
      user.primePhone = phoneNumbers.first;
    }
    user = User(
      id: user.id,
      email: user.email,
      fullName:
          nameController.text.isNotEmpty ? nameController.text : user.fullName,
      primePhone:
          phonesWidgetKey.currentState!.phonesController["prime phone"]!.text,
      dateOfBirth: dateOfBirthController.text.isNotEmpty
          ? dateOfBirthController.text
          : user.dateOfBirth,
      nationality: nationalityController.text.isNotEmpty
          ? nationalityController.text
          : user.nationality,
      imageUrl: "",
      pinCode: user.pinCode,
      nfcList: user.nfcList,
      socialMedia: socialMedia,
      company: company,
      phones: phoneNumbers,
      favoriteCategories: user.favoriteCategories,
    );

    return user;
  }
}
