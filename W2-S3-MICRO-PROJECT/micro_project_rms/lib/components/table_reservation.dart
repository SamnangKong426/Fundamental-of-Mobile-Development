class TableReservation {
  final int? reservation_d;
  final int? table_umber;
  final bool? availability;

  TableReservation({
    this.reservation_d,
    this.table_umber,
    this.availability,
  });

  void reserveTable() {
    print('Table $table_umber has been reserved');
  }

  bool checkAvailability() {
    if (availability == true) {
      print('Table $table_umber is available');
      return true;
    } else {
      print('Table $table_umber is not available');
      return false;
    }
  }

  void cancelReservation() {
    print('Table $table_umber reservation has been canceled');
  }
}
