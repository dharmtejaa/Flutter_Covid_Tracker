import 'package:covid_tracker/view/world_states.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsList extends StatefulWidget {
  String? name;
  String? image;
  int? totalCases;
  int? totalRecovered;
  int? totalDeaths;
  int? active;
  int? test;
  int? todayrecovered;
  int? critical;
  DetailsList({
    super.key,
    this.name,
    this.image,
    this.totalCases,
    this.totalRecovered,
    this.totalDeaths,
    this.active,
    this.test,
    this.todayrecovered,
    this.critical,
  });

  @override
  State<DetailsList> createState() => _DetailsListState();
}

class _DetailsListState extends State<DetailsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name!,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .058,
                      ),
                      // card for details
                      child: Card(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        // ignore: deprecated_member_use
                        color: Colors.grey[600]?.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              ReusableRow(
                                title: 'Total Cases',
                                value: widget.totalCases.toString(),
                              ),
                              ReusableRow(
                                title: 'Total Recovered',
                                value: widget.totalRecovered.toString(),
                              ),
                              ReusableRow(
                                title: 'Total Deaths',
                                value: widget.totalDeaths.toString(),
                              ),
                              ReusableRow(
                                title: 'Active',
                                value: widget.active.toString(),
                              ),
                              ReusableRow(
                                title: 'Test',
                                value: widget.test.toString(),
                              ),
                              ReusableRow(
                                title: 'Today Recovered',
                                value: widget.todayrecovered.toString(),
                              ),
                              ReusableRow(
                                title: 'Critical',
                                value: widget.critical.toString(),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // image of country
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                        ),
                        height:
                            100, 
                        width: 150, 
                        child: Image.network(
                          widget.image.toString(),
                          height:
                              110, 
                          width:
                              150, 
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
