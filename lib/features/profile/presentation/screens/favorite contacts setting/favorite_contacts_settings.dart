import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/common/presentation/widgets/arrow_back.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/features/profile/presentation/screens/favorite%20contacts%20setting/widgets/add_favorite_contact_categories.dart';
import 'package:halla/features/profile/presentation/screens/favorite%20contacts%20setting/widgets/drager_categories.dart';
import 'package:halla/features/profile/presentation/screens/favorite%20contacts%20setting/widgets/favorite_container_decoration.dart';
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

    setState(() {
      final itemKey = UserCubit.get(context)
          .user!
          .favoriteCategories
          .keys
          .elementAt(oldIndex);
      final itemValue =
          UserCubit.get(context).user!.favoriteCategories[itemKey];
      UserCubit.get(context).user!.favoriteCategories.remove(itemKey);
      UserCubit.get(context).user!.favoriteCategories[UserCubit.get(context)
          .user!
          .favoriteCategories
          .keys
          .elementAt(newIndex)] = itemValue!;
    });
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
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            User user = UserCubit.get(context).user!;
            print(user.favoriteCategories);
            return ReorderableListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              onReorder: _onReorder,
              children: [
                ...user.favoriteCategories.entries.map((entry) {
                  return Text(
                    entry.value,
                    key: Key(entry.key.toString()),
                  );
                }),
                Container(
                  key: const Key('add-category'), // Provide a unique key
                  child: const AddFavoriteContactCategories(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
