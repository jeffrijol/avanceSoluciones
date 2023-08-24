import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/rental_house_model.dart';
import '../../Screens/RentalHouse/rental_house_home.dart';
import 'package:animate_do/animate_do.dart';

import 'components.dart';

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

const Widget divider = Divider(color: Color(0xFFEEEEEE), thickness: 1);
Widget dividerSmall = Container(
  width: 40,
  decoration: const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Color(0xFFA0A0A0),
        width: 1,
      ),
    ),
  ),
);

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
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: powerOn ? Colors.grey[900] :  const Color.fromARGB(44, 164, 167, 189),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
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
                      padding: const EdgeInsets.only(left: 25.0),
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
            TextSpan(
                text: ' ${rentalHouse.managedByUser}',
                style: listTittleTextStyle),
          ])),
          trailing: Hero(
            tag: rentalHouse.id,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(heroTag: rentalHouse.id, rentalHouse: rentalHouse,),
                  ),
                );
              },
              icon: rentalHouse.isActive
                  ? const Icon(Icons.send)
                  : const Icon(Icons.send_and_archive),
              color: Colors.blueGrey,
            ),
          )),
    );
  }
}


class SecondPage extends StatelessWidget {
  final String heroTag;
  final RentalHouseModel rentalHouse;
  const SecondPage({super.key, required this.heroTag, required this.rentalHouse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gestion de inmuebles",style: subtitleTextStyle, ), backgroundColor: Colors.white12,),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: marginBottom12,
                      child: Text(rentalHouse.address, style: headlineTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: marginBottom24,
                      child: Text("Alguna descripción, sería ver que dato pintamos",
                          style: subtitleTextStyle),
                    ),
                  ),
                  divider,
                  Container(
                    margin: marginBottom40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: marginBottom12,
                      child: Text("Caracteristicas del inmueble",
                          style: headlineSecondaryTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: marginBottom24,
                      child: Text("Una tabla con los numero de baños, sanitarios, escaleras",
                          style: subtitleTextStyle),
                    ),
                  ),
                  dividerSmall,
                  Container(
                    margin: marginBottom24,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: marginBottom24,
                      child: Text("Servicios", style: headlineTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: marginBottom24,
                      child: Text("Otro tipo de encabezado",
                          style: headlineSecondaryTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: marginBottom24,
                      child: Text("Formato subtitulo", style: subtitleTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: marginBottom40,
                      child: Text(
                          "Body text is the default text style. Use this text style for website content and paragraphs. This text is chosen to be easy and comfortable to read. As the default text style for large blocks of text, particular attention is placed on the choice of font. Some fonts are more comfortable to read than others.",
                          style: bodyTextStyle),
                    ),
                  ),
                  divider,
                  //const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
