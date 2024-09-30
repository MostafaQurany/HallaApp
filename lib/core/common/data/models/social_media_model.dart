import 'package:halla/core/common/domain/entities/social_media.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'social_media_model.g.dart';

@HiveType(typeId: 3)
class SocialMediaModel extends SocialMedia with HiveObjectMixin {
  @HiveField(0)
  final String facebookModel;
  @HiveField(1)
  final String instagramModel;
  @HiveField(2)
  final String linkedinModel;
  @HiveField(3)
  final String twitterModel;

  SocialMediaModel({
    this.facebookModel = '',
    this.instagramModel = '',
    this.linkedinModel = '',
    this.twitterModel = '',
  }) : super(
          facebook: facebookModel,
          instagram: instagramModel,
          linkedin: linkedinModel,
          twitter: twitterModel,
        );

  SocialMediaModel copyWith({
    String? facebook,
    String? instagram,
    String? linkedin,
    String? twitter,
  }) {
    return SocialMediaModel(
      facebookModel: facebook ?? this.facebook,
      instagramModel: instagram ?? this.instagram,
      linkedinModel: linkedin ?? this.linkedin,
      twitterModel: twitter ?? this.twitter,
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
      facebookModel: map['facebook'] as String ?? '',
      instagramModel: map['instagram'] as String ?? '',
      linkedinModel: map['linkedin'] as String ?? '',
      twitterModel: map['twitter'] as String ?? '',
    );
  }
  factory SocialMediaModel.fromSocialMedia(SocialMedia socialMedia) {
    return SocialMediaModel(
      facebookModel: socialMedia.facebook,
      instagramModel: socialMedia.instagram,
      linkedinModel: socialMedia.linkedin,
      twitterModel: socialMedia.twitter,
    );
  }
}
