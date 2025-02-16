import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  // collection
  static String userCollection = 'users';
  static String contactsCollection = 'users_contacts';
  static String userNotificationCollection = 'user_notifications';
  static String notificationsContact = 'notifications_contact';
  static String notification = 'notifications';
  static String unActiveUserCollection = "unActiveUserCollection";
  static String ratingUserCollection = "ratingUser";

  // hive
  static String contactOfflineBox = "ContactsOfflineBox";
  static String userLocalBox = "UserLocalBox";
  static String userLocalKey = "UserLocalKey";
  static String contactBox = "ContactsBox";
  static String userBox = "UserBox";

  // shared preferences
  static String guest = "Guest";
  static String firstTimeOpen = "FirstTimeOpen";
  static String userLoginId = "UserLoginId";

  // constants
  static List<String> nationalities = <String>[
    "Afghan",
    "Albanian",
    "Algerian",
    "American",
    "Andorran",
    "Angolan",
    "Antiguans",
    "Argentinean",
    "Armenian",
    "Australian",
    "Austrian",
    "Azerbaijani",
    "Bahamian",
    "Bahraini",
    "Bangladeshi",
    "Barbadian",
    "Barbudans",
    "Batswana",
    "Belarusian",
    "Belgian",
    "Belizean",
    "Beninese",
    "Bhutanese",
    "Bolivian",
    "Bosnian",
    "Brazilian",
    "British",
    "Bruneian",
    "Bulgarian",
    "Burkinabe",
    "Burmese",
    "Burundian",
    "Cambodian",
    "Cameroonian",
    "Canadian",
    "Cape Verdean",
    "Central African",
    "Chadian",
    "Chilean",
    "Chinese",
    "Colombian",
    "Comoran",
    "Congolese",
    "Costa Rican",
    "Croatian",
    "Cuban",
    "Cypriot",
    "Czech",
    "Danish",
    "Djibouti",
    "Dominican",
    "Dutch",
    "East Timorese",
    "Ecuadorean",
    "Egyptian",
    "Emirian",
    "Equatorial Guinean",
    "Eritrean",
    "Estonian",
    "Ethiopian",
    "Fijian",
    "Filipino",
    "Finnish",
    "French",
    "Gabonese",
    "Gambian",
    "Georgian",
    "German",
    "Ghanaian",
    "Greek",
    "Grenadian",
    "Guatemalan",
    "Guinea-Bissauan",
    "Guinean",
    "Guyanese",
    "Haitian",
    "Herzegovinian",
    "Honduran",
    "Hungarian",
    "I-Kiribati",
    "Icelander",
    "Indian",
    "Indonesian",
    "Iranian",
    "Iraqi",
    "Irish",
    "Israeli",
    "Italian",
    "Ivorian",
    "Jamaican",
    "Japanese",
    "Jordanian",
    "Kazakhstani",
    "Kenyan",
    "Kittian and Nevisian",
    "Kuwaiti",
    "Kyrgyz",
    "Laotian",
    "Latvian",
    "Lebanese",
    "Liberian",
    "Libyan",
    "Liechtensteiner",
    "Lithuanian",
    "Luxembourger",
    "Macedonian",
    "Malagasy",
    "Malawian",
    "Malaysian",
    "Maldivan",
    "Malian",
    "Maltese",
    "Marshallese",
    "Mauritanian",
    "Mauritian",
    "Mexican",
    "Micronesian",
    "Moldovan",
    "Monacan",
    "Mongolian",
    "Moroccan",
    "Mosotho",
    "Motswana",
    "Mozambican",
    "Namibian",
    "Nauruan",
    "Nepalese",
    "Netherlander",
    "New Zealander",
    "Nicaraguan",
    "Nigerian",
    "North Korean",
    "Norwegian",
    "Omani",
    "Pakistani",
    "Palauan",
    "Panamanian",
    "Papua New Guinean",
    "Paraguayan",
    "Peruvian",
    "Polish",
    "Portuguese",
    "Qatari",
    "Romanian",
    "Russian",
    "Rwandan",
    "Saint Lucian",
    "Salvadoran",
    "Samoan",
    "San Marinese",
    "Sao Tomean",
    "Saudi",
    "Scottish",
    "Senegalese",
    "Serbian",
    "Seychellois",
    "Sierra Leonean",
    "Singaporean",
    "Slovakian",
    "Slovenian",
    "Solomon Islander",
    "Somali",
    "South African",
    "South Korean",
    "Spanish",
    "Sri Lankan",
    "Sudanese",
    "Surinamese",
    "Swazi",
    "Swedish",
    "Swiss",
    "Syrian",
    "Taiwanese",
    "Tajik",
    "Tanzanian",
    "Thai",
    "Togolese",
    "Tongan",
    "Trinidadian and Tobagonian",
    "Tunisian",
    "Turkish",
    "Tuvaluan",
    "Ugandan",
    "Ukrainian",
    "Uruguayan",
    "Uzbekistani",
    "Venezuelan",
    "Vietnamese",
    "Welsh",
    "Yemenite",
    "Zambian",
    "Zimbabwean",
  ];

  static final paddingScreen =
      EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h);

  static const Duration durationSlide = Duration(milliseconds: 350);

  static String generatePinCode() {
    final random = Random();
    String pinCode = '';
    for (int i = 0; i < 6; i++) {
      pinCode += random.nextInt(10).toString();
    }
    return pinCode;
  }

  static Future<String> getGuestId() async {
    const channel = MethodChannel('Back_End_Channel');
    final returnValue = await channel.invokeMethod<String>('getMacAddress');
    return "$guest${returnValue ?? ''}";
  }

  static Future<String> getMacAddress() async {
    const channel = MethodChannel('Back_End_Channel');
    final returnValue = await channel.invokeMethod<String>('getMacAddress');
    return returnValue ?? '';
  }

  static Duration contactScreenErrorDuration = Duration(seconds: 1);
  static Duration bottomNavigationBarDuration = Duration(seconds: 1);
}
