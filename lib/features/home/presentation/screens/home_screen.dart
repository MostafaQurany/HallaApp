import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/features/searching/cubit/searching_for_job_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String test = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading) CircularProgressIndicator(),
            Text(test ?? ''),
            BlocConsumer<SearchingForJobCubit, SearchingForJobState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (data) {
                    setState(() {
                      test = data.toString();
                      loading = false;
                    });
                  },
                  loading: () {
                    setState(() {
                      loading = true;
                    });
                  },
                );
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () async {
                    context
                        .read<SearchingForJobCubit>()
                        .searchForTag("Flutter");
                  },
                  child: Text('Fetch Data'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
