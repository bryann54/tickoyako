import 'package:flutter/material.dart';

class ShowFilter {
  final String name;
  final bool isSelected;

  ShowFilter({required this.name, this.isSelected = false});

  ShowFilter copyWith({String? name, bool? isSelected}) {
    return ShowFilter(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class FilterOptions {
  final List<ShowFilter> categories;
  final List<ShowFilter> dates;
  final RangeValues? priceRange;
  final bool onlyAvailable;

  FilterOptions({
    required this.categories,
    required this.dates,
    this.priceRange,
    this.onlyAvailable = false,
  });

  bool get hasActiveFilters =>
      categories.any((c) => c.isSelected) ||
      dates.any((d) => d.isSelected) ||
      priceRange != null ||
      onlyAvailable;

  FilterOptions copyWith({
    List<ShowFilter>? categories,
    List<ShowFilter>? dates,
    RangeValues? priceRange,
    bool? onlyAvailable,
  }) {
    return FilterOptions(
      categories: categories ?? this.categories,
      dates: dates ?? this.dates,
      priceRange: priceRange ?? this.priceRange,
      onlyAvailable: onlyAvailable ?? this.onlyAvailable,
    );
  }
}
