// class ScheduleList {
//   final String avatar;
//   final String day;
//   final String datetime;
//   final String id;

//   ScheduleList({
//     required this.avatar,
//     required this.day,
//     required this.datetime,
//     required this.id,
//   });

//   factory ScheduleList.fromJson(Map<String, dynamic> json) {
//     return ScheduleList(
//       avatar: json['avatar'],
//       day: json['day'],
//       datetime: json['datetime'],
//       id: json['id'],
//     );
//   }

//   static List<ScheduleList> fromJsonList(List<dynamic> jsonList) {
//     List<ScheduleList> schedules = [];
//     for (var json in jsonList) {
//       schedules.add(ScheduleList.fromJson(json));
//     }
//     return schedules;
//   }
// }
