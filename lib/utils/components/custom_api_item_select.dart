import 'package:app/common_lib.dart';
import 'package:app/utils/components/decoration/input_decoration.dart';
import 'package:flutter/material.dart';

class CustomApiItemSelect extends StatelessWidget {
  const CustomApiItemSelect({
    super.key,
    required this.labelText,
    required this.itemListFuture,
    required this.validator,
    required this.controller,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon = true,
  });

  final String labelText;
  final dynamic validator;
  final TextEditingController controller;
  final Future<List<dynamic>> itemListFuture;
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
              itemListFuture: itemListFuture,
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
      {super.key, required this.itemListFuture, required this.controller});

  final Future<List<dynamic>> itemListFuture;
  final TextEditingController controller;

  @override
  createState() => _ShowSelectionBottomSheetState();
}

class _ShowSelectionBottomSheetState extends State<ShowSelectionBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _filteredCountries = [];
  List<dynamic> _originalList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterCountries(_searchController.text);
    });
  }

  void _filterCountries(String query) {
    setState(() {
      _filteredCountries = _originalList
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()))
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
    return FutureBuilder<List<dynamic>>(
      future: widget.itemListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: const Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: const Center(child: Text('No items available')));
        } else {
          if (_originalList.isEmpty) {
            _originalList = snapshot.data!;
            _filteredCountries = _originalList;
          }
          double height = 600;
          if (_originalList.length <= 4) {
            height = 300;
          } else if (_originalList.length <= 8 && _originalList.length >= 4) {
            height = 450;
          } else {
            height = 500;
          }

          return Container(
            height: height,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(BorderSize.medium))),
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
                        title: Text(_filteredCountries[index]?.name),
                        onTap: () {
                          widget.controller.text =
                              _filteredCountries[index].name;
                          print(widget.controller.text);
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
      },
    );
  }
}
