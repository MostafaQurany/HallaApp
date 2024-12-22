import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/screens/auth_screen.dart';
import 'package:halla/features/home/presentation/screens/components/end_spacer_sized_box.dart';
import 'package:halla/features/profile/presentation/blocs/bloc/profile_bloc.dart';
import 'package:halla/features/profile/presentation/screens/favorite%20contacts%20setting/favorite_contacts_settings.dart';
import 'package:halla/features/profile/presentation/screens/settings/settings_screen.dart';
import 'package:halla/features/profile/presentation/screens/update%20profile/update_profile_screen.dart';
import 'package:halla/features/profile/presentation/screens/widgets/custom_profile_buttom.dart';
import 'package:halla/features/profile/presentation/screens/widgets/custom_profile_log_out_buttom.dart';
import 'package:halla/features/profile/presentation/screens/widgets/profile_app_bar.dart';
import 'package:halla/generated/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late bool isGuest;

  @override
  void initState() {
    super.initState();
    isGuest = UserCubit.get(context).user!.isGuest;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppConstants.paddingScreen,
          child: ListView(
            children: [
              const ProfileAppBar(),
              SizedBox(
                height: 30.h,
              ),
              if (!isGuest) ...[
                CustomProfileButtom(
                  icon: AppImages.personalIcon,
                  name: S.of(context).changeProfile,
                  onTap: () {
                    AppNavigator.navigatePush(
                        context, const UpdateProfileScreen());
                  },
                ),
                CustomProfileButtom(
                  icon: AppImages.emptyHeart,
                  name: S.of(context).favoriteContacts,
                  onTap: () {
                    AppNavigator.navigatePush(
                      context,
                      const FavoriteContactsSettings(),
                    );
                  },
                ),
                CustomProfileButtom(
                  icon: AppImages.pincodeChangeIcon,
                  name: S.of(context).changeSecurityCode,
                  onTap: () {},
                ),
                CustomProfileButtom(
                  icon: AppImages.promotionsIcon,
                  name: S.of(context).promotions,
                  onTap: () {},
                ),
                CustomProfileButtom(
                  icon: AppImages.customerServiceIcon,
                  name: S.of(context).customerService,
                  onTap: () {},
                ),
                CustomProfileButtom(
                  icon: AppImages.settingsIcon,
                  name: S.of(context).settings,
                  onTap: () {
                    AppNavigator.navigatePush(context, const SettingsScreen());
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
              BlocListener<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state is LogOutSuccesState) {
                    AppNavigator.navigatePushReplaceRemoveAll(
                      context,
                      const AuthScreen(),
                    );
                  }
                },
                child: CustomProfileLogOutButtom(
                  onTap: () {
                    context.read<ProfileBloc>().add(LogOutEvent());
                  },
                ),
              ),
              const EndSpacerSizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
