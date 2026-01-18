import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hospital/features/auth/views/userinformation_screen.dart';

void main() {
  testWidgets('Userinformation', (WidgetTester tester) async {
    final mockRoute = '/mockRoute';
    // Approutes.welcomes = mockRoute;

    await tester.pumpWidget(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => UserinformationScreen(),
          mockRoute: (context) => Scaffold(
                body: Text("Welcome Screen"),
              )
        },
      ),
    );
    expect(find.text('Simpaz Heath Welcome'), findsOneWidget);
  });
}
