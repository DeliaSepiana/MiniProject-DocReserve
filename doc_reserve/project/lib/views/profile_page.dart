import 'package:flutter/material.dart';
import 'package:project/utils/api_login.dart';

class ProfilePage extends StatelessWidget {
  final ApiLogin api = ApiLogin(); // Gantilah dengan kelas API yang sesuai

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.arrow_circle_left,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Profile User',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Docs Reservations',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/Avatar.jpg'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Delia Sepiana',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'delia@example.com',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditProfilePage(userId: '1')));
                        },
                        child: Text('Edit Profile'),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika logout di sini
                          // Misalnya, menghapus token atau data sesi pengguna
                          // Setelah logout berhasil, Anda dapat mengarahkan pengguna ke halaman login.
                          // Contoh logika:
                          // Gantilah dengan implementasi logout yang sesuai
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text('Logout'),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika untuk menghapus akun di sini
                          // Tampilkan dialog konfirmasi sebelum menghapus akun
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Delete Account'),
                                content: Text(
                                    'Are you sure you want to delete your account? This action cannot be undone.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Delete'),
                                    onPressed: () async {
                                      final deleted = await api.deleteUser(
                                          '1'); // Gantilah '1' dengan ID pengguna yang sesuai
                                      if (deleted) {
                                        // Akun berhasil dihapus, arahkan pengguna ke halaman login
                                        Navigator.pushReplacementNamed(
                                            context, '/login');
                                      } else {
                                        // Gagal menghapus akun, tampilkan pesan kesalahan jika diperlukan
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Error'),
                                              content: Text(
                                                  'Failed to delete your account.'),
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
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Delete Account'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String userId;

  EditProfilePage({required this.userId});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController newUsernameController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final ApiLogin api = ApiLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: newUsernameController,
              decoration: InputDecoration(labelText: 'New Username'),
            ),
            TextFormField(
              controller: newPasswordController,
              decoration: InputDecoration(labelText: 'New Password'),
            ),
            ElevatedButton(
              onPressed: () {
                final newUsername = newUsernameController.text;
                final newPassword = newPasswordController.text;

                api
                    .updateUser(widget.userId, newUsername, newPassword)
                    .then((success) {
                  if (success) {
                    // Pembaruan berhasil, kembali ke halaman profil
                    Navigator.pop(context);
                  } else {
                    // Pembaruan gagal, tampilkan pesan kesalahan kepada pengguna
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Failed to update user profile.'),
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
                });
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
