import "package:dropdown_search/dropdown_search.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/constants/constants.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/generated/l10n.dart";

class CustomNationalityField extends StatefulWidget {
  const CustomNationalityField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  State<CustomNationalityField> createState() => _CustomNationalityFieldState();
}

class _CustomNationalityFieldState extends State<CustomNationalityField> {
  String selectedNationality = "";

  @override
  void initState() {
    super.initState();
    selectedNationality = widget.controller.text;
  }

  @override
  Widget build(BuildContext context) => DropdownSearch<String>(
        selectedItem: selectedNationality.isEmpty
            ? S.of(context).nationality
            : selectedNationality,
        items: AppConstants.nationalities,
        onChanged: (String? value) {
          setState(() {
            widget.controller.text = value ?? "";
          });
        },
        popupProps: PopupProps.menu(
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppTheme.isLight(context)
                      ? AppColors.black
                      : AppColors.white,
                ),
            decoration: InputDecoration(
              fillColor:
                  AppTheme.isLight(context) ? AppColors.white : AppColors.gray,
              filled: true,
              hintText: S.of(context).search,
              hintStyle:
                  Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
                        color: AppTheme.isLight(context)
                            ? AppColors.gray
                            : AppColors.blackLight,
                      ),
            ),
          ),
          menuProps: MenuProps(
            borderRadius: BorderRadius.circular(23.r),
            backgroundColor: AppTheme.isLight(context)
                ? AppColors.white
                : AppColors.blackLight,
          ),
        ),
        dropdownButtonProps: DropdownButtonProps(
          color: AppColors.gray,
          icon: const Icon(Icons.keyboard_arrow_down),
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          textAlignVertical: TextAlignVertical.center,
          baseStyle: widget.controller.text.isEmpty
              ? Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.gray)
              : Theme.of(context).textTheme.bodyMedium!,
          dropdownSearchDecoration: InputDecoration(
            hintText: "Nationality",
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.gray),
            prefixIcon: Container(
              padding: EdgeInsets.all(10.0.w),
              child: ImageIcon(
                AssetImage(AppImages.nationalityIcon),
                color: Theme.of(context).inputDecorationTheme.prefixIconColor,
              ),
            ),
            prefixIconColor: AppColors.gray,
            suffixIcon: const Icon(Icons.keyboard_arrow_down),
            suffixIconColor: AppColors.gray,
            filled: true,
            fillColor: AppTheme.isLight(context)
                ? AppColors.white
                : AppColors.blackLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.5.sw),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 40.w,
            ),
          ),
        ),
      );
}
