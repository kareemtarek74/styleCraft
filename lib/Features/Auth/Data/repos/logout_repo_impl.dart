import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:style_craft/Features/Auth/Domain/repos/logout_repo.dart';
import 'package:style_craft/core/Api/api_consumer.dart';
import 'package:style_craft/core/Api/dio_consumer.dart';
import 'package:style_craft/core/Api/end_points.dart';
import 'package:style_craft/core/Errors/exceptions.dart';

class LogoutRepoImpl extends LogoutRepo {
  final ApiConsumer apiConsumer;
  final SharedPreferences sharedPreferences;
  final DioConsumer dioConsumer;

  LogoutRepoImpl({
    required this.dioConsumer,
    required this.apiConsumer,
    required this.sharedPreferences,
  });

  @override
  Future<Either<String, String>> logoutUser() async {
    try {
      final accessToken = sharedPreferences.getString(ApiKeys.accessToken);

      if (accessToken == null || accessToken.isEmpty) {
        return left('No access token available for logout.');
      }

      await apiConsumer.post(
        EndPoints.logout,
      );

      await sharedPreferences.remove(ApiKeys.accessToken);
      await sharedPreferences.remove(ApiKeys.refreshToken);

      return right('Logout successfully.');
    } on ServerException catch (e) {
      return left(e.errorModel.message);
    }
  }
}
