import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/common/presentation/widgets/arrow_back.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/profile/presentation/blocs/bloc/profile_bloc.dart';
import 'package:halla/features/profile/presentation/screens/favorite%20contacts%20setting/widgets/add_favorite_contact_categories.dart';
import 'package:halla/features/profile/presentation/screens/favorite%20contacts%20setting/widgets/favorit_categories_item.dart';
import 'package:halla/generated/l10n.dart';

class FavoriteContactsSettings extends StatefulWidget {
  const FavoriteContactsSettings({super.key});

  @override
  State<FavoriteContactsSettings> createState() =>
      _FavoriteContactsSettingsState();
}

class _FavoriteContactsSettingsState extends State<FavoriteContactsSettings> {
  _onReorder(oldIndex, newIndex) {
    if (oldIndex == UserCubit.get(context).user!.favoriteCategories.length) {
      return; // Ignore reordering of the last item
    }
    if (newIndex == UserCubit.get(context).user!.favoriteCategories.length) {
      return; // Ignore reordering to the last position
    }
    final itemKey = UserCubit.get(context)
        .user!
        .favoriteCategories
        .keys
        .elementAt(oldIndex);
    final itemValue = UserCubit.get(context).user!.favoriteCategories[itemKey];
    UserCubit.get(context).user!.favoriteCategories.remove(itemKey);
    UserCubit.get(context).user!.favoriteCategories[UserCubit.get(context)
        .user!
        .favoriteCategories
        .keys
        .elementAt(newIndex)] = itemValue!;
    UserCubit.get(context).addUserToLocal();
    setState(() {});
  }

  @override
  Widget build(BuildContext ontext) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBack(),
        title: Text(
          S.of(context).favoriteContacts,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: AppConstants.paddingScreen,
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLoading) {
              AppShowDialog.loading(context);
            }
            if (state is ProfileError) {
              AppNavigator.navigatePop(context);
              AppShowDialog.showErrorMessage(context, state.message);
            }
            if (state is ProfileUpdateUserSuccessfully) {
              AppNavigator.navigatePop(context);
            }
          },
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              User user = UserCubit.get(context).user!;
              return ListView(
                shrinkWrap: true,
                children: [
                  ...user.favoriteCategories.entries.map((entry) {
                    return FavoriteCategoriesItem(entry: entry);
                  }),
                  const AddFavoriteContactCategories(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
