import 'package:app/common_lib.dart';
import 'package:app/utils/components/decoration/input_decoration.dart';
import 'package:flutter/material.dart';

class CustomListItemSelect extends StatelessWidget {
  const CustomListItemSelect({
    super.key,
    required this.labelText,
    required this.controller,
    required this.itemListFuture,
    required this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon = true,
  });

  final String labelText;
  final dynamic validator;
  final TextEditingController controller;
  final List<String> itemListFuture;
  final String? prefixIcon;
  final Function(dynamic)? onChanged;
  final bool suffixIcon;

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return TextFormField(
      focusNode: focusNode,
      onTapOutside: (event) => focusNode.unfocus(),
      readOnly: true,
      decoration: customInputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          context: context,
          suffixIcon: suffixIcon),
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onTap: () async {
        dynamic result = await showModalBottomSheet(
          isScrollControlled: true,
          enableDrag: true,
          context: context,
          builder: (context) => SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ShowSelectionBottomSheet(
              itemList: itemListFuture,
              controller: controller,
            ),
          ),
        );
        if (onChanged != null) {
          onChanged!(result);
        }
      },
    );
  }
}

class ShowSelectionBottomSheet extends StatefulWidget {
  const ShowSelectionBottomSheet(
      {super.key, required this.itemList, required this.controller});

  final List<String> itemList;
  final TextEditingController controller;

  @override
  createState() => _ShowSelectionBottomSheetState();
}

class _ShowSelectionBottomSheetState extends State<ShowSelectionBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredCountries = [];

  @override
  void initState() {
    _filteredCountries = widget.itemList;
    super.initState();
    _searchController.addListener(() {
      _filterCountries(_searchController.text);
    });
  }

  void _filterCountries(String query) {
    setState(() {
      _filteredCountries = widget.itemList
          .where(
              (country) => country.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = 600;
    if (widget.itemList.length <= 4) {
      height = 300;
    } else if (widget.itemList.length <= 8 && widget.itemList.length >= 4) {
      height = 450;
    } else {
      height = 500;
    }

    return Container(
      height: height,
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(BorderSize.medium))),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Gap(
            Insets.medium,
          ),
          TextField(
            controller: _searchController,
            decoration: customInputDecoration(
                suffixIcon: false,
                labelText: 'بحث',
                prefixIcon: null,
                context: context),
            onChanged: _filterCountries,
          ),
          const SizedBox(height: Insets.small),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCountries.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_filteredCountries[index]),
                  onTap: () {
                    widget.controller.text = _filteredCountries[index];
                    Navigator.of(context).pop(_filteredCountries[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
