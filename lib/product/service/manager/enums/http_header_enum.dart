// ignore_for_file: public_member_api_docs

enum HttpHeaderEnum {
  Bearer('Bearer'),
  Authorization('Authorization'),
  XApiKey('X-Api-Key');

  final String value;
  const HttpHeaderEnum(this.value);
}
