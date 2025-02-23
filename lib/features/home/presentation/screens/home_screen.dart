import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/ai/cubit/ai_cubit.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';

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
            ElevatedButton(
                onPressed: () {
                  context.read<AiCubit>().getTags(
                      "انا بعرف في الادويه و في التركيب الادويه و كيفيه صنعها و درست صيدله في كليه الصبدله. ");
                },
                child: const Text("Click")),
            ElevatedButton(
              onPressed: () {
                print(context.read<UserCubit>().user!.ratingAverage);
              },
              child: Text("User"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
