// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitHubFeedModel _$GitHubFeedModelFromJson(Map<String, dynamic> json) {
  return GitHubFeedModel(
    timeline_url: json['timeline_url'] as String,
    user_url: json['user_url'] as String,
    security_advisories_url: json['security_advisories_url'] as String,
  );
}

Map<String, dynamic> _$GitHubFeedModelToJson(GitHubFeedModel instance) =>
    <String, dynamic>{
      'timeline_url': instance.timeline_url,
      'user_url': instance.user_url,
      'security_advisories_url': instance.security_advisories_url,
    };
