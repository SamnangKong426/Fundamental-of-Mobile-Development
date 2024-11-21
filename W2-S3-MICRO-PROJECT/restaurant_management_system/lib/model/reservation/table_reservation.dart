class TableReservation {
  final int id;
  String customer;
  int tableNumber;
  DateTime reservationDate;
  String status;

  TableReservation({
    required this.id,
    required this.customer,
    required this.tableNumber,
    required this.reservationDate,
    this.status = 'Available',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer': customer,
      'tableNumber': tableNumber,
      'reservationDate': reservationDate.toIso8601String(),
      'status': status,
    };
  }

  factory TableReservation.fromJson(Map<String, dynamic> json) {
    return TableReservation(
      id: json['id'],
      customer: json['customer'],
      tableNumber: json['tableNumber'],
      reservationDate: DateTime.parse(json['reservationDate']),
      status: json['status'],
    );
  }

  @override
  String toString() {
    return 'TableReservation{id: $id, customer: $customer, tableNumber: $tableNumber, reservationDate: $reservationDate, status: $status}';
  }
}