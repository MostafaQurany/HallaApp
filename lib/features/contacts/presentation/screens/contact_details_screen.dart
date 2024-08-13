import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';

class ContactDetailsScreen extends StatelessWidget {
  final Contact contact;
  const ContactDetailsScreen({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.w,
                  backgroundImage: AssetImage(
                    AppImages.profilePlaceholder,
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
