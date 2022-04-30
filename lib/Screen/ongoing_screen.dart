import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/listcard_ongoing.dart';
import '../models/form_model.dart';
import '../provider/form_data.dart';

class OngoingScreen extends StatefulWidget {
  const OngoingScreen({Key? key}) : super(key: key);

  @override
  State<OngoingScreen> createState() => _OngoingScreenState();
}

class _OngoingScreenState extends State<OngoingScreen> {
  @override
  Widget build(BuildContext context) {
    final List<FormModel> formlist =
        Provider.of<FormDataModel>(context, listen: false).formDataList;

    final List<LocationModel> locationlist =
        Provider.of<LocationModelData>(context, listen: false).locationDataList;

    final List<BookedDateTime> bookedDateTimeList =
        Provider.of<BookedDateTimeModel>(context, listen: false)
            .bookedDateTimeList;

    return (formlist.isNotEmpty)
        ? ListView.builder(
            itemCount: formlist.length,
            itemBuilder: (context, index) {
              return (bookedDateTimeList[index].date.isAfter(DateTime.now())
                  ? ListCard(
                      name: formlist[index].deliveryType.name,
                      from: locationlist[index].startingPoint,
                      to: locationlist[index].destination,
                      date: bookedDateTimeList[index].date,
                      time: bookedDateTimeList[index].time,
                    )
                  : const SizedBox(height: 0));
            })
        : const Center(
            child: Text(
              'No Ongoing Trips',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          );
  }
}
