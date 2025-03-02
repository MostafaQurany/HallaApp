import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/AI/cubit/ai_cubit.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart';
import 'package:halla/features/jop with location//ui/profile_tag_card.dart';

class ProfileJopCardBuilder extends StatefulWidget {
  final List<String>? jopTitles;

  const ProfileJopCardBuilder({super.key, this.jopTitles});

  @override
  State<ProfileJopCardBuilder> createState() => ProfileJopCardBuilderState();
}

class ProfileJopCardBuilderState extends State<ProfileJopCardBuilder> {
  List<String> innerJopTitles = [];

  @override
  void initState() {
    innerJopTitles = widget.jopTitles ?? [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.white,
                  ),
                ),
              ),
              child: Text(
                "Job Title",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            IconButton(
                style: IconButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).inputDecorationTheme.fillColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                ),
                onPressed: _showDialogToAddJobTitle,
                icon: Icon(
                  Icons.add,
                ))
          ],
        ),
        BlocConsumer<AiCubit, AiState>(
          listener: (context, state) {
            state.whenOrNull(
              loaded: (data) {
                if (data is Map<String, dynamic>) {
                  data.forEach(
                    (key, value) {
                      List<dynamic> data = value as List<dynamic>;

                      innerJopTitles.addAll(data
                          .map(
                            (e) => e.toString(),
                          )
                          .toList());
                    },
                  );
                }
              },
            );
          },
          builder: (context, state) {
            return innerJopTitles.isEmpty
                ? Text(
                    "No Job Title added ",
                  )
                : Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runAlignment: WrapAlignment.start,
                    runSpacing: 16,
                    spacing: 16,
                    children: innerJopTitles.map(
                      (e) {
                        return ProfileTagCard(
                          jobTitle: e,
                          removeJobTitle: () {
                            setState(() {
                              innerJopTitles.removeWhere(
                                (element) {
                                  return element == e;
                                },
                              );
                            });
                          },
                        );
                      },
                    ).toList(),
                  );
          },
        )
      ],
    );
  }

  _showDialogToAddJobTitle() {
    return showDialog(
      context: context,
      builder: (context) {
        final jobTextController = TextEditingController();
        return Dialog(
          child: Padding(
            padding: AppConstants.paddingScreen,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 30.h,
              children: [
                Text(
                  "Job Title",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CustomTextFormField(
                  control: jobTextController,
                  hintText: "Job Title",
                  prefixIcon: Icons.work_outline_sharp,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        innerJopTitles.add(jobTextController.text.trim());
                      });
                      AppNavigator.navigatePop(context);
                    },
                    child: Text("Add Job Title"),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
