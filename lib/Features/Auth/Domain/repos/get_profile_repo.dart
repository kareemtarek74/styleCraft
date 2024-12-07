import 'package:dartz/dartz.dart';
import 'package:style_craft/Features/Auth/Domain/entities/get_profile_entity.dart';

abstract class ProfileInfoRepo {
  Future<Either<String, ProfileInfoEntity>> getProfileInfo();
}
