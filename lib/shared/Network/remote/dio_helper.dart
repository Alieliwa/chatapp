// import 'package:dio/dio.dart';
//
// class DioHelper {
//   static late Dio dio;
//   static init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://mahmoudhagagapi.com/api/v1',
//         receiveDataWhenStatusError: true,
//         // connectTimeout: 5000,
//         // receiveTimeout: 3000
//       ),
//     );
//   }
//   static Future<Response> getData(
//       {
//         required String url,
//       Map<String, dynamic>? quary,
//       String? token}) async {
//     dio.options.headers = {
//       'Content-Type': 'application/json',
//       "Authorization": "Bearer $token"
//     };
//     return await dio.get(url, queryParameters: quary);
//   }
//
//   static Future<Response> postData({
//     required String url,
//     Map<String, dynamic>? Quary,
//     required Map<String, dynamic> data,
//     String? token,
//   }) async {
//     dio.options.headers = {
//       'Content-Type': 'application/json',
//       "Authorization": "Bearer $token"
//     };
//     return await dio.post(url, queryParameters: Quary, data: data);
//   }
//
//   static Future<Response> putData({
//     required String Url,
//     Map<String, dynamic>? Quary,
//     required Map<String, dynamic> data,
//     String lang = 'en',
//     String? token,
//   }) async {
//     dio.options.headers = {
//       "Authorization": "Bearer $token"
//     };
//     return await dio.put(Url, queryParameters: Quary, data: data);
//   }
//
//
//   static Future<Response> deleteData({
//     required String Url,
//     Map<String, dynamic>? Quary,
//     required Map<String, dynamic> data,
//     String? token,
//   }) async {
//     dio.options.headers = {
//       "Authorization": "Bearer $token"
//     };
//     return await dio.delete(Url, queryParameters: Quary, data: data);
//   }
// }
