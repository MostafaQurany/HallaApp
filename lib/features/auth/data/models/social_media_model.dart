import 'package:halla/core/domain/entities/social_media.dart';

class SocialMediaModel extends SocialMedia {
  SocialMediaModel({
    required super.facebook,
    required super.instagram,
    required super.linkedin,
    required super.twitter,
  });


  
  SocialMediaModel copyWith({
    String? facebook,
    String? instagram,
    String? linkedin,
    String? twitter,
  }) {
    return SocialMediaModel(
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

  factory SocialMediaModel.fromMap(Map<String, dynamic> map) {
    return SocialMediaModel(
      facebook: map['facebook'] as String,
      instagram: map['instagram'] as String,
      linkedin: map['linkedin'] as String,
      twitter: map['twitter'] as String,
    );
  }
}
