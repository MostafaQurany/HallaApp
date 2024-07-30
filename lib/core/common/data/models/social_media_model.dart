import 'package:halla/core/common/domain/entities/social_media.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'social_media_model.g.dart';
@HiveType(typeId: 3)
class SocialMediaModel extends SocialMedia with HiveObjectMixin {
  @HiveField(0)
  @override
  final String facebook;
  @HiveField(1)
  @override
  final String instagram;
  @HiveField(2)
  @override
  final String linkedin;
  @HiveField(3)
  @override
  final String twitter;

  SocialMediaModel({
    this.facebook = '',
    this.instagram = '',
    this.linkedin = '',
    this.twitter = '',
  }) : super(
          facebook: facebook,
          instagram: instagram,
          linkedin: linkedin,
          twitter: twitter,
        );

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
