import 'package:flutter/material.dart';
import 'package:project/custom_appbar.dart';
import 'package:project/models/reservation.dart';
import 'package:project/utils/history_shared_preferences-utils.dart';
import 'package:project/views/history_page.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  List<ReservationData> reservations = [];
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _formSubmitted = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _submitForm() async {
    // Ambil data reservasi yang sudah ada
    final historySharedPreferencesUtils = HistorySharedPreferencesUtils();
    final existingReservations =
        await historySharedPreferencesUtils.getReservations();

    // Buat data reservasi baru
    final newReservation = ReservationData(
      name: _nameController.text,
      date: _selectedDate,
      time: _selectedTime,
      description: _descriptionController.text,
    );

    // Tambahkan data reservasi baru ke data yang sudah ada
    setState(() {
      _formSubmitted = true;
      reservations.add(newReservation);
    });

    // Simpan data reservasi ke SharedPreferences
    existingReservations.add(newReservation);
    await historySharedPreferencesUtils.saveReservations(existingReservations);

    // Pindah ke halaman HistoryPage dengan data yang sudah diperbarui
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HistoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBarBody(
      title: "Reservation",
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Reservasi Disini',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                // Name Field with BoxDecoration
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Nama",
                      hintText: "Masukkan Nama Anda",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                  ),
                ),

                // Date Picker

                ListTile(
                  title: Text("Tanggal",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${_selectedDate.toLocal()}'.split(' ')[0]),
                  trailing: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(),
                  ),
                ),

                // Time Picker
                ListTile(
                  title: Text("Waktu",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(_selectedTime.format(context)),
                  trailing: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () => _selectTime(),
                  ),
                ),

                // Keluhan Penyakit Field with BoxDecoration
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Keluhan Penyakit",
                      hintText: "Deskripsikan keluhan penyakit Anda",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text('Submit'),
                  ),
                ),
                if (_formSubmitted)
                  Center(
                    child: Text(
                      'Form submitted successfully!',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
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
