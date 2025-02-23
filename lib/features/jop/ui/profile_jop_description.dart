import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/AI/cubit/ai_cubit.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart';

class ProfileJopDescription extends StatefulWidget {
  final TextEditingController descriptionController;

  const ProfileJopDescription({required this.descriptionController, super.key});

  @override
  State<ProfileJopDescription> createState() => _ProfileJopDescriptionState();
}

class _ProfileJopDescriptionState extends State<ProfileJopDescription> {
  @override
  void initState() {
    super.initState();
    widget.descriptionController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Expanded(
          flex: 8,
          child: CustomTextFormField(
            control: widget.descriptionController,
            hintText: "Enter Your Jop Description",
            keyboardType: TextInputType.multiline,
            maxLine: 10,
            prefixIcon: Icons.description_outlined,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 145.h,
            decoration: BoxDecoration(
              color: Theme.of(context).inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: widget.descriptionController.text.trim().isEmpty
                    ? const Color(0xFF000000)
                    : AppColors.primary,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: BlocConsumer<AiCubit, AiState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (data) {
                    print(data);
                  },
                );
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    state is Loading
                        ? CircularProgressIndicator()
                        : IconButton(
                            onPressed:
                                widget.descriptionController.text.trim().isEmpty
                                    ? null
                                    : () {
                                        context.read<AiCubit>().getTags(widget
                                            .descriptionController.text
                                            .trim());
                                      },
                            icon: Icon(
                              Icons.refresh,
                              size: 32.sp,
                            ),
                          ),
                    Text(
                      "Generate Job Tags",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
