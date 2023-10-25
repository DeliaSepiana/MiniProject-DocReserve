import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 168, 242, 255),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Logo.png',
                width: 200, // Sesuaikan dengan lebar logo yang diinginkan
              ),
              SizedBox(
                  height: 40), // Penambahan ruang antara logo dan input fields
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 192, 198),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Username',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 16,
                        color: Color.fromARGB(255, 29, 116, 92),
                      ),
                    ),
                    TextField(
                      onChanged: viewModel.setUsername,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(
                                  255, 29, 116, 92)), // Warna border saat fokus
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Password',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 16,
                        color: Color.fromARGB(255, 29, 116, 92),
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      onChanged: viewModel.setPassword,
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(
                                255, 29, 116, 92), // Warna border saat fokus
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _isObscured
                                ? Colors
                                    .grey // Warna ikon saat teks tersembunyi
                                : const Color.fromARGB(255, 29, 116,
                                    92), // Warna ikon saat teks terlihat
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Text(
                        'Please insert your username and password.',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 12,
                          color: Color.fromARGB(255, 29, 116, 92),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double
                          .infinity, // Mengisi lebar Container sepanjang parent
                      child: ElevatedButton.icon(
                        onPressed: viewModel.isValid()
                            ? () async {
                                bool isLoggedIn = await viewModel.login();
                                if (isLoggedIn) {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Login Failed',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 116, 92),
                                            fontSize: 20,
                                          ),
                                        ),
                                        content: Text(
                                          'Invalid username or password. Please try again.',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text(
                                              'OK',
                                              style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 29, 116, 92),
                                                fontSize: 18,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
                            : null,
                        icon: Icon(Icons.person),
                        label: Text(
                          'Login',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(
                              255, 29, 116, 92), // Warna tombol
                          onPrimary: Colors.white, // Warna teks tombol
                          elevation: 5, // Ketebalan bayangan saat ditekan
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Mengatur sudut tombol
                          ),
                          shadowColor: Colors.black, // Warna bayangan tombol
                          padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30), // Padding dalam tombol
                          tapTargetSize: MaterialTapTargetSize
                              .padded, // Area tap target yang lebih besar
                          animationDuration: Duration(
                              milliseconds:
                                  200), // Durasi animasi ketika tombol ditekan
                          textStyle: TextStyle(fontSize: 16), // Border tombol
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
