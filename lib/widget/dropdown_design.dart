import 'package:flutter/material.dart';

class StateDropdown extends StatefulWidget {
  final List<Map<String, dynamic>> items; // List of items with id and name
  final List<int> defaultSelectedIds; // New parameter for default selected IDs
  final Function(List<int>) onSelectionChanged; // Callback for selection change

  const StateDropdown({
    Key? key,
    required this.items,
    required this.defaultSelectedIds,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _StateDropdownState createState() => _StateDropdownState();
}

class _StateDropdownState extends State<StateDropdown> {
  late List<int> selectedIds; // Change to late initialization
  bool dropdownOpen = false;

  @override
  void initState() {
    super.initState();
    // Initialize selectedIds with the default selected IDs
    selectedIds = List.from(widget.defaultSelectedIds);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              dropdownOpen = !dropdownOpen;
            });
          },
          child: Container(
            width: 200,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Wrap(
              spacing: 8.0,
              children: selectedIds.isEmpty
                  ? [const Text("Select items...")]
                  : selectedIds
                      .map((id) => Chip(
                            label: Text(widget.items.firstWhere(
                                (item) => item['id'] == id)['name']),
                            backgroundColor: Colors.blue.withOpacity(0.5),
                            deleteIcon: const Icon(Icons.close),
                            onDeleted: () {
                              setState(() {
                                selectedIds.remove(id);
                                widget.onSelectionChanged(selectedIds);
                              });
                            },
                          ))
                      .toList(),
            ),
          ),
        ),
        if (dropdownOpen)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Column(
                  children: widget.items.map((item) {
                    final int itemId = item['id'] is int
                        ? item['id']
                        : int.tryParse(item['id'].toString()) ?? 0;
                    final isSelected = selectedIds.contains(itemId);

                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedIds.remove(itemId);
                          } else {
                            selectedIds.add(itemId);
                          }
                          widget.onSelectionChanged(selectedIds);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        color: isSelected
                            ? Colors.blue.withOpacity(0.3)
                            : Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item['name']),
                            if (isSelected) const Icon(Icons.check),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
