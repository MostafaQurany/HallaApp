import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/common/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/bodys/custom_birthday_field.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/bodys/custom_company_field.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/bodys/custom_nationality_field.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/bodys/custom_social_media_field.dart";
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
  final TextEditingController companyPositonController =
      TextEditingController();

  final TextEditingController socialFacebookController =
      TextEditingController();
  final TextEditingController socialInstagramController =
      TextEditingController();
  final TextEditingController socialLinkedinController =
      TextEditingController();
  final TextEditingController socialTwitterController = TextEditingController();
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
            Form(
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
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              S.of(context).personalNinformation,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            GestureDetector(
                              onTap: () {
                                //TODO: make the Skip on tap that is navigate to the home screen
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  S.of(context).skip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: AppColors.primary),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        control: nameController,
                        hintText: S.of(context).fullName,
                        prefixIcon: Icons.person_2_outlined,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BirthdayPickerTextField(
                          controller: dateOfBirthController,),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomNationalityField(controller: nationalityController),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomSocialMediaField(
                        socialFacebookController: socialFacebookController,
                        socialInstagramController: socialInstagramController,
                        socialLinkedinController: socialLinkedinController,
                        socialTwitterController: socialTwitterController,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomCompanyField(
                        companyNameController: companyNameController,
                        companyPhoneController: companyPhoneController,
                        companyWebsiteController: companyWebsiteController,
                        companyPositonController: companyPositonController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            //TODO: Make the upload the user data
                          },
                          child: Text(S.of(context).next),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
 }
