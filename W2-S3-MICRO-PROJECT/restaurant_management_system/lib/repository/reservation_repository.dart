import 'dart:convert';
import 'dart:io';
import '../model/reservation/table_reservation.dart';

class ReservationRepository {
  final String filePath = "lib/repository/tablereservations/data.json";

  List<TableReservation> loadReservations() {
    final file = File(filePath);
    if (file.existsSync()) {
      var contents = file.readAsStringSync();
      List<dynamic> jsonData = jsonDecode(contents);
      return jsonData.map((data) => TableReservation.fromJson(data)).toList();
    }
    return [];
  }

  void saveReservations(List<TableReservation> reservations) {
    final file = File(filePath);
    List<Map<String, dynamic>> jsonList = reservations.map((reservation) => reservation.toJson()).toList();
    String jsonString = jsonEncode(jsonList);
    file.writeAsStringSync(jsonString);
  }
}