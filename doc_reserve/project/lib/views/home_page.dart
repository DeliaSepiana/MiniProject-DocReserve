import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/custom_appbar.dart';
import 'package:project/viewmodels/home_viewmodel.dart';
import 'package:project/views/reservation_page.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel = HomeViewModel();

  HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 70,
                    // decoration: const BoxDecoration(
                    //   image: DecorationImage(
                    //     image:
                    //         AssetImage("assets/images/Reserve.jpg"),
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
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
                              "Pengalaman: 10 tahun",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman "schedule" dengan pushNamed
                      Navigator.pushNamed(context, '/schedule');
                    },
                    child: Column(
                      children: [
                        Card(
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
                                  color: const Color.fromARGB(255, 29, 116, 92),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman "Reservation" di sini
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReservationPage(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Card(
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
                                  color: const Color.fromARGB(255, 29, 116, 92),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
