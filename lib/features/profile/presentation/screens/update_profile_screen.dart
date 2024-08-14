import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_birthday_field.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_company_field.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_nationality_field.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_social_media_field.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/widgets/phones_widget.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart';
import 'package:halla/generated/l10n.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUserData(UserCubit.get(context).user!);

  }

  _fetchUserData(User user) {
    nameController.text = user.fullName;
    dateOfBirthController.text = user.dateOfBirth;
    nationalityController.text = user.nationality;
    companyNameController.text = user.company.name;
    companyPhoneController.text = user.company.phoneNumber;
    companyWebsiteController.text = user.company.website;
    companyPositonController.text = user.company.position;
    socialFacebookController.text = user.socialMedia.facebook;
    socialInstagramController.text = user.socialMedia.instagram;
    socialLinkedinController.text = user.socialMedia.linkedin;
    socialTwitterController.text = user.socialMedia.twitter;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      AppTheme.isLight(context)
                          ? AppImages.updateProfileBackgroundLight
                          : AppImages.updateProfileBackgroundDark,
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_outlined),
                    ),
                    Positioned(
                      top: 0.1.sh,
                      left: 0.25.sw,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 0.15.sw,
                            backgroundImage: AssetImage(
                              AppImages.profilePlaceholder,
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          IconButton(
                            onPressed: () {
                              //TODO: Open the editing the image
                            },
                            icon: ImageIcon(
                              AssetImage(
                                AppImages.editImageIcon,
                              ),
                              color: AppColors.primary,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
