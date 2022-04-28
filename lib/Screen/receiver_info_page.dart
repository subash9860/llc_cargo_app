import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './payment_screen.dart';
import '../models/form_model.dart';
import '../provider/form_data.dart';

class ReceiverInfoScreen extends StatefulWidget {
  const ReceiverInfoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ReceiverInfoScreen> createState() => _ReceiverInfoScreenState();
}

class _ReceiverInfoScreenState extends State<ReceiverInfoScreen> {
  DateTime? _date;
  TimeOfDay? _time;

  final _form = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Receiver Info'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter the date of delivery",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              size: 40,
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 100,
                              child: Text(
                                _date == null
                                    ? "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}"
                                    : "${_date!.year}-${_date!.month}-${_date!.day}",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: _date ?? DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime(DateTime.now().year + 1),
                        ).then(
                          (value) {
                            setState(() {
                              _date = value;
                            });
                          },
                        );
                      },
                    ),
                    InkWell(
                      child: Chip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: Row(
                          children: [
                            const Icon(
                              Icons.watch_later_outlined,
                              size: 40,
                            ),
                            SizedBox(
                              width: 90,
                              child: Text(
                                _time == null
                                    ? TimeOfDay.now().format(context).toString()
                                    : "${_time?.format(context)}",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: _time ?? TimeOfDay.now(),
                        ).then(
                          (value) {
                            setState(() {
                              _time = value;
                            });
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Receiver Info',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                formMethod(
                    controller: _nameController,
                    hintText: "Ram",
                    labelText: "Full Name",
                    icon: Icons.person_outline),
                const SizedBox(height: 20),
                formMethod(
                    controller: _emailController,
                    hintText: "ram.kc42@gmail.com",
                    labelText: "Email",
                    icon: Icons.email_outlined),
                const SizedBox(height: 20),
                formMethod(
                    controller: _phoneController,
                    hintText: "9800000000",
                    labelText: "Phone",
                    icon: Icons.phone_outlined),
                const SizedBox(height: 20),
                formMethod(
                    controller: _addressController,
                    hintText: "Kathmandu",
                    labelText: "Address",
                    icon: Icons.location_on_outlined),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // submiting the data to the server
                    if (_form.currentState!.validate()) {
                      _form.currentState!.save();
                      print(_date.toString());
                      print(_time?.format(context).toString());
                      print(_nameController.text);
                      print(_emailController.text);
                      print(_phoneController.text);
                      print(_addressController.text);

                      final uuid =
                          Provider.of<FormDataModel>(context, listen: false)
                              .uuid;

                      Provider.of<BookedDateTimeModel>(context, listen: false)
                          .setItems(
                        BookedDateTime(
                          uid: uuid,
                          date: (_date ?? DateTime.now()),
                          time: (_time ?? TimeOfDay.now()),
                        ),
                      );
                      Provider.of<ReceiverInfoModel>(context, listen: false)
                          .setItems(
                        ReceiverInfo(
                          uid: uuid,
                          fullName: _nameController.text,
                          email: _emailController.text,
                          phoneNumber: _phoneController.text,
                          address: _addressController.text,
                        ),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentScreen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 325,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrange,
                    ),
                    child: const Text(
                      "Done",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.white),
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

  TextFormField formMethod(
      {required TextEditingController controller,
      required String hintText,
      required String labelText,
      required IconData icon}) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            style: BorderStyle.none,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an email address';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }
}
