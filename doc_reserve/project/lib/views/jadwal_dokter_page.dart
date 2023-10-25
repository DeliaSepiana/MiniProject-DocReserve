import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JadwalDokterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 238, 192, 198),
                    Color.fromARGB(255, 121, 235, 255),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                automaticallyImplyLeading: true,
                centerTitle: true,
                title: Text(
                  "Jadwal Dokter",
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: const Color.fromARGB(255, 29, 116, 92),
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              Expanded(
                child: Padding(
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
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/Reserve.jpg"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Selamat datang di",
                                    style: GoogleFonts.spaceGrotesk(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: const Color.fromARGB(
                                          255, 29, 116, 92),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Doc's Reserve Dental Clinic",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color:
                                        const Color.fromARGB(255, 29, 116, 92),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
