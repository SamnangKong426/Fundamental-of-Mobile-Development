import '../model/reservation/table_reservation.dart';
import '../repository/reservation_repository.dart';

class ReservationService {
  final List<TableReservation> _reservations = [];
  final ReservationRepository _reservationRepository = ReservationRepository();

  ReservationService() {
    _reservations.addAll(_reservationRepository.loadReservations());
  }

  void createReservation(TableReservation reservation) {
    if (_checkAvailability(reservation)) {
      for (int i = 0; i < _reservations.length; i++) {
        if (_reservations[i].tableNumber == reservation.tableNumber) {
          _reservations[i].customer = reservation.customer;
          _reservations[i].reservationDate = reservation.reservationDate;
          _reservations[i].status = 'Reserved';
          _reservationRepository.saveReservations(_reservations);
          print(
              "Reservation made successfully for ${reservation.customer} on ${reservation.reservationDate} at table ${reservation.tableNumber}.");
          print("Table reserved successfully.");
          return;
        }
      }
      _reservations.clear();
      _reservations.addAll(_reservationRepository.loadReservations());
    }
  }

  void showAvailableReservations() {
    print("Available Reservations:");
    var availableTables = [];
    for (var r in _reservations) {
      if (r.status == 'Available') {
        availableTables.add(r.tableNumber);
      }
    }
    print("Tables: $availableTables");
  }

  List<TableReservation> getReservations() {
    return _reservations;
  }

  bool _checkAvailability(TableReservation reservation) {
    // Check if the table is available and conflicts with other reservations
    for (var r in _reservations) {
      if (reservation.tableNumber == r.tableNumber &&
          reservation.reservationDate == r.reservationDate) {
        print("Table is not available for the selected date and time.");
        return false;
      }
    }
    return true;
  }
}
