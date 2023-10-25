import 'package:flutter/material.dart';
import 'package:project/viewmodels/history_viewmodel.dart';
import 'package:project/views/home_page.dart'; // Import Home Page

class HistoryPage extends StatelessWidget {
  final HistoryViewModel viewModel = HistoryViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Riwayat Reservasi',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Kembali ke Home'),
              onPressed: () {
                // Menggunakan Navigator untuk berpindah ke halaman Home
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
              },
            ),
            ElevatedButton(
              child: Text('Kembali ke History'),
              onPressed: () {
                Navigator.of(context).pushNamed('/history');
              },
            )
          ],
        ),
      ),

      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: Color.fromARGB(255, 246, 249, 249),
      //     boxShadow: [
      //       BoxShadow(
      //         blurRadius: 20,
      //         color: Colors.black.withOpacity(0.1),
      //       )
      //     ],
      //   ),
      //   child: SafeArea(
      //     child: Padding(
      //       padding: EdgeInsets.all(12),
      //       child: GNav(
      //         iconSize: MediaQuery.of(context).size.width / 13,
      //         rippleColor: Color.fromARGB(0, 11, 11, 11),
      //         hoverColor: Colors.white,
      //         gap: 150,
      //         activeColor: Color.fromARGB(0, 246, 246, 247),
      //         padding: EdgeInsets.all(16),
      //         duration: Duration(milliseconds: 450),
      //         tabBackgroundColor: Color.fromARGB(0, 12, 12, 12),
      //         color: Color(0xff1d1c1c),
      //         tabs: [
      //           GButton(
      //             icon: Icons.history,
      //             text: 'History',
      //             textStyle: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               color: const Color.fromARGB(255, 11, 11, 11),
      //             ),
      //             padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
