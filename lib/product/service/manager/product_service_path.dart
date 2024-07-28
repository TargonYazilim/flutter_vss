///Project service path
enum ProductServicePath {
  login('$_user/Login');

  final String value;
  const ProductServicePath(this.value);

  /// [withQuery] is add query to path
  ///
  /// Example: users/123
  String withQuery(String query) {
    return '${this.value}/$query';
  }

  /// Api UserProfile name
  static const String _user = 'Users/';
}
