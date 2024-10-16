import 'package:flutter/material.dart';
import 'package:tickoyako/core/colors.dart';

class FilterBottomSheet extends StatefulWidget {
  final Map<String, dynamic> initialFilters;
  final Function(Map<String, dynamic>) onApplyFilters;

  const FilterBottomSheet({
    super.key,
    required this.initialFilters,
    required this.onApplyFilters,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late Map<String, dynamic> _filters;
  final List<String> _categories = [
    'Music',
    'Theatre',
    'Comedy',
    'Sports',
    'Arts'
  ];
  final List<String> _locations = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Miami',
    'Las Vegas'
  ];
  RangeValues _priceRange = const RangeValues(0, 1000);
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _filters = Map<String, dynamic>.from(widget.initialFilters);
    _priceRange = RangeValues(
      _filters['minPrice']?.toDouble() ?? 0,
      _filters['maxPrice']?.toDouble() ?? 1000,
    );
    _selectedDate = _filters['date'];
  }

@override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Colors.white
            .withOpacity(0.8), 
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Categories'),
                    _buildCategoryChips(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Price Range'),
                    _buildPriceRangeSlider(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Date'),
                    _buildDatePicker(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Location'),
                    _buildLocationDropdown(),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8), 
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Filters',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: _resetFilters,
            child: Text(
              'Reset',
              style: TextStyle(
                color: Colors.teal.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _categories.map((category) {
        final isSelected = (_filters['categories'] ?? []).contains(category);
        return FilterChip(
          label: Text(category),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              final categories =
                  List<String>.from(_filters['categories'] ?? []);
              if (selected) {
                categories.add(category);
              } else {
                categories.remove(category);
              }
              _filters['categories'] = categories;
            });
          },
          
          selectedColor: Colors.teal.shade100,
          checkmarkColor: Colors.teal.shade700,
        );
      }).toList(),
    );
  }

  Widget _buildPriceRangeSlider() {
    return Column(
      children: [
        RangeSlider(
          values: _priceRange,
          min: 0,
          max: 1000,
          divisions: 20,
          labels: RangeLabels(
            '\$${_priceRange.start.round()}',
            '\$${_priceRange.end.round()}',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _priceRange = values;
              _filters['minPrice'] = values.start.round();
              _filters['maxPrice'] = values.end.round();
            });
          },
          activeColor: Colors.teal.shade700,
          inactiveColor: Colors.teal.shade100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${_priceRange.start.round()}'),
            Text('\$${_priceRange.end.round()}'),
          ],
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return OutlinedButton.icon(
      onPressed: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: _selectedDate ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        if (date != null) {
          setState(() {
            _selectedDate = date;
            _filters['date'] = date;
          });
        }
      },
      icon: const Icon(Icons.calendar_today),
      label: Text(
        _selectedDate != null
            ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
            : 'Select Date',
      ),
    );
  }

  Widget _buildLocationDropdown() {
    return DropdownButtonFormField<String>(
      value: _filters['location'],
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      items: _locations.map((location) {
        return DropdownMenuItem(
          value: location,
          child: Text(location),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _filters['location'] = value;
        });
      },
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
         color: Colors.white.withOpacity(0.8), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pop(context), // Cancel action
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey), // OutlinedButton border effect
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  widget.onApplyFilters(_filters); // Apply filters action
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color:
                        Colors.teal.shade700, // ElevatedButton background color
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Apply',
                    style: TextStyle(color: AppColors.secondaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
  ),

    );
  }

  void _resetFilters() {
    setState(() {
      _filters = {};
      _priceRange = const RangeValues(0, 1000);
      _selectedDate = null;
    });
  }
}
