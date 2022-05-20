import 'package:covid_app/models/facility_model.dart';
import 'package:covid_app/utils/constant.dart';
import 'package:flutter/material.dart';

class FacilityCard extends StatelessWidget {
  // final FacilityModel resultF;
  final FacilityModel futureData; 
  
  const FacilityCard({
    Key? key, 
    // required this.resultF,
    required this.futureData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCard(
            futureData.name,
            futureData.city,
            futureData.address,
            futureData.phone,
            futureData.facility,
            futureData.status,
          ),
        ]
      ),
    );
  }

  Widget buildCard(
    String name,
    String city,
    String address,
    String phone,
    String facility, 
    String status
  ) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      name.toString(),
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      city.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      address.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      phone,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                      Text(
                        facility.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        status.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}