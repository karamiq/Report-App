import 'dart:async';
import 'package:app/data/models/plate_characters_model.dart';
import 'package:app/utils/components/custom_api_item_one_select.dart';
import 'package:flutter/material.dart';
import '../../../common_lib.dart';
import '../../../utils/components/custom_api_item_two_select.dart';
import '../../../utils/components/decoration/input_decoration.dart';
import '../../../utils/components/decoration/note_decoration.dart';
import 'functions.dart';

class FeeForm extends ConsumerStatefulWidget {
  const FeeForm({super.key});

  @override
  createState() => FeeFormState();
}

class FeeFormState extends ConsumerState<FeeForm> {
  static late TextEditingController governorateController;
  static late TextEditingController charController;
  static late TextEditingController plateNumberController;
  late TextEditingController violationTypeController;
  late TextEditingController feeFine;
  static late TextEditingController notesController;
  static late TextEditingController feeNumberContorller;
  ///////////////////////////////////////////////////
  static late TextEditingController governorateControllerId;
  static late TextEditingController plateCharacterId;
  static late TextEditingController plateTypeId;
  static late TextEditingController plateType;
  static late TextEditingController feeFinesId;
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

  @override
  void initState() {
    super.initState();
    plateType = TextEditingController();
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
    govs = gov(ref, null);
    // Future<List<PlateCharacterModel>> charList =
    //     char(ref, governorateControllerId.text, null);
    fetch();
  }

  void fetch() async {
    feeNumberContorller.text = await lastNumber(ref);
  }

  @override
  void dispose() {
    plateType.dispose();
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
    super.dispose();
  }

  String? validator(String? query) {
    if (query == null || query.isEmpty) {
      return 'الحقل مطلوب';
    } else {
      return null;
    }
  }

  String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الحقل مطلوب';
    }
    final number = num.tryParse(value);
    if (number == null) {
      return 'ادخل رقم صالح';
    }

    return null;
  }

  Future<List<PlateCharacterModel>> charList = Future.value([]);
  dynamic govs = [];

  @override
  Widget build(BuildContext context) {
    return ColumnPadded(
      gap: Insets.extraSmall,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(Insets.small),
        TextFormField(
          focusNode: focusNode1,
          keyboardType: TextInputType.number,
          controller: feeNumberContorller,
          validator: numberValidator,
          textInputAction: TextInputAction.next,
          decoration: customInputDecoration(
            suffixIcon: false,
            context: context,
            labelText: 'رقم المخالفة',
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: plateNumberController,
          validator: numberValidator,
          decoration: customInputDecoration(
            suffixIcon: false,
            context: context,
            labelText: 'رقم اللوحة',
          ),
        ),
        CustomApiItemSelectOne(
          labelText: 'نوع اللوحة',
          controller: plateType,
          itemListFuture: plteTaype(ref),
          onSelect: (value) {
            try {
              plateTypeId.text = value?.id;
            } catch (e) {}
          },
          validator: validator,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomApiItemSelectTwo(
                enabled: governorateController.text.isNotEmpty,
                labelText: 'الحرف',
                fetchItems: (ref, govId, name) => char(ref, govId, name),
                //  validator: validator,
                govId: governorateControllerId.text,
                controller: charController,
                onSelect: (value) async {
                  try {
                    setState(() {
                      plateCharacterId.text = value.id;
                    });
                    final gg = await govById(ref, value.governorateId);
                    governorateController.text = gg?.name ?? '';
                    governorateControllerId.text = value.governorateId;
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
            const Gap(Insets.small),
            Expanded(
              flex: 4,
              child: CustomApiItemSelectOne(
                labelText: 'المحافظة',
                controller: governorateController,
                itemListFuture: gov(ref, null),
                onSelect: (value) async {
                  print(value);
                  setState(() {
                    charList = char(ref, value?.id, null);
                    try {
                      governorateControllerId.text = value?.id;
                    } catch (e) {}
                    charController.text = '';
                  });
                },
                validator: validator,
              ),
            ),
          ],
        ),
        CustomApiItemSelectOne(
          labelText: 'اختر نوع المخالفة',
          controller: feeFine,
          itemListFuture: feeFines(ref),
          validator: validator,
          onSelect: (p0) => feeFinesId.text = p0?.id ?? '',
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
