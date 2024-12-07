import 'package:dartz/dartz.dart';
import 'package:style_craft/Features/Auth/Domain/entities/refresh_token.dart';

abstract class RefreshTokenRepo {
  Future<Either<String, RefreshTokenEntity>> refreshToken();
}
