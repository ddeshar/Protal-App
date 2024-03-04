import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protal_app/core/state/api_state.dart';
import 'package:protal_app/modules/show_image/models/image_entity.dart';
import 'package:protal_app/services/image_service.dart';

class ImageController extends GetxController {
  ImageController();

  final ImageService imageService = ImageService();

  final _apiState = ApiState.initial.obs;
  final _imageEntity = <ImageEntity>[].obs;
  final _offset = 0.obs;

  ApiState get apiState => _apiState.value;

  List<ImageEntity> get imageEntity => _imageEntity;

  int get offset => _offset.value;

  void setApiState({required ApiState newState}) {
    _apiState.value = newState;
  }

  Future<void> getImage({required int offset}) async {
    try {
      _apiState.value = ApiState.loading;
      _offset.value = offset;
      final result = await imageService.getImage(offset: offset.toString());
      if (result.success ?? false) {
        List<ImageEntity> data = result.mapToEntity();
        _imageEntity.addAll(data);
      }

      _apiState.value = ApiState.success;
      update();

    } on Exception catch (e) {
      debugPrint('Exception ===>${e.toString()}');
      _apiState.value = ApiState.error;
    }
  }

  void clearData(){
    _imageEntity.value = [];
  }
}
