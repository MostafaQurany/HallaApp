import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:halla/core/constants/constants.dart';

import '../common/domain/entities/company.dart';
import '../common/domain/entities/social_media.dart';
import '../common/domain/entities/user.dart';

class RandomFakData {
  static List<String> jobTitles = [
    "Flutter Developer",
    "Plumber",
    "Electrician",
    "Data Scientist",
    "Graphic Designer",
    "Software Engineer",
    "Marketing Manager",
    "Accountant",
    "HR Specialist",
    "UI/UX Designer",
    "Doctor",
    "Nurse",
    "Construction Worker",
    "Mobile App Developer",
    "Teacher",
    "Backend Developer",
    "Security Officer",
    "Barber",
    "Chef",
    "Photographer",
    "Driver",
    "Mechanic",
    "Sales Representative",
    "Copywriter",
    "Digital Marketer"
  ];

  static User generateRandomUser(int index, double baseLat, double baseLng) {
    final random = Random();

    double randomLat =
        baseLat + (random.nextDouble() - 0.5) * 1.8; // Max 200km range
    double randomLng = baseLng + (random.nextDouble() - 0.5) * 1.8;

    return User(
      id: 'user_$index',
      email: 'user$index@example.com',
      fullName: 'User $index',
      primePhone: '+2011${random.nextInt(90000000) + 10000000}',
      dateOfBirth:
          '199${random.nextInt(10)}-0${random.nextInt(9) + 1}-1${random.nextInt(9)}',
      nationality: 'Egyptian',
      imageUrl:
          'https://randomuser.me/api/portraits/men/${random.nextInt(100)}.jpg',
      pinCode: '${random.nextInt(900000) + 100000}',
      phones: ['+2012${random.nextInt(90000000) + 10000000}'],
      socialMedia: SocialMedia(
        facebook: 'facebook.com/user$index',
        instagram: 'instagram.com/user$index',
        linkedin: 'linkedin.com/in/user$index',
        twitter: 'twitter.com/user$index',
      ),
      company: Company(
        name: 'Company $index',
        phoneNumber: '+202${random.nextInt(90000000) + 10000000}',
        website: 'https://company$index.com',
        position: 'Employee',
      ),
      jobTitles: [jobTitles[random.nextInt(jobTitles.length)]],
      location: GeoPoint(randomLat, randomLng),
      workRangeLocation: random.nextInt(50) + 10,
    );
  }

  static addToFirebase() async {
    final res = await Geolocator.getCurrentPosition();
    List<User> users = List.generate(
        25,
        (index) => generateRandomUser(
              index,
              res.latitude,
              res.longitude,
            ));
    for (User user in users) {
      FirebaseFirestore.instance
          .collection(AppConstants.userCollection)
          .doc(user.id)
          .set(user.toMap());
    }
  }
}
