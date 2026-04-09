class ErrorModel {
  final dynamic status;
  final dynamic errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json['status'],
      errorMessage: json['ErrorMessage'],
    );
  }
}
