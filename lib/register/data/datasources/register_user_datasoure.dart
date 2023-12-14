import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:v_commerce_vendor/register/data/models/register_user_model.dart';

abstract class RegisterUserDatasource {
  Future<RegisterUserModel> registerNewUser({
    required String userName,
    required String email,
    required String password,
  });
}

class RegisterUserDataSourceImpl implements RegisterUserDatasource {
  final Dio dio;

  RegisterUserDataSourceImpl({
    required this.dio,
  });

  @override
  Future<RegisterUserModel> registerNewUser({
    required String userName,
    required String email,
    required String password,
  }) async {
    // final Response response = await dio.post(
    //   baseUrl,
    //   data: {
    //     'userName': userName,
    //     'email': email,
    //     'password': password,
    //   },
    //   onSendProgress: (count, total) {
    //     log("Registering user progress: sent-> $count , total-> $total");
    //   },
    // );
    // if (response.statusCode == 200) {
    //   return RegisterUserModel.fromJson(
    //     json.decode(
    //       response.data,
    //     ),
    //   );
    // } else {
    //   throw ServerException();
    // }
    final data =
        RegisterUserModel(userName: userName, email: email, password: password);

    //final datas =
    //  await rootBundle.loadString("assets/register_dummy_data.json");

    log("data is ${data.toString()}");
    return RegisterUserModel.fromJson(data.toJson());
  }
}
