import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'social_media.g.dart';

@HiveType(typeId: 2)
class SocialMedia extends HiveObject {
  @HiveField(0)
  String facebook;
  @HiveField(1)
  String instagram;
  @HiveField(2)
  String linkedin;
  @HiveField(3)
  String twitter;
  @HiveField(4)
  SocialMedia({
    this.facebook='',
    this.instagram='',
    this.linkedin='',
    this.twitter='',
  });
  @override
  String toString() {
    return 'SocialMedia(facebook: $facebook, instagram: $instagram, linkedin: $linkedin, twitter: $twitter)';
  }

  SocialMedia copyWith({
    String? facebook,
    String? instagram,
    String? linkedin,
    String? twitter,
  }) {
    return SocialMedia(
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      linkedin: linkedin ?? this.linkedin,
      twitter: twitter ?? this.twitter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'facebook': facebook,
      'instagram': instagram,
      'linkedin': linkedin,
      'twitter': twitter,
    };
  }

  factory SocialMedia.fromMap(Map<String, dynamic> map) {
    return SocialMedia(
      facebook: map['facebook'] as String,
      instagram: map['instagram'] as String,
      linkedin: map['linkedin'] as String,
      twitter: map['twitter'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialMedia.fromJson(String source) =>
      SocialMedia.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant SocialMedia other) {
    if (identical(this, other)) return true;

    return other.facebook == facebook &&
        other.instagram == instagram &&
        other.linkedin == linkedin &&
        other.twitter == twitter;
  }

  @override
  int get hashCode {
    return facebook.hashCode ^
        instagram.hashCode ^
        linkedin.hashCode ^
        twitter.hashCode;
  }
}
