
class ResourceNotFoundException implements Exception {
  final String cause;
  ResourceNotFoundException(this.cause);
}
