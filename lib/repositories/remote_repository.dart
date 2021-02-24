import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:sedra/services/request_service.dart';
import 'package:flutter/foundation.dart';

class RemoteRepository {
  final RequestService _requestService;
  RemoteRepository(@required this._requestService);

  Future<Result> rateApp({@required rateValue}) async {
    try {
      String path = "";
      var result =
          await _requestService.postAsync(apiEndPoint: path, data: null);
      return Result.value("");
    } on DioError {
      return Result.error("Some thing went Wrong please Try again later");
    }
  }

  Future<Result> subscribeToNotification({@required String userEmail}) async {
    try {
      String path = "";
      var result =
          await _requestService.postAsync(apiEndPoint: path, data: null);
      return Result.value("");
    } on DioError {
      return Result.error("Some thing went Wrong please Try again later");
    }
  }

  Future<Result> getLastNews({@required String userEmail}) async {
    try {
      String path = "";
      var result = await _requestService.getAsync(apiEndPoint: path);
      return Result.value("");
    } on DioError {
      return Result.error("Some thing went Wrong please Try again later");
    }
  }

  Future<Result> getOurProjects({@required String userEmail}) async {
    try {
      String path = "";
      var result = await _requestService.getAsync(apiEndPoint: path);
      return Result.value("");
    } on DioError {
      return Result.error("Some thing went Wrong please Try again later");
    }
  }
}
