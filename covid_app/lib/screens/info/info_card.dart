import 'package:covid_app/models/covid_model.dart';
import 'package:covid_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  final CovidModel result;
  const InfoCard({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = result.date;
    var newDate = DateFormat.yMMMEd().format(date);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Case Update\n",
                  style: kTitleTextstyle,
                ),
                TextSpan(
                  text: "Newest update $newDate",
                  style: const TextStyle(
                    color: kTextLightColor,
                  ),
                ),
              ],
            ),
          ),
        ]),
        const SizedBox(height: 20),
        buildCard(
          "Infected",
          result.totalConfirmed,
          result.newConfirmed,
          kInfectedColor,
        ),
        buildCard(
          "Treated",
          result.totalTreated,
          result.newTreated,
          kTreatedColor,
        ),
        buildCard(
          "Recovered",
          result.totalRecovered,
          result.newRecovered,
          kRecoverColor,
        ),
        buildCard(
          "Deaths",
          result.totalDeaths,
          result.newDeaths,
          kDeathColor,
        ),
      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      totalCount.toString(),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Today",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      todayCount.toString(),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
