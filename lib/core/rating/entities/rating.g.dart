// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      usersRates: (json['usersRates'] as List<dynamic>)
          .map((e) => UserRating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'usersRates': instance.usersRates,
    };

UserRating _$UserRatingFromJson(Map<String, dynamic> json) => UserRating(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      rating: (json['rating'] as num).toDouble(),
      description: json['description'] as String,
      data: DateTime.parse(json['data'] as String),
    );

Map<String, dynamic> _$UserRatingToJson(UserRating instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'rating': instance.rating,
      'description': instance.description,
      'data': instance.data.toIso8601String(),
    };
