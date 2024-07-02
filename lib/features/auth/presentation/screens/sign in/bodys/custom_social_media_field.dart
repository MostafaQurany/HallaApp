import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/common/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart";
import "package:halla/generated/l10n.dart";

class CustomSocialMediaField extends StatefulWidget {

  const CustomSocialMediaField({
    required this.socialFacebookController, required this.socialInstagramController, required this.socialLinkedinController, required this.socialTwitterController, super.key,
  });
  final TextEditingController socialFacebookController;
  final TextEditingController socialInstagramController;
  final TextEditingController socialLinkedinController;
  final TextEditingController socialTwitterController;
  @override
  State<CustomSocialMediaField> createState() => _CustomSocialMediaFieldState();
  }

class _CustomSocialMediaFieldState extends State<CustomSocialMediaField>
    with TickerProviderStateMixin {
  late FocusNode socialFacebookFocus;
  late FocusNode socialInstagramFocus;
  late FocusNode socialLinkedinFocus;
  late FocusNode socialTwitterFocus;

  late AnimationController _animationController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    socialFacebookFocus = FocusNode();
    socialInstagramFocus = FocusNode();
    socialLinkedinFocus = FocusNode();
    socialTwitterFocus = FocusNode();
  }

  @override
  void dispose() {
    _animationController.dispose();
    socialFacebookFocus.dispose();
    socialInstagramFocus.dispose();
    socialLinkedinFocus.dispose();
    socialTwitterFocus.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      FocusScope.of(context).unfocus();
    }
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Column(
      children: <Widget>[
        GestureDetector(
          onTap: _toggleExpanded,
          child: Container(
            width: 1.sw,
            height: 45.h,
            decoration: BoxDecoration(
              color: Theme.of(context).inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.circular(16.w),
              border: Border.all(
                color: _isExpanded
                    ? AppColors.primary
                    : Theme.of(context)
                        .inputDecorationTheme
                        .border!
                        .borderSide
                        .color,
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ImageIcon(
                  AssetImage(AppImages.socialMediaIcon),
                  color: AppColors.gray,
                  size: 32.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Text(
                    S.of(context).socialMedia,
                    maxLines: 1,
                    style: _isExpanded
                        ? Theme.of(context).textTheme.bodyMedium!
                        : Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.gray),
                  ),
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.gray,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
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
                _animationController.drive(CurveTween(curve: Curves.easeInOut)),
            axisAlignment: 1,
            child: Column(
              children: <Widget>[
                CustomTextFormField(
                  control: widget.socialFacebookController,
                  hintText: S.of(context).facebook,
                  focusNode: socialFacebookFocus,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(socialInstagramFocus),
                ),
                CustomTextFormField(
                  control: widget.socialInstagramController,
                  hintText: S.of(context).instagram,
                  focusNode: socialInstagramFocus,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(socialLinkedinFocus),
                ),
                CustomTextFormField(
                  control: widget.socialLinkedinController,
                  hintText: S.of(context).linkedin,
                  focusNode: socialLinkedinFocus,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(socialTwitterFocus),
                ),
                CustomTextFormField(
                  control: widget.socialTwitterController,
                  hintText: S.of(context).twitter,
                  focusNode: socialTwitterFocus,
                  onEditingComplete: () => FocusScope.of(context).unfocus(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
