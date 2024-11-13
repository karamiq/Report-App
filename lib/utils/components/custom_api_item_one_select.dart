import 'package:flutter/material.dart';

import '../../common_lib.dart';
import 'decoration/input_decoration.dart';

class CustomApiItemSelectOne extends StatelessWidget {
  const CustomApiItemSelectOne({
    super.key,
    required this.labelText,
    required this.controller,
    required this.itemListFuture,
    required this.validator,
    this.onSelect,
    this.prefixIcon,
  });

  final String labelText;
  final dynamic validator;
  final TextEditingController controller;
  final Future<List<dynamic>> itemListFuture;
  final String? prefixIcon;
  final Function(dynamic)? onSelect;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: customInputDecoration(
          labelText: labelText, prefixIcon: prefixIcon, context: context),
      controller: controller,
      validator: validator,
      onChanged: onSelect,
      onTap: () async {
        dynamic result = await showModalBottomSheet(
          isScrollControlled: true,
          enableDrag: true,
          context: context,
          builder: (context) => SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: showSelectionBottomSheet(
              itemListFuture: itemListFuture,
              controller: controller,
            ),
          ),
        );
        if (onSelect != null) {
          onSelect!(result);
        }
      },
    );
  }
}

class showSelectionBottomSheet extends StatefulWidget {
  const showSelectionBottomSheet(
      {super.key, required this.itemListFuture, required this.controller});

  final Future<List<dynamic>> itemListFuture;
  final TextEditingController controller;

  @override
  createState() => _showSelectionBottomSheetState();
}

class _showSelectionBottomSheetState extends State<showSelectionBottomSheet> {
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
          return Container(
              height: 400,
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Container(
              height: 400,
              alignment: Alignment.center,
              child: const Text('لا توجد عناصر'));
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
                const Gap(Insets.medium),
                TextField(
                  controller: _searchController,
                  decoration: customInputDecoration(
                      labelText: 'بحث', prefixIcon: null, context: context),
                  onChanged: _filterCountries,
                ),
                const SizedBox(height: Insets.small),
                Expanded(
                  child: _filteredCountries.isNotEmpty
                      ? ListView.builder(
                          itemCount: _filteredCountries.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(_filteredCountries[index].name),
                              onTap: () {
                                widget.controller.text =
                                    _filteredCountries[index].name;
                                Navigator.of(context)
                                    .pop(_filteredCountries[index]);
                              },
                            );
                          },
                        )
                      : Container(
                          height: 400,
                          alignment: Alignment.center,
                          child: const Text('لا توجد عناصر')),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
