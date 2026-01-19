/// [RepositoryException] - It is used for throwing repository exception
class RepositoryException implements Exception {
  const RepositoryException({this.code = '', this.message});

  final Object? message;
  final String? code;

  @override
  String toString() => '$message';
}
