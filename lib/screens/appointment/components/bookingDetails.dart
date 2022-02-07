import 'package:flutter/material.dart';

class BookingDetails extends StatefulWidget {
  final int id;
  final String dose;
  final String batchNumber;
  final String vCenter;
  final String maxLimit;
  final bool isActive;
  final int appointmentCount;

  BookingDetails({
    this.id,
    this.dose,
    this.batchNumber,
    this.vCenter,
    this.maxLimit,
    this.isActive,
    this.appointmentCount,
  });

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 600,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 3,
                color: Color.fromRGBO(59, 240, 132, 1),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
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
                        "Pfizer",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 220,
                      ),
                      Checkbox(
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value;
                            });
                          }),
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
                        "Batch 00001",
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
                        "DD/MM/YYYY",
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
                      Text(
                        widget.vCenter,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      value == false ? "Select Location" : "Location Selected",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    minWidth: 360,
                    color: value == false
                        ? Color.fromRGBO(59, 240, 132, 1)
                        : Color.fromRGBO(0, 195, 78, 1),
                    onPressed: () {
                      setState(() {
                        value = !value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
