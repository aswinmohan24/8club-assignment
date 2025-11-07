import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eight_club_test/models/experience.model.dart';

class ExperienceService {
  static final String apiUrl =
      "https://staging.chamberofsecrets.8club.co/v1/experiences?active=true";
  static Future<ExperienceModel> getAllExperience() async {
    try {
      final Dio dio = Dio(
        BaseOptions(headers: {"Content-Type": "application/json"}),
      );

      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        log("hy");
        final resAsJson = response.data;
        final experienceList = ExperienceModel.fromJson(resAsJson);
        log(experienceList.experiences.first.name);
        return experienceList;
      }
      throw Exception("Wrong");
    } on DioException catch (e) {
      throw Exception("Error occured $e");
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
