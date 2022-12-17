// ignore_for_file: public_member_api_docs, sort_constructors_first
class Content {
  int contentId;
  ContentType contentType;
  late String? text;
  late String? url;
  Content({
    required this.contentId,
    required this.contentType,
    this.text,
    this.url,
  });
}

enum ContentType {
  text,
  image,
  video;
}
