import 'package:halla/core/common/domain/entities/social_media.dart';

class SocialMediaModel extends SocialMedia {
  SocialMediaModel({
    super.facebook = '',
    super.instagram = '',
    super.linkedin = '',
    super.twitter = '',
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
  factory SocialMediaModel.fromSocialMedia(SocialMedia socialMedia) {
    return SocialMediaModel(
      facebook: socialMedia.facebook,
      instagram: socialMedia.instagram,
      linkedin: socialMedia.linkedin,
      twitter: socialMedia.twitter,
    );
  }
}
