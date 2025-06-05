

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _result = "";
  String _message = "";
  final TextEditingController _mrp = TextEditingController();
  final TextEditingController _discountPercentage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text("Discount Calculator"),
        ),

        body: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _mrp,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter the MRP"
                      ),
                    ),
                  ),


                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _discountPercentage,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                          labelText: "Discount in %"
                      ),
                    ),
                  ),


                  Container(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment:           MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              child: Text("DISCOUNT",

                              ),
                              onPressed: _discountAmount,

                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              child: Text("SELL AT",

                              ),
                              onPressed: _sellAt,

                            ),
                          )
                        ],
                      )
                  ),


                  showOutput(_result),

                ],
              ),
            ),
          ),

        )
    );
  }

  void _discountAmount() {
    int _calMrp = int.parse(_mrp.text);
    int _calDis = int.parse(_discountPercentage.text);
    double p;

    p = (_calDis/100) * _calMrp;

    _result = p.toString();
    _message = "The Discount is";
    setState(() {

    });
  }

  void _sellAt() {
    double _calMrp = double.parse(_mrp.text);
    int _calDis = int.parse(_discountPercentage.text);
    double _disc;
    double _sell;

    _disc = (_calDis/100) * _calMrp;
    _sell = _calMrp - _disc;

    _result = _sell.toString();
    _message = "The Selling Price is";
    setState(() {

    });
  }

  Widget showOutput (output) {

    bool canShow = false;
    String _result = output;

    if(_result.length > 0)
      canShow = true;

    return Container(
        margin: EdgeInsets.only(top: 30.0),
        padding: EdgeInsets.all(20.0),
        child: canShow ? Column(
          children: <Widget>[
            Text(_message,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )
            ),
            Text(_result,
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ) : Container()
    );
  }
}

