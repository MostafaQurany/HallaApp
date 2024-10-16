import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/theme/app_colors.dart';

class CatogeryListWidget extends StatefulWidget {
  const CatogeryListWidget({super.key});

  @override
  State<CatogeryListWidget> createState() => _CatogeryListWidgetState();
}

class _CatogeryListWidgetState extends State<CatogeryListWidget> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (UserCubit.get(context).user!.favoriteCategories.isEmpty) {
          selected = 0;
        }
        return SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                UserCubit.get(context).user!.favoriteCategories.length + 1,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selected = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selected == index
                              ? AppColors.primary
                              : AppColors.transparent,
                        ),
                      ),
                    ),
                    child: index == 0
                        ? const Text('All')
                        : Text(
                            UserCubit.get(context)
                                .user!
                                .favoriteCategories[index - 1],
                          ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
