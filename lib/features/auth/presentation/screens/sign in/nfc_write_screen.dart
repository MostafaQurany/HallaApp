import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/personal_information_screen.dart';
import 'package:halla/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class NfcWriteScreen extends StatefulWidget {
  const NfcWriteScreen({super.key});

  @override
  State<NfcWriteScreen> createState() => _NfcWriteScreenState();
}

class _NfcWriteScreenState extends State<NfcWriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                navigatePushReplaceRemoveAll(
                  context,
                  const PersonalInformationScreen(),
                );
              },
              child: Text(
                S.of(context).skip,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Put NFC Tag",
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 1.sw,
                height: 0.5.sh,
                child: Lottie.asset(
                  AppImages.nfcWriteLotte,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Open"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NfcCloseError extends StatefulWidget {
  const NfcCloseError({
    super.key,
  });

  @override
  State<NfcCloseError> createState() => _NfcCloseErrorState();
}

class _NfcCloseErrorState extends State<NfcCloseError>
    with TickerProviderStateMixin {
  late AnimationController _slideTransitionController;
  late Animation<Offset> _animationOffset;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();

    _slideTransitionController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationOffset = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideTransitionController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _slideTransitionController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      if (_isVisible) {
        _slideTransitionController.forward();
      } else {
        _slideTransitionController.reverse();
      }
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _slideTransitionController,
      axis: Axis.vertical,
      child: SlideTransition(
        position: _animationOffset,
        child: Center(
          child: Container(
            width: 344.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppTheme.isLight(context)
                  ? AppColors.errorLight
                  : AppColors.errorDark,
              border: Border(
                left: BorderSide(
                  color: AppColors.errorborder,
                  width: 10.w,
                ),
              ),
              borderRadius: BorderRadius.circular(5.w),
            ),
            padding: EdgeInsetsDirectional.symmetric(horizontal: 6.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Please open NFC",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.gray,
                        fontSize: 15.sp,
                      ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Open",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.gray,
                              fontSize: 15.sp,
                            ),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.gray,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_circle_outline_sharp,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
