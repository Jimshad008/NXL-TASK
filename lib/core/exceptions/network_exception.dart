class NetworkException implements Exception {
  const NetworkException({this.code = '', this.message});

  final Object? message;
  final String code;

  @override
  String toString() => '$message';
}
