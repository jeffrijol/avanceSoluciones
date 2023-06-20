import 'package:flutter/material.dart';
import 'package:activos/Utils/Styles/colors.dart';

import '../../Model/rental_house_model.dart';
import '../../Provider/RentalHouseProvider/get_rental_house_provider.dart';
import '../../Utils/components/ui_componets.dart';

class RentalHouseServices extends StatefulWidget {
  const RentalHouseServices({Key? key}) : super(key: key);
  static const String name = 'rentalHouse';

  @override
  State<RentalHouseServices> createState() => _RentalHouseServicesState();
}

class _RentalHouseServicesState extends State<RentalHouseServices> {
  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const MinimalMenuBar(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Text(
                      "Rental Houses",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  FutureBuilder<List<RentalHouseModel>>(
                      future: GetRentalHouse().getRentalHouse(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        print(snapshot);
                        if (snapshot.hasError) {
                          return const Center(child: Text('Error Occured'));
                        } else if (snapshot.hasData) {
                          if (snapshot.data == null) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Todo List is empty',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {
                                      /*  PageNavigator(ctx: context).nextPage(
                                       page: const CreateTaskPage()); */
                                    },
                                    child: Text(
                                      'Create a task',
                                      style:
                                          TextStyle(fontSize: 18, color: grey),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Flexible(
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 10,
                                runSpacing: 10,
                                children: List.generate(
                                  snapshot.data!.length,
                                  (index) {
                                    final data = snapshot.data![index];
                                    return Container(
                                      width: MediaQuery.of(context).size.width *
                                              0.5 -
                                          15,
                                      child: SmartDeviceBox(
                                        smartDeviceName: data.address,
                                        iconPath: data.address,
                                        powerOn: true,
                                        onChanged: (value) =>
                                            powerSwitchChanged(value, index),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
