import 'package:dio/dio.dart';
import 'package:valorant_documentation/model/agent_model.dart';

class AgentService {

  static Dio dio = Dio();
  // static Future<String> getAgent() async {
  //   Dio dio = Dio();
  //   final response = await dio.get('https://valorant-api.com/v1/agents');
  //   var displayName = response.data["data"]["displayName"];

  //   return displayName;
  // }

  static Future<AgentModels?> getAgent() async {
    try {
      final response = await dio.get('https://valorant-api.com/v1/agents');
      print(response.data);
      return AgentModels.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
