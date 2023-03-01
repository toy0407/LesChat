import '../../domain/entities/content.dart';

class ContentModel extends Content {
  ContentModel({super.contentId, super.text, super.type, super.mediaUrl});

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      contentId: json['contentId'] == null ? null : json['contentId'] as String,
      text: json['text'] == null ? null : json['text'] as String,
      type: json['type'] == null ? null : json['type'] as String,
      mediaUrl: json['mediaUrl'] == null ? null : json['mediaUrl'] as String,
    );
  }

  Map<String, dynamic> toJson(ContentModel contentModel) => <String, dynamic>{
        'contentId': contentModel.contentId,
        'text': contentModel.text,
        'type': contentModel.type,
        'mediaUrl': contentModel.mediaUrl
      };
}
