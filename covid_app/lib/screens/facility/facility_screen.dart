import 'package:covid_app/models/facility_model.dart';
import 'package:covid_app/screens/facility/facility_card.dart';
import 'package:covid_app/services/facility_service.dart';
import 'package:covid_app/utils/constant.dart';
import 'package:covid_app/widgets/header.dart';
import 'package:flutter/material.dart';

FacilityService facilityService = FacilityService();

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late Future<List<FacilityModel>> futureData;
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    futureData = facilityService.getFacilityData();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/vaccine.svg",
              textTop: "Vaccine",
              textBottom: "For Immune.",
              offset: offset,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    RichText(
                      text: const TextSpan(
                        text: "Vaccine Facility",
                        style: kTitleTextstyle,
                      ),
                    ),
                  ]),
                  FutureBuilder<List<FacilityModel>>(
                    future: futureData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<FacilityModel>? data = snapshot.data;
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return FacilityCard(
                                futureData: data![index],
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    },
                  )
                ])),
          ],
        ),
      ),
    );
  }
}