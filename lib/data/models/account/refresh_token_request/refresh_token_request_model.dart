import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request_model.g.dart';

@JsonSerializable()
class RefreshTokenRequestModel {
  const RefreshTokenRequestModel({
    required this.email,
  });

  factory RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestModelFromJson(json);

  @JsonKey(name: 'email')
  final String email;

  Map<String, dynamic> toJson() => _$RefreshTokenRequestModelToJson(this);
}
