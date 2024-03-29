import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../Data/App Exceptions/app_exception.dart';

abstract class BaseNetworkServices {
  Future<dynamic> getReq(url);
  Future<dynamic> postReq(url, var data, {String? bearerToken});
  // Future<dynamic> postFormReq(url, var data, {String? bearerToken});
  Future<dynamic> postFormReq(String url, Map<String, String> data,
      {File? pdfFile, String? bearerToken});
}

class NetworkServices implements BaseNetworkServices {
  @override
  Future<dynamic> getReq(url, {String? bearerToken}) async {
    // ignore: prefer_typing_uninitialized_variables
    var futureData;

    log(url);
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken',
        },
      );
      log(response.body.toString());

      log("------");
      log(response.statusCode.toString());

      futureData = getApiResponse(response);
      print(futureData);
    } on SocketException {
      throw InternetException;
    } on TimeoutException {
      throw RequestTimeOutException;
    }

    return futureData;
  }

  dynamic getApiResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var data = jsonDecode(response.body);
        return data;
      case 500:
        throw ServerException(response.statusCode);
      case 401:
        throw UnAuthorizedException(response.statusCode);
      case 403:
        throw UnAuthorizedException(response.statusCode);
      case 409:
        throw ConflictException(response.statusCode);
    }
  }

  @override
  Future postReq(url, data, {String? bearerToken}) async {
    dynamic futureData;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken',
        },
      );
      futureData = getApiResponse(response);
    } on SocketException {
      throw InternetException;
    } on TimeoutException {
      throw RequestTimeOutException;
    }

    return futureData;
  }

  @override
  // Don't forget to import this

  Future<dynamic> postFormReq(String url, Map<String, String> data,
      {File? pdfFile, String? bearerToken}) async {
    dynamic futureData;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      if (bearerToken != null) {
        request.headers['Authorization'] = 'Bearer $bearerToken';
      }

      request.fields.addAll(data);

      if (pdfFile != null) {
        request.files.add(http.MultipartFile(
          'attachment',
          pdfFile.readAsBytes().asStream(),
          pdfFile.lengthSync(),
          filename: pdfFile.path.split('/').last,
          contentType: MediaType('application', 'pdf'),
        ));
      }

      var streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      futureData = getApiResponse(response);
    } on SocketException {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimeOutException();
    }

    return futureData;
  }

  // Future postFormReq(url, data, {String? bearerToken}) async {
  //   dynamic futureData;
  //   try {
  //     var request = http.MultipartRequest('POST', Uri.parse(url));
  //     Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
  //     request.headers.addAll(headers);
  //     request.fields.addAll(data);
  //     var responsed = await request.send();
  //     var response = await http.Response.fromStream(responsed);
  //     futureData = getApiResponse(response);
  //   } on SocketException {
  //     throw InternetException;
  //   } on TimeoutException {
  //     throw RequestTimeOutException;
  //   }
  //   return futureData;
  // }
}
