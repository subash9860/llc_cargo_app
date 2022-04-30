import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/form_model.dart';
import '../provider/form_data.dart';
import '../widgets/listcard_previous.dart';

class PrevoiusScreen extends StatelessWidget {
  const PrevoiusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FormModel> formlist =
        Provider.of<FormDataModel>(context, listen: false).formDataList;

    final List<LocationModel> locationlist =
        Provider.of<LocationModelData>(context, listen: false).locationDataList;

    final List<BookedDateTime> bookedDateTimeList =
        Provider.of<BookedDateTimeModel>(context, listen: false)
            .bookedDateTimeList;

    final List<ReceiverInfo> reciverbyList =
        Provider.of<ReceiverInfoModel>(context, listen: false).receiverInfoList;

    return (formlist.isNotEmpty)
        ? ListView.builder(
            itemCount: formlist.length,
            itemBuilder: (context, index) {
              return (bookedDateTimeList[index].date.isBefore(DateTime.now())
                  ? ListcardPrevious(
                      name: formlist[index].deliveryType.name,
                      from: locationlist[index].startingPoint,
                      to: locationlist[index].destination,
                      date: bookedDateTimeList[index].date,
                      time: bookedDateTimeList[index].time,
                      receiveby: reciverbyList[index].fullName,
                    )
                  : const SizedBox(height: 0));
            })
        : const Center(
            child: Text(
              'No Previous Trips',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          );
  }
}
