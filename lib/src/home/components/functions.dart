import 'dart:io';

import 'package:app/data/models/fee_fine_model.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/governorate_model.dart';
import '../../../data/models/plate_characters_model.dart';
import '../../../data/services/clients/auth_client.dart';

Future<String?> postImage(WidgetRef ref, File image) async {
  FormData formData = FormData();
  String fileName = image.path.split('/').last;

  formData.files.add(MapEntry(
    'file',
    await MultipartFile.fromFile(
      image.path,
      filename: fileName,
    ),
  ));
  try {
    final response = await ref.read(authClientProvider).postFile(formData);

    String url =
        'https://garagat-api.digital-logic.tech/' + response['message'];
    print('Response: ${url}');
    return url;
  } catch (e) {
    print('Unknown error: ${e}');
    return null;
  }
}

Future<List<dynamic>> gov(WidgetRef ref) async {
  try {
    final response = await ref.read(authClientProvider).governorate();
    final dataList = response.data as List<dynamic>;
    final governorates = dataList
        .map((json) => GovernorateModel.fromJson(json as Map<String, dynamic>))
        .toList();

    return governorates;
  } catch (e) {
    return [];
  }
}

Future<GovernorateModel?> govById(WidgetRef ref, String id) async {
  try {
    final response = await ref.read(authClientProvider).governorate();
    final dataList = response.data as List<dynamic>;
    final governorates = dataList
        .map((json) => GovernorateModel.fromJson(json as Map<String, dynamic>))
        .toList();

    return governorates.firstWhere((gov) => gov.id == id);
  } catch (e) {
    return null;
  }
}

Future<List<PlateCharacterModel>> char(WidgetRef ref, String? id) async {
  try {
    final response = await ref.read(authClientProvider).plateCharacter();
    final dataList = response.data as List<dynamic>;
    final governorates =
        dataList.map((json) => PlateCharacterModel.fromJson(json)).toList();
    if (id == null || id.isEmpty) {
      return governorates;
    } else {
      return governorates.where((char) => char.governorateId == id).toList();
    }
  } catch (e) {
    return [];
  }
}

Future<List<FeeFineModel>> feeFines(WidgetRef ref) async {
  try {
    final response = await ref.read(authClientProvider).feeFines();
    final dataList = response.data as List<dynamic>;
    final list = dataList
        .map((fee) => FeeFineModel.fromJson(fee as Map<String, dynamic>))
        .toList();

    return list;
  } catch (e) {
    return [];
  }
}
