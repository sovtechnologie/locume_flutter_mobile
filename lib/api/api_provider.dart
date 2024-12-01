// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:locume/config.dart';

class ApiProvider {
  static Future<http.Response> get(String url,
      {Map<String, String>? head}) async {
    log("GET url: ${CONFIG.apiUrl()}$url");
    log("GET head: $head");
    return await http
        .get(Uri.parse("${CONFIG.apiUrl()}$url"), headers: head)
        .then((value) => value);
  }

  static Future<http.Response> post(String url,
      {Map<String, dynamic>? data, Map<String, String>? head}) async {
    log("POST url: ${CONFIG.apiUrl()}$url");
    log("POST payload: ${jsonEncode(data)}");
    log("POST head: $head");
    return await http
        .post(Uri.parse("${CONFIG.apiUrl()}$url"),
            body: jsonEncode(data), headers: head)
        .then((value) => value);
  }

  static Future<http.Response> streamPost(String url,
      {Map<String, dynamic>? data,
      Map<String, String>? head,
      Map<String, File>? files,
      bool valueToString = false}) async {
    log("FORM POST url: ${CONFIG.apiUrl()}$url");
    log("FORM POST payload: ${data.toString()}");
    log("FORM POST head: $head");
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse("${CONFIG.apiUrl()}$url"));
    if (data != null) {
      data.forEach((key, value) {
        request.fields[key] = valueToString ? value.toString() : value;
      });
    }
    if (head != null) {
      request.headers.addAll(head);
    }

    if (files != null) {
      files.forEach((key, value) {
        request.files.add(http.MultipartFile.fromBytes(
          key,
          value.readAsBytesSync(),
          filename: value.path.split('/').last,
        ));
      });
    }
    log("POST data: ${request.fields}");
    log("POST files: ${request.files}");
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

  static Future<http.Response> put(String url,
      {Map<String, dynamic>? data, Map<String, String>? head}) async {
    log("PUT url: ${CONFIG.apiUrl()}$url");
    log("PUT payload: ${jsonEncode(data)}");
    log("PUT head: $head");
    return await http
        .put(Uri.parse("${CONFIG.apiUrl()}$url"),
            body: jsonEncode(data), headers: head)
        .then((value) => value);
  }

  static Future<http.Response> delete(String url) async {
    return await http
        .delete(Uri.parse("${CONFIG.apiUrl()}$url"))
        .then((value) => value);
  }
}
