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
import "package:halla/features/auth/presentation/blocs/sign%20cubit/sign_in_cubit.dart";
import "package:halla/features/auth/presentation/screens/first%20time%20contacts/first_time_contacts_screen.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_birthday_field.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_company_field.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_nationality_field.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_social_media_field.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/widgets/phones_widget.dart";
import "package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart";
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
  final TextEditingController companyPostionController =
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
  void initState() {
    super.initState();
    _prepareData(UserCubit.get(context).user!);
  }

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
              BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  state.whenOrNull(
                      personalInfoLoading: () => AppShowDialog.loading(context),
                      personalInfoError: (message) {
                        AppShowDialog.error(context, message);
                      },
                      personalInfoSuccess: () {
                        AppNavigator.navigatePopDialog(context);
                        AppNavigator.navigatePushReplace(
                          context,
                          const FirstTimeContactsScreen(),
                        );
                      });
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
                                  companyPostionController,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  User user = _featchData();
                                  context
                                      .read<SignInCubit>()
                                      .personalInfoEvent(user);
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
      position: companyPostionController.text,
    );
    SocialMedia socialMedia = SocialMedia(
      facebook: socialFacebookController.text,
      instagram: socialInstagramController.text,
      linkedin: socialLinkedinController.text,
      twitter: socialTwitterController.text,
    );
    List<String> phoneNumbers = phonesWidgetKey.currentState?.getPhones() ?? [];
    User user = UserCubit.get(context).user!;
    user = User(
      id: user.id,
      email: user.email,
      fullName: nameController.text,
      primePhone: user.primePhone,
      dateOfBirth: dateOfBirthController.text,
      nationality: nationalityController.text,
      imageUrl: "",
      pinCode: user.pinCode,
      nfcList: user.nfcList,
      socialMedia: socialMedia,
      company: company,
      phones: phoneNumbers,
    );

    return user;
  }

  _prepareData(User user) {
    nameController.text = user.fullName;
    dateOfBirthController.text = user.dateOfBirth;
    nationalityController.text = user.nationality;

    companyNameController.text = user.company.name;
    companyPhoneController.text = user.company.phoneNumber;
    companyWebsiteController.text = user.company.website;
    companyPostionController.text = user.company.position;

    socialFacebookController.text = user.socialMedia.facebook;
    socialInstagramController.text = user.socialMedia.instagram;
    socialLinkedinController.text = user.socialMedia.linkedin;
    socialTwitterController.text = user.socialMedia.twitter;
  }
}
