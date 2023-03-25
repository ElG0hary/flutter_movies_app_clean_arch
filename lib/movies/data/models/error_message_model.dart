import 'package:movies_clean_architecture/movies/domain/entities/error_message.dart';

class ErrorMessageModel extends ErrorMessage {
  const ErrorMessageModel({
    required super.statusMessage,
    required super.statusCode,
    required super.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusMessage: json['status_message'],
        statusCode: json['status_code'],
        success: json['success'],
      );
}
