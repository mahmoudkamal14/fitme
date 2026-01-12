class ApiErrorModel {
  final String title;
  final int status;
  final List<String> errors;

  ApiErrorModel({
    required this.title,
    required this.status,
    required this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      title: json['title'] ?? 'Error',
      status: json['status'] ?? 0,
      errors:
          (json['errors'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }

  String get errorMessage => errors.isNotEmpty ? errors.first : title;
}
