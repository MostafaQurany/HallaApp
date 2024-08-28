// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(minutes) => "تأكد بريدك الإلكتروني في ${minutes} دقائق ؟";

  static String m1(pinCode) =>
      "مرحباً بك في هلا، رقم البين الخاص بك للدخول هو ${pinCode}. احتفظ به آمناً ولا تشاركه مع أي شخص.";

  static String m2(pinCode) =>
      "مرحبًا بك في Halla،\nرمزك السري لتسجيل الدخول هو ${pinCode}\nاحتفظ به في مكان آمن ولا تشاركه مع أي شخص.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyIHaveAnAcount":
            MessageLookupByLibrary.simpleMessage("لدي حساب بالفعل ؟"),
        "checkYourEmail": m0,
        "company": MessageLookupByLibrary.simpleMessage("الشركة"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة السر"),
        "contact": MessageLookupByLibrary.simpleMessage("جهة الاتصال"),
        "contactList": MessageLookupByLibrary.simpleMessage("قائمة الاتصال"),
        "dataOfBirth": MessageLookupByLibrary.simpleMessage("تاريخ الميلاد"),
        "email": MessageLookupByLibrary.simpleMessage("بريد إلكتروني"),
        "emailOrPhoneNumber01": MessageLookupByLibrary.simpleMessage(
            "بريد إلكتروني أو رقم هاتف 01"),
        "enterPinCodePassword":
            MessageLookupByLibrary.simpleMessage("أدخل pin-code كلمة السر"),
        "enterYourEmailAddressBelowAndWellSendYouA":
            MessageLookupByLibrary.simpleMessage(
                "أدخل عنوان بريدك الإلكتروني أدناه وسنرسل لك رابط لإعادة تعيين كلمة السر. إذا كان البريد الإلكتروني مرتبطاً بحساب، فستتلقى بريداً إلكترونياً مع التعليمات لإنشاء كلمة سر جديدة "),
        "facebook": MessageLookupByLibrary.simpleMessage("فيسبوك"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("نسيان كلمة السر ؟"),
        "forgetpassword":
            MessageLookupByLibrary.simpleMessage("هل نسيان كلمة السر؟ "),
        "fullName": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
        "guest": MessageLookupByLibrary.simpleMessage("ضيف"),
        "home": MessageLookupByLibrary.simpleMessage("الصفحة الرئيسية"),
        "iDontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("ليس لدي حساب ؟"),
        "instagram": MessageLookupByLibrary.simpleMessage("إنستجرام"),
        "linkedin": MessageLookupByLibrary.simpleMessage("لينكد إن"),
        "logOut": MessageLookupByLibrary.simpleMessage("خروج"),
        "login": MessageLookupByLibrary.simpleMessage("دخول"),
        "name": MessageLookupByLibrary.simpleMessage("اسم"),
        "nationality": MessageLookupByLibrary.simpleMessage("جنسية"),
        "next": MessageLookupByLibrary.simpleMessage("التالي"),
        "open": MessageLookupByLibrary.simpleMessage("افتح"),
        "or": MessageLookupByLibrary.simpleMessage("أو"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة السر"),
        "personalNinformation":
            MessageLookupByLibrary.simpleMessage("معلومات شخصية \n"),
        "phone": MessageLookupByLibrary.simpleMessage("هاتف"),
        "pinIsIncorrect":
            MessageLookupByLibrary.simpleMessage("رقم ال pin-code خاطئ"),
        "pleaseEnterVerificationCodeNsentToYourPhoneNumber":
            MessageLookupByLibrary.simpleMessage(
                "الرجاء إدخال OTP \n المرسل إلى رقم هاتفك."),
        "positon": MessageLookupByLibrary.simpleMessage("موقع الشركة"),
        "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "putNfcTag": MessageLookupByLibrary.simpleMessage("ضع علامة NFC"),
        "register": MessageLookupByLibrary.simpleMessage("تسجيل"),
        "registerNow": MessageLookupByLibrary.simpleMessage("تسجيل الآن"),
        "resendCode": MessageLookupByLibrary.simpleMessage("إعادة إرسال OTP"),
        "scanQrcodeToAddContact":
            MessageLookupByLibrary.simpleMessage("ماسح رمز QR لاضافة اتصال"),
        "search": MessageLookupByLibrary.simpleMessage("بحث"),
        "skip": MessageLookupByLibrary.simpleMessage("تخطي"),
        "socialMedia":
            MessageLookupByLibrary.simpleMessage("وسائل التواصل الاجتماعي"),
        "submit": MessageLookupByLibrary.simpleMessage("إرسال"),
        "twitter": MessageLookupByLibrary.simpleMessage("تويتر"),
        "verificationCode": MessageLookupByLibrary.simpleMessage("رمز التحقق"),
        "verified": MessageLookupByLibrary.simpleMessage("مُتأكد"),
        "website": MessageLookupByLibrary.simpleMessage("صفحة الويب"),
        "welcomeToHallaYourPinCodeForLoginIsStateguestpincode": m1,
        "welcomeToHallayourPincodeForLoginIsStateuserpincodekeepItSecure": m2
      };
}
