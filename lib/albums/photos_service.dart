import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ui_templates/albums/photos_model.dart';

abstract class IPhotosService {
  Future<List<PhotosModel>?> fetchPhotos();

  Future<List<PhotosModel>?> fetchPhotosWithId(int albumId);
}

class PhotosService implements IPhotosService {
  final Dio _dio;

  PhotosService()
      : _dio = Dio(
          BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'),
        );

  @override
  Future<List<PhotosModel>?> fetchPhotos() async {
    try {
      final response = await _dio.get(_PhotosServicePath.photos.name);

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PhotosModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  @override
  Future<List<PhotosModel>?> fetchPhotosWithId(int albumId) async {
    try {
      final response = await _dio.get(_PhotosServicePath.photos.name,
          queryParameters: {_PhotosQueryParameters.albumId.name: albumId});

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PhotosModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

enum _PhotosServicePath { photos }

enum _PhotosQueryParameters { albumId }

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}
