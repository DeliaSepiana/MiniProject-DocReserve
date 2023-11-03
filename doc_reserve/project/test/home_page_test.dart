import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/main.dart';
import 'package:project/views/profile_page.dart';

void main() {
  testWidgets('HomePage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Docs Reserve'), findsOneWidget);
    expect(find.text('Welcome, Delia Sepiana'), findsOneWidget);
    expect(find.text('How do you feel?'), findsOneWidget);
    expect(find.text('Ceritakan keluhan anda melalui tombol di bawah ini.'),
        findsOneWidget);

    expect(find.byIcon(Icons.person), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(find.byType(ProfilePage), findsOneWidget);

    await tester.tap(find.text('Reservation'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Schedule'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Consultation'));
    await tester.pumpAndSettle();

    final availableDoctorSection = find.text('Available Doctor');
    expect(availableDoctorSection, findsOneWidget);
    await tester.drag(availableDoctorSection, Offset(0.0, -300));
    await tester.pumpAndSettle();
  });
}
