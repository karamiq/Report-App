import 'dart:io';
import 'package:app/data/models/fee_fine_model.dart';
import 'package:app/data/providers/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/models/governorate_model.dart';
import '../../../data/models/plate_characters_model.dart';
import '../../../data/models/plate_types.dart';
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

Future<List<dynamic>> gov(WidgetRef ref, String? name) async {
  try {
    final response = await ref.read(authClientProvider).governorate(name);
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
    final response = await ref.read(authClientProvider).governorate(null);
    final dataList = response.data as List<dynamic>;
    final governorates = dataList
        .map((json) => GovernorateModel.fromJson(json as Map<String, dynamic>))
        .toList();

    return governorates.firstWhere((gov) => gov.id == id);
  } catch (e) {
    return null;
  }
}

Future<List<PlateCharacterModel>> char(
    WidgetRef ref, String? govId, String? name) async {
  try {
    final client = ref.read(authClientProvider);
    List<PlateCharacterModel> allData = [];
    int currentPage = 1;
    int totalPages = 1;
    while (currentPage <= totalPages) {
      final response = await client.plateCharacter(name, govId, currentPage);
      if (response is Map<String, dynamic> && response.containsKey('data')) {
        final dataList = List<dynamic>.from(response['data'])
            .map((json) =>
                PlateCharacterModel.fromJson(json as Map<String, dynamic>))
            .toList();
        allData.addAll(dataList);
        totalPages = response['totalPages'] as int;
      } else {
        return [];
      }
      currentPage++;
    }
    if (govId == null || govId.isEmpty) {
      return allData;
    } else {
      return allData.where((char) => char.governorateId == govId).toList();
    }
  } catch (e) {
    print('Error fetching plate characters: $e');
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

Future<List<PlateTypeModel>> plteTaype(WidgetRef ref) async {
  try {
    final response = await ref.read(authClientProvider).platyTypeGet();
    final dataList = response.data as List<dynamic>;
    final list = dataList.map((fee) => PlateTypeModel.fromJson(fee)).toList();
    print(await list);
    return list;
  } catch (e) {
    return [];
  }
}

Future<String> lastNumber(WidgetRef ref) async {
  final user = ref.read(userProvider);
  try {
    final response =
        await ref.read(authClientProvider).lastNumberGet(user!.garageId, 2);
    final data = response['number'];
    return data;
  } catch (e) {
    return lastNumber(ref);
    //throw Exception(e);
  }
}
