import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:style_craft/Features/Auth/Data/models/login_model.dart';
import 'package:style_craft/Features/Auth/Domain/entities/login_entity.dart';
import 'package:style_craft/Features/Auth/Domain/repos/login_repo.dart';
import 'package:style_craft/core/Api/api_consumer.dart';
import 'package:style_craft/core/Api/end_points.dart';
import 'package:style_craft/core/Errors/exceptions.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiConsumer apiConsumer;
  final SharedPreferences sharedPreferences;

  LoginRepoImpl({required this.apiConsumer, required this.sharedPreferences});

  @override
  Future<Either<String, LoginEntity>> loginUser({
    String? phone,
    String? password,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.login,
        data: {ApiKeys.phone: phone, ApiKeys.password: password},
      );

      if (!response.containsKey(ApiKeys.accessToken) ||
          !response.containsKey(ApiKeys.refreshToken)) {
        if (response.containsKey('message')) {
          return left(response['message']);
        }
        return left('Invalid login response: Missing tokens.');
      }

      final accessToken = response[ApiKeys.accessToken];
      final refreshToken = response[ApiKeys.refreshToken];

      await sharedPreferences.setString(ApiKeys.accessToken, accessToken);
      await sharedPreferences.setString(ApiKeys.refreshToken, refreshToken);

      return right(LoginModel.fromJson(response));
    } on ServerException catch (e) {
      return left(e.errorModel.message);
    } catch (e) {
      return left('Unexpected error occurred during login.');
    }
  }
}
