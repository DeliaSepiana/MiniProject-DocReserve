import 'package:flutter/material.dart';
import 'package:project/utils/api_login.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscured = true;
  bool isSignUpView = false;

  String _usernameError = '';
  String _passwordError = '';

  final _formKey = GlobalKey<
      FormState>(); // Tambahkan GlobalKey<FormState> untuk validasi form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey, // Tambahkan GlobalKey<FormState> di sini
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue, // Warna biru untuk garis
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors
                                  .blue, // Warna biru untuk garis saat terjadi kesalahan
                            ),
                          ),
                          errorText:
                              _usernameError, // Tambahkan errorText di sini
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _isObscured,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue, // Warna biru untuk garis
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors
                                  .blue, // Warna biru untuk garis saat terjadi kesalahan
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _isObscured ? Colors.grey : Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                          ),
                          errorText:
                              _passwordError, // Tambahkan errorText di sini
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            final username = usernameController.text;
                            final password = passwordController.text;

                            if (isSignUpView) {
                              signUp(context, username, password);
                            } else {
                              login(username, password);
                            }
                          },
                          icon: Icon(Icons.person),
                          label: Text(
                            isSignUpView ? 'Sign Up' : 'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadowColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30,
                            ),
                            tapTargetSize: MaterialTapTargetSize.padded,
                            animationDuration: Duration(milliseconds: 200),
                            textStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isSignUpView = !isSignUpView;
                          });
                        },
                        child: Text(
                          isSignUpView
                              ? 'Sudah punya akun? Login'
                              : 'Belum punya akun? Sign up',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(String username, String password) async {
    final api = ApiLogin();

    String usernameError = '';
    String passwordError = '';

    if (username.isEmpty) {
      usernameError = 'Username tidak boleh kosong';
    }
    // Tambahkan validasi format username jika diperlukan

    if (password.isEmpty) {
      passwordError = 'Password tidak boleh kosong';
    }
    // Tambahkan validasi format password jika diperlukan

    setState(() {
      _usernameError = usernameError;
      _passwordError = passwordError;
    });

    if (_formKey.currentState?.validate() ?? false) {
      // Validasi form sebelum melanjutkan
      try {
        final isInputValid = await api.inputCheck(username, password);

        if (isInputValid) {
          Navigator.pushReplacementNamed(context, '/');
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Login Gagal'),
                content:
                    Text('Username atau password salah. Silakan coba lagi.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      } catch (error) {
        print('Terjadi kesalahan saat melakukan login: $error');
        // Tambahkan penanganan kesalahan sesuai kebutuhan
      }
    }
  }

  Future<void> signUp(
      BuildContext context, String username, String password) async {
    final api = ApiLogin();
    String usernameError = '';
    String passwordError = '';

    if (username.isEmpty) {
      usernameError = 'Username tidak boleh kosong';
    }
    // Tambahkan validasi format username jika diperlukan

    if (password.isEmpty) {
      passwordError = 'Password tidak boleh kosong';
    }
    // Tambahkan validasi format password jika diperlukan

    setState(() {
      _usernameError = usernameError;
      _passwordError = passwordError;
    });

    if (_formKey.currentState?.validate() ?? false) {
      // Validasi form sebelum melanjutkan
      final isSuccess = await api.createUser(username, password);

      if (isSuccess) {
        // User registration was successful
        // Anda dapat menambahkan logika tambahan di sini jika diperlukan
        Navigator.pushReplacementNamed(context, '/');
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Sign Up Failed'),
              content: Text(
                  'Failed to create a new user account. Please try again.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }
}
