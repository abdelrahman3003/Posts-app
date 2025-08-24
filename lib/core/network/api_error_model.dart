class ApiErrorModel {
  final String? message;
  final int? code;
  final Map<String, dynamic>? errors;

  ApiErrorModel({this.message, this.code, this.errors});
  factory ApiErrorModel.fromJson(Map<String, dynamic> errorMap) {
    return ApiErrorModel(
      code: errorMap['code'],
      message: errorMap['message'],
      errors: errorMap['errors'],
    );
  }
}
