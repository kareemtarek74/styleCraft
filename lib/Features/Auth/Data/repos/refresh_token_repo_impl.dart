import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:style_craft/Features/Auth/Data/models/refresh_token_model.dart';
import 'package:style_craft/Features/Auth/Domain/entities/refresh_token.dart';
import 'package:style_craft/Features/Auth/Domain/repos/refresh_token_repo.dart';
import 'package:style_craft/core/Api/api_consumer.dart';
import 'package:style_craft/core/Api/end_points.dart';
import 'package:style_craft/core/Errors/exceptions.dart';

class RefreshTokenRepoImpl extends RefreshTokenRepo {
  final ApiConsumer apiConsumer;
  final SharedPreferences sharedPreferences;

  RefreshTokenRepoImpl(
      {required this.apiConsumer, required this.sharedPreferences});
  @override
  Future<Either<String, RefreshTokenEntity>> refreshToken() async {
    try {
      final response = await apiConsumer.get(EndPoints.refreshToken,
          queryParameters: {
            ApiKeys.token: sharedPreferences.getString(ApiKeys.refreshToken)
          });

      await sharedPreferences.setString(
          ApiKeys.accessToken, response[ApiKeys.accessToken]);
      return right(RefreshTokenModel.fromJson(response));
    } on ServerException catch (e) {
      return left(e.errorModel.message);
    }
  }
}
