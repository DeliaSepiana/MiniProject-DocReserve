import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/viewmodels/home_viewmodel.dart';
import 'package:project/views/Jadwal_dokter_page.dart';
import 'package:project/views/reservasion_page.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel = HomeViewModel();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text(
                  "Doc's Reserve",
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
                            Container(
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
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Selamat datang di",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color:
                                        const Color.fromARGB(255, 29, 116, 92),
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
                        Divider(),
                        SizedBox(height: 16),
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
                                child: Container(
                                  height: 200,
                                  child: Image.asset(
                                    "assets/images/Doctor.png",
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                              ),
                              SizedBox(width: 4),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "drg. Anindya Masitta",
                                    style: GoogleFonts.spaceGrotesk(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: const Color.fromARGB(
                                          255, 29, 116, 92),
                                      textStyle: TextStyle(height: 4),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.child_care,
                                        color:
                                            Color.fromARGB(255, 115, 117, 115),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Spesialis Gigi Anak",
                                        style: GoogleFonts.spaceGrotesk(
                                          fontSize: 15,
                                          color: const Color.fromARGB(
                                              255, 29, 116, 92),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.local_hospital,
                                        color:
                                            Color.fromARGB(255, 115, 117, 115),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Pengalaman: 10 tahun",
                                        style: GoogleFonts.spaceGrotesk(
                                          fontSize: 15,
                                          color: const Color.fromARGB(
                                              255, 29, 116, 92),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color:
                                            Color.fromARGB(255, 115, 117, 115),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Jl. Pahlawan No. 123, Kota Bahagia",
                                        style: GoogleFonts.spaceGrotesk(
                                          fontSize: 15,
                                          color: const Color.fromARGB(
                                              255, 29, 116, 92),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigasi ke halaman "Jadwal Dokter" di sini
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JadwalDokterPage(),
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
                                          "assets/images/Jadwal.jpg",
                                          height: 150,
                                          width: 150,
                                        ),
                                        Text(
                                          "Jadwal Dokter",
                                          style: GoogleFonts.spaceGrotesk(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 29, 116, 92),
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
                                            color: const Color.fromARGB(
                                                255, 29, 116, 92),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}





    // bottomNavigationBar: BottomNavBar(),
    // bottomNavigationBar: Container(
    //     decoration: BoxDecoration(
    //         color: Color.fromARGB(255, 253, 254, 254),
    //         boxShadow: [
    //           BoxShadow(
    //             blurRadius: 20,
    //             color: Colors.black.withOpacity(0.1),
    //           )
    //         ]),
    //     child: SafeArea(
    //         child: Padding(
    //             padding: EdgeInsets.all(12),
    //             child: GNav(
    //                 iconSize: MediaQuery.of(context).size.width / 13,
    //                 rippleColor: Color.fromARGB(0, 11, 11, 11),
    //                 hoverColor: const Color.fromARGB(255, 11, 11, 11),
    //                 gap: 150,
    //                 activeColor: Color.fromARGB(0, 246, 246, 247),
    //                 padding: EdgeInsets.all(16),
    //                 duration: Duration(milliseconds: 450),
    //                 tabBackgroundColor: Color.fromARGB(0, 12, 12, 12),
    //                 color: Color(0xff1d1c1c),
    //                 tabs: [
    //                   GButton(
    //                     icon: Icons.home,
    //                     text: 'Home',
    //                     textStyle: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: const Color.fromARGB(255, 11, 11, 11)),
    //                     padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
    //                   ),
    //                 ]))))

    //   bottomNavigationBar: BottomNav(
    //     currentIndex: _currentIndex, // Kirim indeks terpilih ke BottomNav
    //     onTabTapped: (int index) {
    //       setState(() {
    //         _currentIndex = index; // Update indeks sesuai yang dipilih
    //       });

    //       // Implementasi logika navigasi berdasarkan indeks disini
    //       if (index == 0) {
    //         // Tambahkan logika untuk berpindah ke halaman beranda
    //       } else if (index == 1) {
    //         // Tambahkan logika untuk berpindah ke halaman sejarah
    //       }
    //     },
    //   ),
    // );
    // bottomNavigationBar: BottomNavigationBar(
    //   currentIndex: _currentIndex,
    //   onTap: (int index) {
    //     setState(() {
    //       _currentIndex = index;
    //       // Handle navigation to different pages based on the selected tab.
    //       if (index == 0) {
    //         // Navigate to the Home tab (if you have a Home page).
    //       } else if (index == 1) {
    //         // Navigate to the History tab (if you have a History page).
    //         widget.viewModel.goToHistoryPage(context);
    //       }
    //     });
    //   },
    //   type: BottomNavigationBarType
    //       .fixed, // Tetap tampilkan semua ikon bahkan jika lebih dari 3 tab
    //   showSelectedLabels: false, // Sembunyikan label tab terpilih
    //   showUnselectedLabels: false, // Sembunyikan label tab tidak terpilih
    //   backgroundColor: Colors.white, // Warna latar belakang
    //   elevation: 0, // Hilangkan efek bayangan
    //   items: [
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.home,
    //         size: 30, // Ubah ukuran ikon
    //         color: _currentIndex == 0
    //             ? Colors.black
    //             : Colors
    //                 .grey, // Ganti warna ikon sesuai dengan indeks terpilih
    //       ),
    //       label: 'Home',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.history_outlined,
    //         size: 30, // Ubah ukuran ikon
    //         color: _currentIndex == 4
    //             ? Colors.black
    //             : Colors
    //                 .grey, // Ganti warna ikon sesuai dengan indeks terpilih
    //       ),
    //       label: 'History',
    //     ),
    //   ],
    // ),