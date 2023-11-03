import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/models/reservation.dart';
import 'package:project/utils/history_shared_preferences-utils.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<ReservationData> reservations = [];
  bool _dataLoaded = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController descriptionController = TextEditingController();
  String _nameValidationError = '';
  String _dateValidationError = '';
  String _timeValidationError = '';
  String _descriptionValidationError = '';

  @override
  void initState() {
    super.initState();
    _loadReservations();
  }

  Future<void> _loadReservations() async {
    final historySharedPreferencesUtils = HistorySharedPreferencesUtils();

    final loadedReservations =
        await historySharedPreferencesUtils.getReservations();

    setState(() {
      reservations = loadedReservations;
      _dataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'History',
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Divider(),
              const SizedBox(height: 16),
              _dataLoaded
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ListView.builder(
                          itemCount: reservations.length,
                          itemBuilder: (context, index) {
                            final reservation = reservations[index];
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              transform: _dataLoaded
                                  ? Matrix4.translationValues(0, 0, 0)
                                  : Matrix4.translationValues(0, -50, 0),
                              child: Card(
                                elevation: 5,
                                margin: const EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ClipOval(),
                                          SizedBox(width: 16),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Name: ${reservation.name}',
                                                style: GoogleFonts.openSans(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Date: ${reservation.date.toString()}',
                                                style: GoogleFonts.openSans(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Time: ${reservation.time.format(context)}',
                                                style: GoogleFonts.openSans(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Description: ${reservation.description}',
                                                style: GoogleFonts.openSans(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _editReservation(context, index);
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.edit,
                                                  color: Colors.blue,
                                                ),
                                                Text('Edit'),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () {
                                              _deleteReservation(
                                                  context, index);
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                Text('Delete'),
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
                          },
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _editReservation(BuildContext context, int index) {
    final historySharedPreferencesUtils = HistorySharedPreferencesUtils();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<List<ReservationData>>(
          future: historySharedPreferencesUtils.getReservations(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('An error occurred: ${snapshot.error}'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              return AlertDialog(
                title: Text('No Reservations Available'),
                content: Text('There are no reservations available.'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            } else {
              final reservations = snapshot.data!;
              final selectedReservation = reservations[index];
              nameController.text = selectedReservation.name;
              dateController.text = selectedReservation.date.toString();
              selectedTime = selectedReservation.time;
              descriptionController.text = selectedReservation.description;

              return AlertDialog(
                title: Text('Edit Reservation'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: 'Name'),
                      ),
                      Text(_nameValidationError,
                          style: TextStyle(color: Colors.red)),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(labelText: 'Date'),
                        onTap: () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedReservation.date,
                            firstDate: DateTime(DateTime.now().year - 5),
                            lastDate: DateTime(DateTime.now().year + 5),
                          );

                          if (selectedDate != null) {
                            setState(() {
                              selectedReservation.date = selectedDate;
                              dateController.text =
                                  selectedReservation.date.toString();
                            });
                          }
                        },
                      ),
                      Text(_dateValidationError,
                          style: TextStyle(color: Colors.red)),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                          );
                          if (newTime != null) {
                            setState(() {
                              selectedTime = newTime;
                            });
                          }
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Time: ${selectedTime.format(context)}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.edit, size: 20),
                          ],
                        ),
                      ),
                      Text(_timeValidationError,
                          style: TextStyle(color: Colors.red)),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(labelText: 'Description'),
                      ),
                      Text(_descriptionValidationError,
                          style: TextStyle(color: Colors.red)),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _nameValidationError = '';
                            _dateValidationError = '';
                            _timeValidationError = '';
                            _descriptionValidationError = '';
                          });

                          if (nameController.text.isEmpty) {
                            setState(() {
                              _nameValidationError = 'Name cannot be empty';
                            });
                          }

                          if (dateController.text.isEmpty) {
                            setState(() {
                              _dateValidationError = 'Date cannot be empty';
                            });
                          } else {
                            DateTime selectedDate =
                                DateTime.parse(dateController.text);
                            if (selectedDate.isBefore(DateTime.now())) {
                              setState(() {
                                _dateValidationError =
                                    'Date cannot be before today';
                              });
                            }
                          }

                          if (selectedTime.hour < TimeOfDay.now().hour ||
                              (selectedTime.hour == TimeOfDay.now().hour &&
                                  selectedTime.minute <
                                      TimeOfDay.now().minute)) {
                            setState(() {
                              _timeValidationError =
                                  'Time cannot be before the current time';
                            });
                          }

                          if (descriptionController.text.isEmpty) {
                            setState(() {
                              _descriptionValidationError =
                                  'Description cannot be empty';
                            });
                          }

                          if (nameController.text.isEmpty ||
                              _dateValidationError.isNotEmpty ||
                              _timeValidationError.isNotEmpty ||
                              descriptionController.text.isEmpty) {
                            return;
                          }

                          selectedReservation.name = nameController.text;
                          selectedReservation.date =
                              DateTime.parse(dateController.text);
                          selectedReservation.description =
                              descriptionController.text;
                          selectedReservation.time = selectedTime;
                          reservations[index] = selectedReservation;
                          await historySharedPreferencesUtils
                              .saveReservations(reservations);

                          setState(() {});

                          Navigator.of(context).pop();
                        },
                        child: Text('Save Changes'),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    ).then((value) {
      _loadReservations();
    });
  }

  void _deleteReservation(BuildContext context, int index) {
    final historySharedPreferencesUtils = HistorySharedPreferencesUtils();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<List<ReservationData>>(
          future: historySharedPreferencesUtils.getReservations(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('An error occurred: ${snapshot.error}'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              return AlertDialog(
                title: Text('No Reservations Available'),
                content: Text('There are no reservations available.'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            } else {
              return AlertDialog(
                title: Text('Delete Reservation'),
                content:
                    Text('Are you sure you want to delete this reservation?'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      final reservations = snapshot.data!;
                      reservations.removeAt(index);
                      historySharedPreferencesUtils
                          .saveReservations(reservations);
                      Navigator.of(context).pop();
                    },
                    child: Text('Delete'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                ],
              );
            }
          },
        );
      },
    ).then((value) {
      _loadReservations();
    });
  }
}
