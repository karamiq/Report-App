import 'dart:async';
import 'package:app/data/models/plate_characters_model.dart';
import 'package:flutter/material.dart';
import '../../../common_lib.dart';
import '../../../utils/components/custom_api_item_select.dart';
import '../../../utils/components/decoration/input_decoration.dart';
import '../../../utils/components/decoration/note_decoration.dart';
import 'functions.dart';

class FeeForm extends ConsumerStatefulWidget {
  const FeeForm({super.key});

  @override
  createState() => FeeFormState();
}

class FeeFormState extends ConsumerState<FeeForm> {
  late TextEditingController governorateController;
  late TextEditingController charController;
  static late TextEditingController plateNumberController;
  late TextEditingController violationTypeController;
  late TextEditingController feeFine;
  static late TextEditingController notesController;
  static late TextEditingController feeNumberContorller;
  ///////////////////////////////////////////////////
  static late TextEditingController governorateControllerId;
  static late TextEditingController plateCharacterId;
  static late TextEditingController plateTypeId;
  static late TextEditingController feeFinesId;
  late Future<List<PlateCharacterModel>> charList;
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

  @override
  void initState() {
    super.initState();
    feeNumberContorller = TextEditingController();
    governorateController = TextEditingController();
    charController = TextEditingController();
    plateNumberController = TextEditingController();
    violationTypeController = TextEditingController();
    notesController = TextEditingController();
    governorateControllerId = TextEditingController();
    feeFine = TextEditingController();
    plateCharacterId = TextEditingController();
    plateTypeId = TextEditingController();
    feeFinesId = TextEditingController();
    charList = char(ref, governorateControllerId.text);
  }

  @override
  void dispose() {
    feeNumberContorller.dispose();
    governorateController.dispose();
    charController.dispose();
    plateNumberController.dispose();
    violationTypeController.dispose();
    notesController.dispose();
    governorateControllerId.dispose();
    feeFine.dispose();
    plateCharacterId.dispose();
    plateTypeId.dispose();
    feeFinesId.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  String? validator(String? query) {
    if (query == null || query.isEmpty) {
      return 'الحقل مطلوب';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(Insets.small),
        TextFormField(
          focusNode: focusNode1,
          keyboardType: TextInputType.number,
          controller: feeNumberContorller,
          validator: validator,
          textInputAction: TextInputAction.next,
          decoration: customInputDecoration(
            suffixIcon: false,
            prefixIcon: Assets.assetsSvgCarNumber,
            context: context,
            labelText: 'رقم المخالفة',
          ),
        ),
        TextFormField(
          focusNode: focusNode2,
          keyboardType: TextInputType.number,
          controller: plateNumberController,
          validator: validator,
          textInputAction: TextInputAction.next,
          decoration: customInputDecoration(
            suffixIcon: false,
            prefixIcon: Assets.assetsSvgCarNumber,
            context: context,
            labelText: 'رقم اللوحة',
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomApiItemSelect(
                labelText: 'الحرف',
                controller: charController,
                itemListFuture: charList,
                onChanged: (value) async {
                  try {
                    setState(() {
                      plateCharacterId.text = value.id;
                    });
                    final gg = await govById(ref, value.governorateId);
                    governorateController.text = gg?.name ?? '';
                  } catch (e) {
                    print(e);
                  }
                },
                validator: validator,
              ),
            ),
            const Gap(Insets.small),
            Expanded(
              flex: 4,
              child: CustomApiItemSelect(
                labelText: 'المحافظة',
                controller: governorateController,
                itemListFuture: gov(ref),
                onChanged: (value) async {
                  setState(() {
                    print("the selected gov id: ${value?.id}");
                    print("the selected gov name: ${value?.name}");
                    charList = char(ref, value?.id);
                    governorateControllerId.text = value?.id ?? '';
                    charController.text = '';
                  });
                },
                validator: validator,
              ),
            ),
          ],
        ),
        CustomApiItemSelect(
          labelText: 'اختر نوع المخالفة',
          controller: feeFine,
          itemListFuture: feeFines(ref),
          validator: validator,
        ),
        const Gap(Insets.small),
        const Text(
          'ملاحظات',
          style: TextStyle(
            fontSize: FontsTheme.mediumSize,
            fontWeight: FontsTheme.mediumWeight,
          ),
        ),
        TextFormField(
          textInputAction: TextInputAction.done,
          onTapOutside: (f) => focusNode3.unfocus(),
          focusNode: focusNode3,
          controller: notesController,
          validator: validator,
          maxLines: 3,
          decoration: customNoteDecoration(
            context: context,
            labelText: 'اكتب ملاحظاتك',
          ),
        ),
      ],
    );
  }
}
/*
   CustomApiItemSelect(
          labelText: 'اختر نوع المخالفة',
          controller: feeFine,
          itemListFuture: feeFines(ref),
          validator: validator,
        ),
        
        
    */