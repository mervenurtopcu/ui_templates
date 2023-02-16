import 'package:flutter_test/flutter_test.dart';
import 'package:ui_templates/generics/generics.dart';

void main() {
    setUp(() {});
    test('Student Notes Calculate', () {
        final students = [
            User('Funda Aras', 90),
            User('Zehra Ağar', 80),
            User('Ayşenur Demirci',70),
            User('Mervenur Topcu',60),
        ];
        final teacher= StudentsManager(Teacher('Hakan Kutucu', 0, 1));
        final result = teacher.calculateNotes(students);

        expect(result, 300);

    });
}