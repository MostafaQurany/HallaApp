import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/bodys/custom_birthday_field.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/bodys/custom_nationality_field.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final formKey = GlobalKey<FormState>();
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: 1.sh,
                decoration: BoxDecoration(
                  boxShadow: [
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Personal \nInformation',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            GestureDetector(
                              onTap: () {
                                //TODO: make the Skip on tap that is navigate to the home screen
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Skip',
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
                      CustomTextFormField(
                        control: nameController,
                        hintText: "Full Name",
                        prefixIcon: Icons.person_2_outlined,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BirthdayPickerTextField(
                          controller: dateOfBirthController),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomNationalityField(controller: nationalityController),
                      CustomTextFormField(
                        control: nationalityController,
                        hintText: "Nationality",
                        prefixIcon: AppImages.nationalityIcon,
                        prefixIconIsImage: true,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        control: nameController,
                        hintText: "Full Name",
                        prefixIcon: Icons.person_2_outlined,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                        control: nameController,
                        hintText: "Full Name",
                        prefixIcon: Icons.person_2_outlined,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
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
}
