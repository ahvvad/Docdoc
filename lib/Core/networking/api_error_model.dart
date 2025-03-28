import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';
// build command: dart run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({
    required this.message,
    this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

