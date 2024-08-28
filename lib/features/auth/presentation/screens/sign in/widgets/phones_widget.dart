import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/widgets/custom_phone_field.dart';

class PhonesWidget extends StatefulWidget {
  const PhonesWidget({super.key});
  @override
  State<PhonesWidget> createState() => PhonesWidgetState();
}

class PhonesWidgetState extends State<PhonesWidget> {
  bool changeInPrime = false;
  List<String> phoneId = [
    "prime phone",
    "phone 1",
    "phone 2",
    "phone 3",
  ];
  Map<String, TextEditingController> phonesController = {};
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  final Duration _duration = const Duration(milliseconds: 350);
  @override
  void initState() {
    super.initState();
    phonesController[phoneId[0]] =
        TextEditingController(text: UserCubit.get(context).user!.primePhone);

    if (UserCubit.get(context).user!.phones.isNotEmpty) {
      for (int i = 1; i < UserCubit.get(context).user!.phones.length; i++) {
        phonesController[phoneId[i]] =
            TextEditingController(text: UserCubit.get(context).user!.phones[i]);
      }
    }
    phonesController[phoneId[0]]!.addListener(_primePhoneChangeListener);

    Future.delayed(Duration.zero, () {
      for (int i = 0; i < phonesController.length - 1; i++) {
        _listKey.currentState?.insertItem(i, duration: _duration);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: (68 * phonesController.length).h,
      duration: const Duration(milliseconds: 200),
      child: AnimatedList(
        key: _listKey,
        physics: const NeverScrollableScrollPhysics(),
        initialItemCount: 1,
        itemBuilder: (context, index, animation) => SlideTransition(
          position: Tween<Offset>(
            begin: phonesController.length == 1
                ? const Offset(0, 0)
                : const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(animation),
          child: Column(
            children: [
              CustomPhoneField(
                controller:
                    phonesController[phoneId[index]] ?? TextEditingController(),
                isFirst: index == 0,
                isAdd: _getAddOrRemove(
                    maxIndex: phonesController.length, currentindex: index),
                suffixOnTap: (index == 0 && phonesController.length == 4)
                    ? null
                    : (index == 0)
                        ? () => _addPhoneField(phonesController.length)
                        : () => _removePhoneField(index),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addPhoneField(int index, {String text = ''}) {
    setState(() {
      phonesController.addAll({
        phoneId[index]: TextEditingController(text: text),
      });
      _listKey.currentState
          ?.insertItem(phonesController.length - 1, duration: _duration);
    });
  }

  void _removePhoneField(int index) {
    _listKey.currentState?.removeItem(
      index,
      duration: _duration,
      (context, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: phonesController.length == 1
              ? const Offset(0, 0)
              : const Offset(1, 0),
          end: const Offset(0, 0),
        ).animate(animation),
        child: Column(
          children: [
            CustomPhoneField(
              controller:
                  phonesController[phoneId[index]] ?? TextEditingController(),
              isFirst: index == 0,
              isAdd: _getAddOrRemove(
                  maxIndex: phonesController.length, currentindex: index),
              suffixOnTap: (index == 0 && phonesController.length == 4)
                  ? null
                  : (index == 0)
                      ? () => _addPhoneField(phonesController.length)
                      : () => _removePhoneField(index),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );

    Future.delayed(const Duration(milliseconds: 350)).then(
      (value) {
        setState(() {
          phonesController.remove(phoneId[index]);
          String idRemve = phoneId[index];
          phoneId.removeAt(index);
          phoneId.add(idRemve);
        });
      },
    );
  }

  bool _getAddOrRemove({required int maxIndex, required int currentindex}) {
    if (currentindex == 0) {
      return true;
    } else {
      return false;
    }
  }

  List<String> getPhones() {
    return phonesController.values
        .map((controller) => controller.text)
        .toList();
  }

  void _primePhoneChangeListener() {
    if (phonesController[phoneId[0]]!.text !=
        UserCubit.get(context).user!.primePhone) {
      setState(() {
        changeInPrime = true;
      });
    } else {
      setState(() {
        changeInPrime = false;
      });
    }
  }
}
