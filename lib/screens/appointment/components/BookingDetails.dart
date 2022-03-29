import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingDetails extends StatefulWidget {
  final int id;
  final String dose;
  final String batchNumber;
  final String vCenter;
  final int maxLimit;
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
  bool _isSelected = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color _checkColor() {
      if (widget.isActive == false &&
          widget.appointmentCount < widget.maxLimit &&
          value == false) {
        return Colors.red;
      } else if (widget.appointmentCount >= widget.maxLimit &&
          value == false &&
          widget.isActive == true) {
        return Colors.amber;
      } else if (value == false) {
        return Colors.green;
      } else if (value == true) {
        return Color.fromRGBO(59, 240, 132, 1);
      } else {
        return Colors.pink;
      }
    }

    Text _checkText() {
      if (widget.isActive == false) {
        return Text("LOCATION INACTIVE", style: TextStyle(color: Colors.white));
      }
      if (widget.appointmentCount >= widget.maxLimit) {
        return Text("LOCATION FULL", style: TextStyle(color: Colors.white));
      }
      if (value == true) {
        return Text("Selected");
      } else
        return Text("Select");
    }

    int spotCount = widget.maxLimit - widget.appointmentCount;
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
                color: _checkColor(),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        widget.dose,
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
                        widget.batchNumber,
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
                        spotCount.toString() +
                            "/" +
                            widget.maxLimit.toString() +
                            " spots left",
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
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            widget.vCenter,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          disabledTextColor: Colors.grey,
                          disabledColor: _checkColor(),
                          color: _checkColor(),
                          onPressed: () async {
                            setState(() {
                              value = !value;
                            });
                            if (value) {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setInt('vCenterId', widget.id);
                            }
                          },
                          child: _checkText(),
                        ),
                      ),
                    ],
                  ),
                  // button(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
