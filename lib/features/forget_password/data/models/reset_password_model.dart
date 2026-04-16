class ApiResponseRestePass {
  final String message;

  ApiResponseRestePass({required this.message});

  factory ApiResponseRestePass.fromJson(Map<String, dynamic> json) {
    return ApiResponseRestePass(message: json["message"] ?? "");
  }
}
