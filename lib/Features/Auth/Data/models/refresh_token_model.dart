import 'package:style_craft/Features/Auth/Domain/entities/refresh_token.dart';

class RefreshTokenModel extends RefreshTokenEntity {
  String? accessToken;

  RefreshTokenModel({this.accessToken}) : super(accesstoken: accessToken);

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenModel(
      accessToken: json['access_token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
      };
}
