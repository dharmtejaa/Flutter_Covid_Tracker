import 'package:flutter/material.dart';
import 'package:covid_tracker/Services/states_services.dart';
import 'package:covid_tracker/view/details_list.dart';
// ignore: depend_on_referenced_packages
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  // statesServices is a class that contains the API call to get the countries list
  final StatesServices statesServices = StatesServices();
  // searchController is a TextEditingController that is used to get the input from the user
  // and filter the countries list based on the input
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    // Dispose the searchController when the widget is removed from the widget tree
    // to free up resources and avoid memory leaks
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // Wrap TextFormField in ValueListenableBuilder
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: searchController,
                builder: (context, value, _) {
                  return TextFormField(
                    controller: searchController,
                    cursorColor: Colors.grey,
                    style: const TextStyle(color: Colors.grey, fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10),
                      hintText: 'Search for a country',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      //  // if search field is not empty, show clear button
                      suffixIcon:
                          value.text.isEmpty
                              ? null
                              : IconButton(
                                onPressed: () => searchController.clear(),
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                              ),
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: statesServices.getCountriesListAPI(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 20,
                        itemBuilder:
                        //shimer effect for loading
                            (context, index) => Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      height: 50,
                                      width: 80,
                                      color: Colors.white,
                                    ),
                                    title: Container(
                                      height: 9,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 9,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      );
                    }
                    // Use ValueListenableBuilder again to filter list
                    return ValueListenableBuilder<TextEditingValue>(
                      valueListenable: searchController,
                      builder: (context, value, _) {
                        final query = value.text.toLowerCase();
                        final countries =
                            snapshot.data!
                                .where(
                                  (country) => (country['country'] as String)
                                      .toLowerCase()
                                      .contains(query),
                                )
                                .toList();
                        // if no country found
                        return ListView.builder(
                          itemCount: countries.length,
                          itemBuilder: (context, index) {
                            final item = countries[index];
                            return ListTile(
                              // onTap to navigate to details page
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => DetailsList(
                                            name: item['country'],
                                            image: item['countryInfo']['flag'],
                                            totalCases: item['cases'],
                                            totalRecovered: item['recovered'],
                                            totalDeaths: item['deaths'],
                                            active: item['active'],
                                            test: item['tests'],
                                            todayrecovered:
                                                item['todayRecovered'],
                                            critical: item['critical'],
                                          ),
                                    ),
                                  ),
                              leading: Image.network(
                                item['countryInfo']['flag'],
                                height: 50,
                                width: 68,
                                fit: BoxFit.fill,
                              ),
                              title: Text(item['country']),
                              subtitle: Text("Affected: ${item['cases']}"),
                            );
                          },
                        );
                      },
                    );
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
