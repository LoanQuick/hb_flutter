import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiError {
  final String message;
  final int code;

  ApiError({
    required this.code,
    required this.message,
  });

  factory ApiError.fromResponse(dio.Response rawResponse) {
    Map<String, dynamic> response = Map<String, dynamic>.from(rawResponse.data);
    return ApiError(
      code: rawResponse.statusCode!,
      message: response['message'].runtimeType == List
          ? response['message'][0]
          : response['message'].toString(),
    );
  }
}

class ApiService {
  // STAGING URL
  // static String apiBaseUrl = "https://snipe-staging-lfvnq7enja-el.a.run.app/";

  // PROD URL
  // static String apiBaseUrl = "https://squid-app-qvjzc.ondigitalocean.app/";
  // static String apiBaseUrl = "https://zg97h4jr-3000.inc1.devtunnels.ms/";

  // static String apiBaseUrl = "https://7ngtkg4f-3000.inc1.devtunnels.ms/";
  //! main url
  static String apiBaseUrl = "";
  // static String apiBaseUrl = "https://zg97h4jr-3000.inc1.devtunnels.ms/";
  // NGROK URL
  // static String apiBaseUrl = "https://squid-app-qvjzc.ondigitalocean.app/";

  // Local URL
  // static String apiBaseUrl = "http://10.0.2.2:8000/";

  final dio.Dio _dio = dio.Dio();

  ///GET method for REST API call
  ///
  ///Pass [UserModel] as [user] required for authentication based on app token
  ///
  ///Pass [String] as [endpoint]
  Future<dynamic> apiGetRedirect({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    required BuildContext context,
  }) async {
    try {
      // String? token = await FirebaseAuth.instance.currentUser!.getIdToken();
      // _dio.options.headers["Authorization"] = "Bearer $token";
      // log("API GET CALL : ${apiBaseUrl + endpoint}");

      dio.Response rawResponse = await _dio.get(endpoint,
          queryParameters: queryParameters,
          options: dio.Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ));

      log("raw response $rawResponse");
      log("raw response ${rawResponse.realUri.toString()}");
      log("raw response ${rawResponse.redirects.length}");

      launchUrl(rawResponse.realUri, mode: LaunchMode.externalApplication);

      return rawResponse.data;
    } on dio.DioException catch (e) {
      log("getAPI : ${e.toString()} - $endpoint");
      rethrow;
    }
  }

  Future<dynamic> apiGet({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    required BuildContext context,
  }) async {
    try {
      // String? token = await FirebaseAuth.instance.currentUser!.getIdToken();
      // _dio.options.headers["Authorization"] = "Bearer $token";
      // log("API GET CALL : ${apiBaseUrl + endpoint}");

      dio.Response rawResponse = await _dio.get(endpoint,
          queryParameters: queryParameters,
          options: dio.Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 300;
            },
          ));

      return rawResponse.data;
    } on dio.DioException catch (e) {
      log("getAPI : ${e.toString()} - $endpoint");
      rethrow;
    }
  }

  ///POST method for REST API call
  ///
  ///Pass [UserModel] as [user] required for authentication based on app token
  ///
  ///Pass [String] as [endpoint]
  Future<dynamic> apiPost({
    required String endpoint,
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    try {
      // String? token = await FirebaseAuth.instance.currentUser!.getIdToken();
      // _dio.options.headers["Authorization"] = "Bearer $token";
      // log("API POST CALL : ${apiBaseUrl + endpoint}");
      dio.Response rawResponse = await _dio.post(apiBaseUrl + endpoint,
          data: body,
          options: dio.Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 300;
            },
          ));

      return rawResponse.data;
    } on dio.DioException catch (e) {
      if (e.response!.statusCode == 401) {
        // await FirebaseAuth.instance.signOut();
        // await NavigatorService().clearNavigate(context, LoginScreen());
      }
      log(e.response!.data.toString());
      throw ApiError(code: 400, message: e.response!.data['message']);

      // log(e.error.toString());
      // log(e.response.toString());
    }
  }

  Future<dio.Response<dynamic>> apiPosAuth({
    required String endpoint,
    required Map<String, dynamic> body,
    // required BuildContext context,
  }) async {
    try {
      log("API POST CALL : ${apiBaseUrl + endpoint}");
      log(body.toString());
      dio.Response rawResponse = await _dio
          .post(apiBaseUrl + endpoint, data: body, options: dio.Options(
        // followRedirects: false,
        validateStatus: (status) {
          return status! < 300;
        },
      ));
      log(rawResponse.toString());
      return rawResponse;
    } on dio.DioException catch (e) {
      log(e.error.toString());
      rethrow;

      // log(e.response.toString());
    }
  }

  ///PATCH method for REST API call
  ///
  ///Pass [UserModel] as [user] required for authentication based on app token
  ///
  ///Pass [String] as [endpoint]
  Future<dynamic> apiPatch({
    required String endpoint,
    Map<String, dynamic>? body,
    required BuildContext context,
  }) async {
    try {
      // String? token = await FirebaseAuth.instance.currentUser!.getIdToken();

      // _dio.options.headers["Authorization"] = "Bearer $token";
      // log(apiBaseUrl + endpoint);
      // log(body.toString());
      dio.Response rawResponse = await _dio.patch(apiBaseUrl + endpoint,
          data: body,
          options: dio.Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 300;
            },
          ));

      return rawResponse.data;
    } on dio.DioException catch (e) {
      if (e.response!.statusCode == 401) {
        // await FirebaseAuth.instance.signOut();
        // await NavigatorService().clearNavigate(context, LoginScreen());
      }
      log(e.toString());
      log(e.message.toString());
      throw ApiError.fromResponse(e.response!);
    }
  }
}
