import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart";
import "package:halla/generated/l10n.dart";

class CustomCompanyField extends StatefulWidget {
  const CustomCompanyField({
    required this.companyNameController, required this.companyPhoneController, required this.companyWebsiteController, required this.companyPositonController, super.key,
  });
  final TextEditingController companyNameController;
  final TextEditingController companyPhoneController;
  final TextEditingController companyWebsiteController;
  final TextEditingController companyPositonController;

  @override
  State<CustomCompanyField> createState() => _CustomCompanyFieldState();
 }

class _CustomCompanyFieldState extends State<CustomCompanyField>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isExpanded = false;

  late FocusNode companyNameFocus;
  late FocusNode companyPhoneFocus;
  late FocusNode companyWebsiteFocus;
  late FocusNode companyPositonFocus;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    companyNameFocus = FocusNode();
    companyPhoneFocus = FocusNode();
    companyWebsiteFocus = FocusNode();
    companyPositonFocus = FocusNode();
  }

  @override
  void dispose() {
    _animationController.dispose();
    companyNameFocus.dispose();
    companyPhoneFocus.dispose();
    companyWebsiteFocus.dispose();
    companyPositonFocus.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    if (View.of(context).viewInsets.bottom > 0.0) {
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
                  AssetImage(AppImages.companyIcon),
                  color: AppColors.gray,
                  size: 32.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Text(
                    S.of(context).company,
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
                  control: widget.companyNameController,
                  hintText: S.of(context).name,
                  focusNode: companyNameFocus,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(companyPhoneFocus),
                ),
                CustomTextFormField(
                  control: widget.companyPhoneController,
                  hintText: S.of(context).phone,
                  focusNode: companyPhoneFocus,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(companyWebsiteFocus),
                ),
                CustomTextFormField(
                  control: widget.companyWebsiteController,
                  hintText: S.of(context).website,
                  focusNode: companyWebsiteFocus,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(companyPositonFocus),
                ),
                CustomTextFormField(
                  control: widget.companyPositonController,
                  hintText: S.of(context).positon,
                  focusNode: companyPositonFocus,
                  onEditingComplete: () => FocusScope.of(context).unfocus(),
                ),
              ],
            ),
          ),
        ),
      ],
    );

}
