import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:covid_tracker/Services/states_services.dart';
import 'package:covid_tracker/view/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({super.key});

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with SingleTickerProviderStateMixin {
  /// AnimationController for loading spinner
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController
    // duration is set to 2 seconds
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    // Dispose of the AnimationController
    // to free up resources when the widget is removed from the widget tree
    _controller.dispose();
    super.dispose();
  }

  // List of colors for the pie chart
  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Expanded(
                // futurebuilder to fetch world states data
                child: FutureBuilder<WorldStatesModel>(
                  future: statesServices.getWorldStatesApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * 0.15,
                          controller: _controller,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData) {
                      return Center(child: Text('No data available'));
                    } else {
                      final data = snapshot.data!;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            // pieChart to show the data
                            PieChart(
                              dataMap: {
                                "Total": data.cases!.toDouble(),
                                "Recovered": data.recovered!.toDouble(),
                                "Deaths": data.deaths!.toDouble(),
                              },
                              chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true,
                                showChartValues: true,
                                decimalPlaces: 2,
                                showChartValuesOutside: true,
                                chartValueStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                showChartValueBackground: false,
                              ),
                              chartType: ChartType.ring,
                              chartRadius:
                                  MediaQuery.of(context).size.width / 2.5,
                              animationDuration: Duration(seconds: 2),
                              colorList: colorList,
                              ringStrokeWidth:
                                  MediaQuery.of(context).size.width * 0.08,
                              chartLegendSpacing:
                                  MediaQuery.of(context).size.width * 0.15,
                              legendOptions: LegendOptions(
                                showLegends: true,
                                showLegendsInRow: true,
                                legendPosition: LegendPosition.bottom,
                                legendTextStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            // Container to show the data in a card format
                            Container(
                              decoration: BoxDecoration(
                                // ignore: deprecated_member_use
                                color: Colors.grey[600]?.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ReusableRow(
                                      title: 'Total',
                                      value: data.cases.toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Deaths',
                                      value: data.deaths.toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Recovered',
                                      value: data.recovered.toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Active',
                                      value: data.active.toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Critical',
                                      value: data.critical.toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Today Deaths',
                                      value: data.todayDeaths.toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Today Recovered',
                                      value: data.todayRecovered.toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            // button to navigate to countries list
                            GestureDetector(
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CountriesList(),
                                    ),
                                  ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.green,
                                ),
                                child: Center(
                                  child: Text(
                                    'Track Countries',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;
  const ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
              Text(value, style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          Divider(color: Colors.white, thickness: 0.1),
        ],
      ),
    );
  }
}
