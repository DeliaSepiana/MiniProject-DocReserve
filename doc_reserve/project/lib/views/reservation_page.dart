import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:project/models/reservation.dart';
import 'package:project/utils/history_shared_preferences-utils.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  List<ReservationData> reservations = [];
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _formSubmitted = false;
  String _nameValidationError = '';
  String _descriptionValidationError = '';
  String _dateValidationError = '';
  String _timeValidationError = '';

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
    final historySharedPreferencesUtils = HistorySharedPreferencesUtils();
    final existingReservations =
        await historySharedPreferencesUtils.getReservations();

    setState(() {
      _nameValidationError = '';
      _descriptionValidationError = '';
      _dateValidationError = ''; // Inisialisasi pesan validasi tanggal
      _timeValidationError = ''; // Inisialisasi pesan validasi waktu
    });

    if (_nameController.text.isEmpty) {
      setState(() {
        _nameValidationError = 'Nama tidak boleh kosong';
      });
    }

    if (_descriptionController.text.isEmpty) {
      setState(() {
        _descriptionValidationError = 'Deskripsi tidak boleh kosong';
      });
    }

    // Validasi tanggal
    if (_selectedDate.isBefore(DateTime.now())) {
      setState(() {
        _dateValidationError = 'Tanggal tidak boleh sebelum hari ini';
      });
    }

    // Validasi waktu
    if (_selectedDate.isBefore(DateTime.now()) ||
        (_selectedDate.isAtSameMomentAs(DateTime.now()) &&
            (_selectedTime.hour < TimeOfDay.now().hour ||
                (_selectedTime.hour == TimeOfDay.now().hour &&
                    _selectedTime.minute <= TimeOfDay.now().minute)))) {
      setState(() {
        _timeValidationError = 'Waktu tidak boleh sebelum waktu saat ini';
      });
    }

    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _dateValidationError
            .isNotEmpty || // Periksa apakah ada pesan validasi tanggal
        _timeValidationError.isNotEmpty) {
      // Periksa apakah ada pesan validasi waktu
      return; // Prevent form submission if validation fails.
    }

    // Create a new reservation and add it to the list.
    final newReservation = ReservationData(
      name: _nameController.text,
      date: _selectedDate,
      time: _selectedTime,
      description: _descriptionController.text,
    );

    setState(() {
      _formSubmitted = true;
      reservations.add(newReservation);
    });

    existingReservations.add(newReservation);
    await historySharedPreferencesUtils.saveReservations(existingReservations);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: Text('Success'),
          content: Text('Form submitted successfully!'),
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
                            LineIcons.arrowCircleLeft,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Reservations',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Lottie.network(
                                    'https://lottie.host/8fa3c648-163a-49d2-981e-5ed194e64e12/mnKVtijzqy.json'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Submit Form Di Bawah ini',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'jangan ragu ceritakan keluhan anda',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {
                                  // Aksi yang akan dijalankan saat CategoryCard diklik
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReservationPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[200],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child:
                                      Center(child: Text('Konsultasi Gratis')),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: "Nama",
                                hintText: "Masukkan Nama Anda",
                                border: InputBorder.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        _nameValidationError,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: ListTile(
                          title: Text("Tanggal",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${_selectedDate.toLocal()}'),
                          trailing: Icon(
                            LineIcons.calendar,
                            color: Colors.blue,
                          ),
                          onTap: () => _selectDate(),
                        ),
                      ),
                      Text(
                        _dateValidationError,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: ListTile(
                          title: Text("Waktu",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(_selectedTime.format(context)),
                          trailing: Icon(
                            LineIcons.clock,
                            color: Colors.blue,
                          ),
                          onTap: () => _selectTime(),
                        ),
                      ),
                      Text(
                        _timeValidationError,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _descriptionController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                labelText: "Keluhan Penyakit",
                                hintText: "Deskripsikan keluhan penyakit Anda",
                                border: InputBorder.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        _descriptionValidationError,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      child: CupertinoButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              CupertinoIcons.paperplane_fill,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Submit',
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          _submitForm();
                        },
                      ),
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
