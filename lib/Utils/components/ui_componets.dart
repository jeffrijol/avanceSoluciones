import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:activos/Utils/components/color.dart';
import 'package:activos/Utils/components/text.dart';

import '../../Model/rental_house_model.dart';
import '../../Screens/RentalHouse/rental_house_home.dart';
import 'package:animate_do/animate_do.dart';

import 'typography.dart';

class MinimalMenuBar extends StatelessWidget {
  const MinimalMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: <Widget>[
              Flexible(
                child: InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () => Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName)),
                  child: Text("Avance Soluciones",
                      style: GoogleFonts.montserrat(
                          color: textPrimary,
                          fontSize: 26,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    children: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.popUntil(context,
                            ModalRoute.withName(Navigator.defaultRouteName)),
                        style: menuButtonStyle,
                        child: const Text(
                          "PROPIEDADES",
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: menuButtonStyle,
                        child: const Text(
                          "DOCUMENTOS",
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, RentalHouseHome.name),
                        style: menuButtonStyle,
                        child: const Text(
                          "NOTIFICACIONES",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 30),
            color: const Color(0xFFEEEEEE)),
      ],
    );
  }
}

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    Key? key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: powerOn ? Colors.grey[900] : Color.fromARGB(44, 164, 167, 189),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Image.asset(
                iconPath,
                height: MediaQuery.of(context).size.width * 0.1,
                color: powerOn ? Colors.white : Colors.grey.shade700,
              ),

              // smart device name + switch
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Text(
                        smartDeviceName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: powerOn ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RentalHouseList extends StatelessWidget {
  final RentalHouseModel rentalHouse;
  void Function(bool)? onChanged;

  RentalHouseList({
    Key? key,
    required this.rentalHouse,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInRightBig(
      child: ListTile(
          selectedTileColor: Colors.lightGreenAccent,
          selected: false,
          leading: CircleAvatar(
            backgroundColor:
                rentalHouse.isActive ? Colors.red.shade400 : Colors.blueGrey,
            child: const Icon(Icons.house),
          ),
          subtitle: RichText(
              text: TextSpan(style: listTextStyle, children: [
            const TextSpan(
              text: 'Construida el',
            ),
            TextSpan(
                text:
                    ' ${rentalHouse.constructionDate.toString().substring(0, 10)}'),
            const TextSpan(
              text: ' y reformada el',
            ),
            TextSpan(
                text:
                    ' ${rentalHouse.lastReformDate.toString().substring(0, 10)}'),
          ])),
          title: RichText(
              text: TextSpan(style: listTextStyle, children: [
            TextSpan(text: rentalHouse.type),
            const TextSpan(text: ' de '),
            TextSpan(text: ' ${rentalHouse.address}'),
            const TextSpan(text: ', administrada por: '),
            TextSpan(text: ' ${rentalHouse.managedByUser}', style: listTittleTextStyle),
          ])),
          trailing: IconButton(
            onPressed: () async {},
            icon: rentalHouse.isActive
                ? const Icon(Icons.send)
                : const Icon(Icons.send_and_archive),
            color: Colors.blueGrey,
          )),
    );
  }
}
