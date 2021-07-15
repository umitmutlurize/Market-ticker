import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marketticker/models/priceModel.dart';
import 'package:marketticker/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ApiService apiService = ApiService();



  _incrementCounter(List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  Future<bool> vss = prefs.setStringList("previous-values", value);

    await prefs.setInt('counter', counter);
  }



  Future<Data> refreshButton() async {
    final response = await apiService.getAllData();

    var refreshResponse = Data.fromJson(response);
    return refreshResponse;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 15, 50, 0.4),
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: false,
          title: Text('Market ticker'),
          actions: [
            GestureDetector(
              onTap: () {
                refreshButton();
                setState(() {
                  apiService.getAllData();
                });
              },
              child: Icon(Icons.refresh),
            )
          ],
        ),
        body: Center(
          child: FutureBuilder<Data>(
            future: refreshButton(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.rates!.length,
                  itemBuilder: (context, index) {
                    _incrementCounter(snapshot.data!.rates!.values.toList())
                 return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: snapshot.data!.rates!.keys.toList()[index],
                                style: TextStyle(color: Colors.white70),
                                children: <InlineSpan>[
                                  TextSpan(
                                      text: '/EUR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          color: Colors.white.withOpacity(0.8)))
                                ]),
                          ),
                          Text(
                              snapshot.data!.rates!.values
                                  .toList()[index]
                                  .toString(),
                              style:
                              TextStyle(color: Colors.white, fontSize: 16)),
                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * .05,
                            width: MediaQuery.of(context).size.height * .09,
                            decoration: BoxDecoration(
                              color: Colors.lightGreenAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'Percent %',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    );
                  }
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return LoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}

/*
class CustomFutureBuilder extends StatelessWidget {
  final Future<dynamic> futureFunction;
  final Function(dynamic val) onComplete;

  CustomFutureBuilder({
    required this.futureFunction,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFunction,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: LoadingWidget());
          case ConnectionState.done:
            if (snapshot.hasData) {
              return onComplete(snapshot.data);
            } else {
              return Center(
                child: Text(
                  "Your ApiKey expred",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              );
            }
          default:
            return Center(child: Text("Something Went Wrong"));
        }
      },
    );
  }
}*/

class LoadingWidget extends StatelessWidget {
  final double? size;

  LoadingWidget({
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SpinKitWave(
          color: Colors.redAccent,
          size: size ?? 50.0,
        ),
      ),
    );
  }
}
