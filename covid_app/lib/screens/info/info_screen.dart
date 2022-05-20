import 'package:covid_app/models/covid_model.dart';
import 'package:covid_app/screens/info/info_card.dart';
import 'package:covid_app/services/covid_service.dart';
import 'package:covid_app/utils/constant.dart';
import 'package:covid_app/widgets/header.dart';
import 'package:flutter/material.dart';

CovidService covidService = CovidService();

class InfoScreen extends StatefulWidget {
  const InfoScreen({
    Key? key,
  }) : super(key: key);
  
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  late Future<CovidModel> result;
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    result = covidService.getCovidData();
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
          children: <Widget>[
            MyHeader(
              image: "assets/icons/treatment.svg",
              textTop: "",
              textBottom: "",
              offset: offset,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  FutureBuilder<CovidModel>(
                    future: result,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(child: Text("Error"),);
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting: 
                          return const CircularProgressIndicator();
                        default:
                          return !snapshot.hasData 
                            ? const Center(child: Text("Empty"),)
                            : InfoCard(
                              result: snapshot.data!,
                            );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        "Spread of Virus",
                        style: kTitleTextstyle,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
