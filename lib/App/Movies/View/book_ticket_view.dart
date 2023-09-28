import 'package:flutter/material.dart';

import '../../../Utils/Theme/colors.dart';
import '../../../Utils/toast_message.dart';

class BookTicketView extends StatefulWidget {
  const BookTicketView({super.key});

  @override
  _BookTicketViewState createState() => _BookTicketViewState();
}

class _BookTicketViewState extends State<BookTicketView> {
  String? selectedLocation;
  String? selectedCinema;
  String? selectedSeatNumber;

  List<String> locations = ['Location 1', 'Location 2', 'Location 3'];
  List<String> cinemas = ['Cinema 1', 'Cinema 2', 'Cinema 3'];
  List<String> seatNumbers = ['A1', 'A2', 'A3', 'B1', 'B2', 'B3'];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: const Text('Book a Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DropdownButtonFormField<String>(
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
                hint: const Text("Select Location"),
                value: selectedLocation,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLocation = newValue!;
                  });
                },
                items: locations.map((String location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
                hint: const Text("Select Cinema"),
                value: selectedCinema,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCinema = newValue!;
                  });
                },
                items: cinemas.map((String cinema) {
                  return DropdownMenuItem<String>(
                    value: cinema,
                    child: Text(cinema),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
                hint: const Text("Select Seat No#"),
                value: selectedSeatNumber,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSeatNumber = newValue!;
                  });
                },
                items: seatNumbers.map((String seat) {
                  return DropdownMenuItem<String>(
                    value: seat,
                    child: Text(seat),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save(); // Save the form fields
                      ShowMessage().onSuccess("Ticket Booked Successfully");

                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Book Ticket',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
