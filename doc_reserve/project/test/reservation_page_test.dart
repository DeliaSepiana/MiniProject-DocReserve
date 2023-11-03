import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project/main.dart';

void main() {
  testWidgets('ReservationPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.byIcon(LineIcons.arrowCircleLeft));
    await tester.pumpAndSettle();

    expect(find.text('Reservations'), findsOneWidget);

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
