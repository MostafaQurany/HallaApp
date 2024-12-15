import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/contacts/presentation/screens/components/contact_favorit_edite_icon.dart';
import 'package:halla/features/contacts/presentation/screens/contact_details_screen.dart';
import 'package:halla/features/profile/presentation/screens/widgets/custom_share_contact_icon.dart';

class ContactCard extends StatefulWidget {
  final Contact contact;

  const ContactCard({
    super.key,
    required this.contact,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  void _toggleExpanded() {
    if (View.of(context).viewInsets.bottom > 0.0) {
      FocusScope.of(context).unfocus();
    }
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: Card(
        margin: EdgeInsets.only(bottom: 15.h),
        color: Theme.of(context).inputDecorationTheme.fillColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: _isExpanded ? AppColors.primary : AppColors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AppImages.contactListEmpty,
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    width: 145.w,
                    child: Text(
                      widget.contact.fullName,
                      style: Theme.of(context).textTheme.bodyMedium!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.info_outline_rounded,
                      size: 22.sp,
                    ),
                    onPressed: () => AppNavigator.navigatePush(
                      context,
                      ContactDetailsScreen(
                        contact: widget.contact,
                      ),
                    ),
                  ),
                  ContactFavoritEditeIcon(
                    selectedKey: widget.contact.favoriteCategory ?? '',
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomShareContactIcon(userId: widget.contact.id),
                ],
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppTheme.isLight(context)
                      ? AppColors.white
                      : AppColors.blackLight,
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: SizeTransition(
                  sizeFactor:
                      _controller.drive(CurveTween(curve: Curves.easeInOut)),
                  axisAlignment: 1,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage(AppImages.companyIcon),
                            color: AppColors.gray,
                            size: 32.sp,
                          ),
                          Text(widget.contact.company.position),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
