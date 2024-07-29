import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';

class SearchField extends StatefulWidget {
  final TextEditingController searchController;
  final void Function(String)? onChanged;
  final bool ignorePointers;

  const SearchField({
    super.key,
    required this.searchController,
    this.onChanged,
    this.ignorePointers = false,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.searchController,
          onChanged: widget.onChanged,
          ignorePointers: widget.ignorePointers,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Search',
            prefixIcon: Padding(
              padding: EdgeInsets.all(10.0.w),
              child: ImageIcon(
                AssetImage(
                  AppImages.searchPngIcon,
                ),
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xff989898),
              ),
              gapPadding: 2,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xff989898),
              ),
              gapPadding: 2,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xff989898),
              ),
              gapPadding: 2,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xff989898),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
