import 'package:app/common_lib.dart';
import 'package:app/utils/components/decoration/input_decoration.dart';
import 'package:flutter/material.dart';

class CustomApiItemSelectTwo extends ConsumerWidget {
  const CustomApiItemSelectTwo({
    super.key,
    required this.labelText,
    required this.fetchItems,
    this.validator,
    required this.controller,
    required this.govId,
    this.onSelect,
    this.prefixIcon,
    this.suffixIcon = true,
    this.onChange,
    this.enabled = true,
  });

  final String labelText;
  final dynamic validator;
  final TextEditingController controller;
  final String govId;
  final Future<List<dynamic>> Function(
      WidgetRef ref, String? govId, String? name) fetchItems;
  final String? prefixIcon;
  final Function(dynamic)? onSelect;
  final bool suffixIcon;
  final Function(String? name)? onChange;
  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      onChanged: enabled ? onSelect : null,
      onTap: enabled
          ? () async {
              dynamic result = await showModalBottomSheet(
                isScrollControlled: true,
                enableDrag: true,
                context: context,
                builder: (context) => SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ShowSelectionBottomSheet(
                    fetchItems: fetchItems,
                    controller: controller,
                    onChange: onChange,
                    ref: ref,
                    govId: govId,
                  ),
                ),
              );
              if (onSelect != null) {
                onSelect!(result);
              }
            }
          : null,
      enabled: enabled,
    );
  }
}

class ShowSelectionBottomSheet extends StatefulWidget {
  const ShowSelectionBottomSheet({
    super.key,
    required this.fetchItems,
    required this.controller,
    this.onChange,
    required this.ref,
    required this.govId,
  });

  final Future<List<dynamic>> Function(
      WidgetRef ref, String? govId, String? name) fetchItems;
  final TextEditingController controller;
  final ValueChanged<String>? onChange;
  final WidgetRef ref;
  final String govId;
  @override
  createState() => _ShowSelectionBottomSheetState();
}

class _ShowSelectionBottomSheetState extends State<ShowSelectionBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _filteredItems = [];
  Future<List<dynamic>>? _itemsFuture;

  @override
  void initState() {
    _itemsFuture = widget.fetchItems(widget.ref, widget.govId, '');
    super.initState();
    _searchController.addListener(() {
      _filterItems(_searchController.text);
    });
  }

  void _filterItems(String query) {
    //remove all whitespace characters from the query cuz why not :}
    query = query.replaceAll(RegExp(r'\s+'), '');

    if (query.isEmpty) {
      setState(() {
        _filteredItems = [];
        _itemsFuture = null;
      });
    } else {
      setState(() {
        _itemsFuture =
            widget.fetchItems(widget.ref, widget.govId, query.toUpperCase());
      });
    }

    if (widget.onChange != null) {
      widget.onChange!(query);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.mediumAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(Insets.medium),
          const SizedBox(height: Insets.small),
          TextField(
            controller: _searchController,
            decoration: customInputDecoration(
                suffixIcon: false,
                labelText: 'بحث',
                prefixIcon: null,
                context: context),
          ),
          FutureBuilder<List<dynamic>>(
            future: _itemsFuture,
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
                    child: const Center(child: Text('لا توجد عناصر')));
              } else {
                _filteredItems = snapshot.data!;
                double height = 600;
                if (snapshot.data!.length <= 4) {
                  height = 300;
                } else if (snapshot.data!.length <= 8 &&
                    snapshot.data!.length >= 4) {
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
                  child: ListView.builder(
                    itemCount: _filteredItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: Insets.noneAll,
                        title: Text(_filteredItems[index]?.name ?? ''),
                        onTap: () {
                          widget.controller.text = _filteredItems[index].name;
                          Navigator.of(context).pop(_filteredItems[index]);
                        },
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
