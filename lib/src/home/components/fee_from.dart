import 'package:app/data/models/plate_characters_model.dart';
import 'package:app/utils/components/custom_list_item_select.dart';
import 'package:flutter/material.dart';
import '../../../common_lib.dart';
import '../../../utils/components/custom_api_item_select.dart';
import '../../../utils/components/decoration/input_decoration.dart';
import '../../../utils/components/decoration/note_decoration.dart';
import 'functions.dart';

class FeeForm extends ConsumerStatefulWidget {
  const FeeForm({super.key});

  @override
  FeeFormState createState() => FeeFormState();
}

class FeeFormState extends ConsumerState<FeeForm> {
  static late TextEditingController governorateController;
  static late TextEditingController charController;
  static late TextEditingController plateNumberController;
  static late TextEditingController violationTypeController;
  static late TextEditingController notesController;
  static late TextEditingController governorateControllerId;

  @override
  void initState() {
    super.initState();
    governorateController = TextEditingController();
    charController = TextEditingController();
    plateNumberController = TextEditingController();
    violationTypeController = TextEditingController();
    notesController = TextEditingController();
    governorateControllerId = TextEditingController();
  }

  @override
  void dispose() {
    governorateController.dispose();
    charController.dispose();
    plateNumberController.dispose();
    violationTypeController.dispose();
    notesController.dispose();
    governorateControllerId.dispose();
    super.dispose();
  }

  String? validator(String? query) {
    if (query == null || query.isEmpty) {
      return 'الحقل مطلوب';
    } else {
      return null;
    }
  }

  late Future<List<PlateCharacterModel>> charList;
  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode1 = FocusNode();
    final FocusNode focusNode2 = FocusNode();

    charList = char(ref, governorateControllerId.text);

    return ColumnPadded(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: Insets.extraSmall,
      children: [
        const Gap(Insets.small),
        CustomApiItemSelect(
          labelText: 'المحافظة',
          controller: governorateController,
          itemListFuture: gov(ref),
          onChanged: (value) async {
            print("the selected gov id: ${await value?.id}");
            print("the selected gov name: ${await value?.name}");
            setState(() {
              charList = char(ref, value?.id);
              governorateControllerId = TextEditingController(text: value?.id);
              charController.text = '';
            });
          },
          validator: validator,
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
                    final gg = await govById(ref, value.governorateId);
                    governorateController.text = gg?.name ?? '';
                  } catch (e) {
                    // Handle error
                    print(e);
                  }
                },
                validator: validator,
              ),
            ),
            const Gap(Insets.small),
            Expanded(
              flex: 4,
              child: TextFormField(
                focusNode: focusNode1,
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
            ),
          ],
        ),
        const Gap(Insets.small),
        CustomListItemSelect(
          labelText: 'اختر نوع المخالفة',
          controller: violationTypeController,
          itemListFuture: const [
            "الوقف على الطريق",
            "الركن في مكان مخصص للاصحاب الاحتياجات الخاصة"
                ""
          ],
          validator: validator,
        ),
        const Text(
          'ملاحظات',
          style: TextStyle(
            fontSize: FontsTheme.mediumSize,
            fontWeight: FontsTheme.mediumWeight,
          ),
        ),
        TextFormField(
          textInputAction: TextInputAction.done,
          onTapOutside: (f) => focusNode2.unfocus(),
          focusNode: focusNode2,
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
