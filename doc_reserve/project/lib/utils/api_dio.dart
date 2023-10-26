// import 'package:dio/dio.dart';
// import 'package:project/models/schedule_list.dart';

// void main() {
//   deserialisasi();
// }

// Future<void> deserialisasi() async {
//   final dio = Dio();

//   try {
//     final response = await dio.get(
//       'https://651fca72906e276284c382db.mockapi.io/schedule',
//     );

//     if (response.statusCode == 200) {
//       List<dynamic> jsonData = response.data;

//       List<ScheduleList> schedules = ScheduleList.fromJsonList(jsonData);

//       for (var schedule in schedules) {
//         print('ID: ${schedule.id}');
//         print('Avatar: ${schedule.avatar}');
//         print('Day: ${schedule.day}');
//         print('Datetime: ${schedule.datetime}');
//       }
//     } else {
//       print('Gagal melakukan permintaan GET');
//       print('Kode status: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Terjadi kesalahan: $e');
//   }
// }
