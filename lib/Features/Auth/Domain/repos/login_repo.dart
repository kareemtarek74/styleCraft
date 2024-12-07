import 'package:dartz/dartz.dart';
import 'package:style_craft/Features/Auth/Domain/entities/login_entity.dart';

abstract class LoginRepo {
  Future<Either<String, LoginEntity>> loginUser(
      {String? phone, String? password});
}
