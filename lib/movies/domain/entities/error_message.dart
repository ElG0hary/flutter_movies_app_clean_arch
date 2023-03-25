import 'package:equatable/equatable.dart';

class ErrorMessage extends Equatable {
  final String statusMessage;
  final int statusCode;
  final bool success;

  const ErrorMessage({
    required this.statusMessage,
    required this.statusCode,
    required this.success,
  });
  
  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
