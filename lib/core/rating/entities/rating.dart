import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating {
  List<UserRating> usersRates;

  Rating({
    required this.usersRates,
  });

  double getAverageRating() {
    double sum = 0;
    for (var element in usersRates) {
      sum += element.rating;
    }
    return sum / usersRates.length;
  }

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class UserRating {
  String userId;

  String userName;
  double rating;

  String description;
  DateTime data;

  UserRating({
    required this.userId,
    required this.userName,
    required this.rating,
    required this.description,
    required this.data,
  });

  factory UserRating.fromJson(Map<String, dynamic> json) =>
      _$UserRatingFromJson(json);

  Map<String, dynamic> toJson() => _$UserRatingToJson(this);
}
