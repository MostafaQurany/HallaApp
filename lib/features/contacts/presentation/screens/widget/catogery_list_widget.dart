import 'package:flutter/material.dart';
import 'package:halla/core/theme/app_colors.dart';

class CatogeryListWidget extends StatefulWidget {
  const CatogeryListWidget({super.key});

  @override
  State<CatogeryListWidget> createState() => _CatogeryListWidgetState();
}

class _CatogeryListWidgetState extends State<CatogeryListWidget> {
  final List<String> catogerys = [
    "all ",
    "family",
    'pepole',
    "all ",
    "family",
    'pepole',
    "all ",
    "family",
    'pepole',
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catogerys.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: selected == index
                          ? AppColors.primary
                          : AppColors.transparent,
                    ),
                  ),
                ),
                child: Text(
                  catogerys[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
