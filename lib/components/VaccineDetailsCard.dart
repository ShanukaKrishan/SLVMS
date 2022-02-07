import 'package:flutter/material.dart';

class VaccineDetailsCard extends StatelessWidget {
  final int vaccineDoseNumber;
  final String dose;
  final String batchNumber;
  final String vCenter;
  final String vaccinatedAt;

  VaccineDetailsCard(
      {this.vaccineDoseNumber,
      this.dose,
      this.batchNumber,
      this.vCenter,
      this.vaccinatedAt});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 12),
          width: 600,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 3,
              color: Color.fromRGBO(132, 135, 142, 1),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/bottle.png"),
                      color: Color.fromRGBO(132, 135, 142, 1),
                      height: 30,
                      width: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      dose,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/injection2.png"),
                      color: Color.fromRGBO(132, 135, 142, 1),
                      height: 30,
                      width: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      batchNumber,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/calendar2.png"),
                      color: Color.fromRGBO(132, 135, 142, 1),
                      height: 30,
                      width: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      vaccinatedAt,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/hospital.png"),
                      color: Color.fromRGBO(132, 135, 142, 1),
                      height: 30,
                      width: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        vCenter,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 50,
          height: 200,
          decoration: BoxDecoration(
            color: Color.fromRGBO(132, 135, 142, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Text(
            vaccineDoseNumber.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ),
      ],
    );
  }
}
