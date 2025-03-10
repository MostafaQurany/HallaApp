import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart';
import 'package:halla/features/jop_with_location/logic/job_location_cubit.dart';

class ProfileWorkLocation extends StatefulWidget {
  const ProfileWorkLocation({super.key});

  @override
  State<ProfileWorkLocation> createState() => ProfileWorkLocationState();
}

class ProfileWorkLocationState extends State<ProfileWorkLocation> {
  late GeoPoint userLocation;
  TextEditingController locationController = new TextEditingController();

  @override
  void initState() {
    userLocation = GeoPoint(0, 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobLocationCubit, JobLocationState>(
      buildWhen: (previous, current) =>
          current is GetCurrentLocationSuccess ||
          current is GetCurrentLocationLoading ||
          current is GetCurrentLocationError,
      listenWhen: (previous, current) =>
          current is GetCurrentLocationSuccess ||
          current is GetCurrentLocationLoading ||
          current is GetCurrentLocationError,
      listener: (context, state) {
        if (state is GetCurrentLocationSuccess) {
          userLocation =
              GeoPoint(state.position.latitude, state.position.longitude);
          locationController.text =
              "${state.position.latitude},${state.position.longitude}";
        }
      },
      builder: (context, state) {
        return Row(
          spacing: 10.w,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 6,
              child: CustomTextFormField(
                control: locationController,
                hintText: "Location",
                prefixIcon: Icons.location_history,
                ignorePointers: true,
              ),
            ),
            state is GetCurrentLocationLoading
                ? CircularProgressIndicator()
                : SizedBox(
                    height: 50.h,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                      ),
                      onPressed: () {
                        context
                            .read<JobLocationCubit>()
                            .fetchUserCurrentLocation();
                      },
                      label: Icon(Icons.location_searching),
                    ),
                  )
          ],
        );
      },
    );
  }
}
