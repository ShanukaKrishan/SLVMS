import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        color: Colors.black,
      ),
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage(
              'assets/images/logo.png',
            ),
            width: 100,
            height: 70,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Health Promotion Bureau",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              Text(
                "Vaccine Management System",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
