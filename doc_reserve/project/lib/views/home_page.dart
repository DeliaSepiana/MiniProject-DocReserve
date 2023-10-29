import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/custom_appbar.dart';
import 'package:project/viewmodels/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel = HomeViewModel();

  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomAppBarBody(
      title: "Doc's Reserve",
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 70,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Selamat datang di",
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: const Color.fromARGB(255, 29, 116, 92),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Doc's Reserve Dental Clinic",
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
                const Divider(),
                const SizedBox(height: 16),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 200,
                          child: Image.asset(
                            "assets/images/Doctor.png",
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "drg. Anindya Masitta",
                            style: GoogleFonts.spaceGrotesk(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: const Color.fromARGB(255, 29, 116, 92),
                              textStyle: const TextStyle(height: 4),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(
                                Icons.child_care,
                                color: Color.fromARGB(255, 115, 117, 115),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Spesialis Gigi Anak",
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 29, 116, 92),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(
                                Icons.local_hospital,
                                color: Color.fromARGB(255, 115, 117, 115),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Pengalaman: 101 tahun",
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 29, 116, 92),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color.fromARGB(255, 115, 117, 115),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Jl. Pahlawan No. 123, Kota Bahagia",
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 29, 116, 92),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    Widget cardContents;
                    switch (index) {
                      case 0:
                        cardContents = GestureDetector(
                          onTap: () {
                            // Navigasi ke halaman "schedule" dengan pushNamed
                            Navigator.pushNamed(context, '/schedule');
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/Jadwal.jpg",
                                  height: 150,
                                  width: 150,
                                ),
                                Text(
                                  "Jadwal Dokter",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 15,
                                    color:
                                        const Color.fromARGB(255, 29, 116, 92),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                        break;
                      case 1:
                        cardContents = GestureDetector(
                          onTap: () {
                            // Navigasi ke halaman "reservation" dengan pushNamed
                            Navigator.pushNamed(context, '/reservation');
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/Janji.jpg",
                                  height: 150,
                                  width: 150,
                                ),
                                Text(
                                  "Reservation",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 15,
                                    color:
                                        const Color.fromARGB(255, 29, 116, 92),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                        break;
                      case 2:
                        cardContents = GestureDetector(
                          onTap: () {
                            // Navigasi ke halaman "chatmassege" dengan pushNamed
                            Navigator.pushNamed(context, '/chatmessage');
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/Chatbot.jpg",
                                  height: 150,
                                  width: 150,
                                ),
                                Text(
                                  "Chat Massege",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 15,
                                    color:
                                        const Color.fromARGB(255, 29, 116, 92),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                        break;
                      default:
                        cardContents = Container(); // Default empty container
                    }
                    return cardContents;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
