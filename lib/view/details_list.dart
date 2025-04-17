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
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                // image of country
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Image.network(
                    widget.image.toString(),
                    height: 110,
                    width: 140,
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Text(
                  widget.name!,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                // card for details
                Card(
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
                          height: MediaQuery.of(context).size.height * 0.03,
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
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
