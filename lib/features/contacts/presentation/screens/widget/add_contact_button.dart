import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/features/contacts/presentation/blocs/cubit/contact_cubit.dart';
import 'package:halla/features/contacts/presentation/screens/widget/qr_code_scan_test.dart';

class AddContactButton extends StatelessWidget {
  const AddContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDialog<String>(
          context: context,
          builder: (context) => const AlertDialog(
            content: BarcodeScannerWithController(),
          ),
        ).then(
          (contactId) {
            print(contactId);
            context.read<ContactCubit>().addContact(
                  userId: UserCubit.get(context).user?.id ?? '',
                  contactId: contactId ?? '',
                );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff989898),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.w),
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(
          Icons.add,
          color: AppColors.primary,
          size: 24.sp,
        ),
      ),
    );
  }
}
