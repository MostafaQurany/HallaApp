import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/profile/presentation/blocs/bloc/profile_bloc.dart';
import 'package:halla/features/profile/presentation/screens/favorite%20contacts%20setting/widgets/favorite_container_decoration.dart';

class FavoriteCategoriesItem extends StatelessWidget {
  final MapEntry entry;
  const FavoriteCategoriesItem({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return FavoriteContainerDecoration(
        widget: Row(
      children: [
        Expanded(
          child: Text(
            entry.value,
            style: AppTheme.getThemeText(context).bodyMedium,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: () {
            UserCubit.get(context).user!.favoriteCategories.remove(entry.key);
            context.read<ProfileBloc>().add(
                  UpdateUserEvent(user: UserCubit.get(context).user!),
                );
          },
          icon: Icon(
            Icons.remove,
            color: AppColors.errorIconLight,
          ),
        ),
      ],
    ));
  }
}
