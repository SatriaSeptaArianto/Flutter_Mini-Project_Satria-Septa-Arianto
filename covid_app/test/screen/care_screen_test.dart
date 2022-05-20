import 'package:covid_app/screens/care_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  var path = MaterialApp(
    home: CareScreen()
  );

  testWidgets('Sub Judul page', (WidgetTester tester) async {

    await tester.pumpWidget(path);

    expect(find.text('Symptoms'), findsOneWidget);
  });
}