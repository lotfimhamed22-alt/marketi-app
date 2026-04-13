abstract class ApiConsumer {
  // get request

  Future<void> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  // post request
  Future<Map<String, dynamic>> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  // patch request
  Future<void> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  // delete request
  Future<void> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}
