import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:halla/features/contacts/presentation/screens/components/contact_details_appbar.dart';
import 'package:halla/features/contacts/presentation/screens/components/personal_information_card.dart';
import 'package:halla/features/contacts/presentation/screens/components/socail_media_card.dart';
import 'package:halla/features/contacts/presentation/screens/components/work_card.dart';

class ContactDetailsScreen extends StatefulWidget {
  final Contact contact;
  const ContactDetailsScreen({
    super.key,
    required this.contact,
  });

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContactDetailsAppbar(
                  contact: widget.contact,
                ),
                _header("Personal Information"),
                PersonalInformationCard(contact: widget.contact),
                _header("Work"),
                WorkCard(
                  contact: widget.contact,
                ),
                _header("Social Media"),
                SocailMediaCard(contact: widget.contact),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, bottom: 10.h, top: 10.h),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
