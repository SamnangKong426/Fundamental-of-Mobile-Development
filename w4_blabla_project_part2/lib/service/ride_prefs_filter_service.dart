enum SortOption { earliest_departure, price }

class FilterService {
  static final FilterService instance = FilterService._internal();

  FilterService._internal();

  bool _isPetsAllowed = false;
  SortOption _sortOption = SortOption.earliest_departure;

  void setCurrentFilter(bool isPetsAllowed, SortOption sortOption) {
    _isPetsAllowed = isPetsAllowed;
    _sortOption = sortOption;
    print(
      'FilterService: isPetsAllowed: $_isPetsAllowed, sortOption: $_sortOption',
    );
  }

  bool get isPetsAllowed => _isPetsAllowed;
  SortOption get sortOption => _sortOption;

  void resetFilters() {
    _isPetsAllowed = false;
    _sortOption = SortOption.earliest_departure;
  }
}
