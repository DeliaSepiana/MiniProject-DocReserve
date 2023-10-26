import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/custom_appbar.dart';
import 'package:project/viewmodels/schedule_list_viewmodel.dart';

class ScheduleListPage extends StatefulWidget {
  const ScheduleListPage({Key? key}) : super(key: key);

  @override
  State<ScheduleListPage> createState() => _ScheduleListPageState();
}

class _ScheduleListPageState extends State<ScheduleListPage> {
  List<ScheduleList> scheduleItems = [
    ScheduleList(day: "Sunday - Day Off", isDayOff: true),
    ScheduleList(day: "Monday"),
    ScheduleList(day: "Tuesday"),
    ScheduleList(day: "Wednesday"),
    ScheduleList(day: "Thursday"),
    ScheduleList(day: "Friday - Day Off", isDayOff: true),
    ScheduleList(day: "Saturday"),
  ];

  List<Color> avatarColors = [
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.purple,
    Colors.teal,
    Colors.indigo,
  ];

  void showReserveDialog(String day) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String message;
        String title;

        final selectedDay = scheduleItems.firstWhere((item) => item.day == day);

        if (selectedDay.isDayOff) {
          title = "Day Off";
          message = "Hari ini adalah hari libur";
        } else {
          title = "Reservasi";
          message = "Anda akan melakukan reservasi untuk hari $day";
        }

        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal"),
            ),
            if (title == "Reservasi")
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/reservation');
                },
                child: const Text("Reservasi"),
              )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBarBody(
      title: "Jadwal Dokter",
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 10),
                    child: Container(
                      height: 50,
                      width: 70,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/doctor.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Jadwal Praktek Dokter",
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: const Color.fromARGB(255, 29, 116, 92),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Dental Clinic",
                        style: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: const Color.fromARGB(255, 29, 116, 92),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: scheduleItems.length,
                  itemBuilder: (context, index) {
                    final day = scheduleItems[index];

                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: avatarColors[
                                          index % avatarColors.length],
                                      child: Text(day.day[0]),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          day.day,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                if (!day.isDayOff)
                                  ElevatedButton(
                                    onPressed: () {
                                      showReserveDialog(day.day);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),
                                    child: const Text("Reservasi"),
                                  ),
                                if (day.isDayOff)
                                  const Text(
                                    "Day Off",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
