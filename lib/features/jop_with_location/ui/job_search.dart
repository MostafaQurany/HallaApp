import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/features/jop_with_location/logic/job_location_cubit.dart';
import 'package:halla/features/jop_with_location/ui/job_search_par.dart';

class JobSearch extends StatelessWidget {
  const JobSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          JobSearchBar(
            onSearch: (jobTag, distance) {
              final cubit = context.read<JobLocationCubit>();

              cubit.searchNearbyUsers(
                latitude: UserCubit.get(context)
                    .user!
                    .location!
                    .latitude, // Get this dynamically
                longitude: UserCubit.get(context)
                    .user!
                    .location!
                    .longitude, // Get this dynamically
                rangeKm: distance,
                jobTag: jobTag,
              );
            },
          ),
          const SizedBox(height: 20),

          // Display results
          Expanded(
            child: BlocBuilder<JobLocationCubit, JobLocationState>(
              builder: (context, state) {
                if (state is SearchNearbyUsersLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchNearbyUsersError) {
                  return Center(child: Text("Error: ${state.error}"));
                } else if (state is SearchNearbyUsersSuccess) {
                  if (state.users.isEmpty) {
                    return const Center(child: Text("No users found."));
                  }
                  return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      final user = state.users[index];
                      return ListTile(
                        title: Text(user.fullName),
                        subtitle: Text(user.jobTitles!.join(", ")),
                        leading: CircleAvatar(child: Text(user.fullName[0])),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
