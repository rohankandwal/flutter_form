
import 'package:json_annotation/json_annotation.dart';

part 'github_feed_model.g.dart';

@JsonSerializable()
class GitHubFeedModel {
  final String timeline_url;
  final String user_url;
  final String security_advisories_url;

  GitHubFeedModel(
      {this.timeline_url, this.user_url, this.security_advisories_url});

  factory GitHubFeedModel.fromJson(Map<String, dynamic> json) => _$GitHubFeedModelFromJson(json);

  Map<String, dynamic> toJson() => _$GitHubFeedModelToJson(this);
}