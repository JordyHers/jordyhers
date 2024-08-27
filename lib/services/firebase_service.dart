import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class FirestoreService {
  FirestoreService._privateConstructor();
  static final FirestoreService _instance =
      FirestoreService._privateConstructor();

  factory FirestoreService() {
    return _instance;
  }

  final CollectionReference _appointmentsCollection =
      FirebaseFirestore.instance.collection('appointments');
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<bool> saveEmail(String email) async {
    bool result = false;
    try {
      await users.add({'email': email});
      print("User Added");
      result = true;
    } catch (e) {
      print("Failed to add user: $e");
      result = false;
    }
    return result;
  }

  Future<bool> saveAppointment(Appointment appointment) async {
    bool result = false;
    try {
      await _appointmentsCollection.add({
        'subject': appointment.subject,
        'startTime': appointment.startTime,
        'endTime': appointment.endTime,
        'color': appointment.color.value,
        'isAllDay': appointment.isAllDay,
      });
      print("Appointment Added");
      result = true;
    } catch (e) {
      print("Failed to add appointment: $e");
      result = false;
    }
    return result;
  }

  Future<List<Appointment>> getAppointments() async {
    List<Appointment> appointments = [];
    try {
      QuerySnapshot snapshot = await _appointmentsCollection.get();
      appointments = snapshot.docs.map((doc) {
        return Appointment(
          subject: doc['subject'],
          startTime: (doc['startTime'] as Timestamp).toDate(),
          endTime: (doc['endTime'] as Timestamp).toDate(),
          color: Color(doc['color']),
          isAllDay: doc['isAllDay'],
        );
      }).toList();
    } catch (e) {
      print("Failed to fetch appointments: $e");
    }
    return appointments;
  }

  CalendarDataSource getCalendarDataSource() {
    return AppointmentDataSource([]);
  }

  Future<CalendarDataSource> fetchAppointmentsForCalendar() async {
    List<Appointment> appointments = await getAppointments();
    return AppointmentDataSource(appointments);
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments![index].subject;
  }

  @override
  Color getColor(int index) {
    return appointments![index].color;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
