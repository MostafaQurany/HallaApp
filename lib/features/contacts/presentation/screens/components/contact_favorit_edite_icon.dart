// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';

class ContactFavoritEditeIcon extends StatefulWidget {
  final String selectedKey;
  const ContactFavoritEditeIcon({
    super.key,
    required this.selectedKey,
  });

  @override
  State<ContactFavoritEditeIcon> createState() =>
      _ContactFavoritEditeIconState();
}

class _ContactFavoritEditeIconState extends State<ContactFavoritEditeIcon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: Offset(0, 40.h),
      icon: ImageIcon(
        AssetImage(
          AppImages.emptyHeart,
        ),
      ),
      onSelected: (result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        ...UserCubit.get(context).user!.favoriteCategories.map((key) {
          return PopupMenuItem<String>(
            value: key,
            child: Row(
              children: [
                if (key == widget.selectedKey) const Icon(Icons.check),
                SizedBox(
                  width: 10.w,
                ),
                Text(key),
              ],
            ),
          );
        }),
      ],
    );
  }
}
