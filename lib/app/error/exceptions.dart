abstract class AppException implements Exception {
  final String message;

  const AppException(this.message);
}

class DatabaseException extends AppException {
  const DatabaseException(super.message);
}

class CacheException extends AppException {
  const CacheException(super.message);
}

class UnknownException extends AppException {
  const UnknownException() : super('Something went wrong');
}
