import 'package:flutter_test/flutter_test.dart';
import 'package:hospital/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('TodolistPage UI Test', (WidgetTester tester) async {
    // Load the app
    await tester.pumpWidget(const MyApp());

    // Verify the app bar title
    expect(find.text('Things you have To-Do'), findsOneWidget);

    // Verify placeholder image
    // expect(find.byType(""), matcher)
  });
}







// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:hospital/main.dart';

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   testWidgets('TodolistPage UI Test', (WidgetTester tester) async {
//     // Load the app
//     await tester.pumpWidget(const MyApp());

//     // Verify the app bar title
//     expect(find.text('Things you have To-Do'), findsOneWidget);

//     // Verify placeholder image
//     expect(find.byType(Image), findsOneWidget);

//     // Verify "Today" section
//     expect(find.text('Today'), findsOneWidget);
//     expect(find.text('View All'), findsOneWidget);

//     // Verify ToDoItems
//     expect(find.text('Verify your Account'), findsOneWidget);
//     expect(find.text('Fill Emergency Form'), findsOneWidget);
//     expect(find.text('Fill Insurance Form'), findsOneWidget);
//     expect(find.text('Payment Bill'), findsOneWidget);
//     expect(find.text('Prescription'), findsOneWidget);
//     expect(find.text('Receipt'), findsOneWidget);

//     // Simulate tapping on a ToDoItem
//     await tester.tap(find.text('Verify your Account'));
//     await tester.pumpAndSettle();

//     // Verify navigation to PersonalInfoScreen
//     expect(find.byType(PersonalInfoScreen), findsOneWidget);
//   });
// }
