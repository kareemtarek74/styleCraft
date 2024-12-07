import 'package:dartz/dartz.dart';
import 'package:style_craft/Features/Auth/Domain/entities/get_profile_entity.dart';
import 'package:style_craft/Features/Auth/Domain/repos/get_profile_repo.dart';
import 'package:style_craft/core/Api/api_consumer.dart';
import 'package:style_craft/core/Api/end_points.dart';
import 'package:style_craft/core/Errors/exceptions.dart';

import '../models/get_profile_model.dart';

class ProfileInfoRepoImpl extends ProfileInfoRepo {
  final ApiConsumer apiConsumer;

  ProfileInfoRepoImpl({required this.apiConsumer});
  @override
  Future<Either<String, ProfileInfoEntity>> getProfileInfo() async {
    try {
      final response = await apiConsumer.get(EndPoints.getProfile);

      return right(ProfileInfoModel.fromJson(response));
    } on ServerException catch (e) {
      return left(e.errorModel.message);
    }
  }
}
