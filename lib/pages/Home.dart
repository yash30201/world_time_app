import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String city;
  String time;
  bool day = true;
  Color back = Colors.amberAccent[100];
  Color textColor = Colors.black;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context).settings.arguments != null)
        ? ModalRoute.of(context).settings.arguments
        : data;
    city = data.isEmpty ? 'Select a city' : data['city'];
    time = data.isEmpty ? '' : data['time'];
    day = data.isEmpty ? true : data['day'];
    back = day ? Colors.white : Colors.grey[900];
    textColor = day ? Colors.black : Colors.grey[400];
    return SafeArea(
      child: Scaffold(
        backgroundColor: back,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: back,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70.0,
                ),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey)),
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.grey[800],
                  ),
                  label: Text('Location'),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  child: Text(
                    city,
                    style: TextStyle(
                      fontSize: 35.0,
                      letterSpacing: 2.0,
                      color: textColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Text(
                    time,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 50.0,
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
