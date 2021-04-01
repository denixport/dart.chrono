import 'package:chrono/chrono.dart';
import 'package:test/test.dart';

const leapYears = <int>[
  -500, 0, //
  -400, 1,
  -300, 0,
  -200, 0,
  -100, 0,
  0, 1, //
  100, 0,
  200, 0,
  300, 0,
  400, 1,
  500, 0,

  1900, 0,

  2000, 1,
  2001, 0,

  2007, 0,
  2008, 1,
  2009, 0,
  2010, 0,
  2011, 0,
  2012, 1,
];

const yearFormats = <int, String>{
  -9999: '-9999',
  -99: '-0099',
  -1: '-0001',
  0: '+0000',
  1: '0001',
  99: '0099',
  9999: '9999',
};

void main() {
  group('Year', () {
    test('throws on values out of range', () {
      expect(() => Year(-10000), throwsRangeError);
      expect(() => Year(10000), throwsRangeError);
    });

    test('correctly gets leap years', () {
      for (int i = 0; i < leapYears.length; i += 2) {
        int year = leapYears[i];
        int n = leapYears[i + 1];
        Year y = new Year(year);
        expect(y.isLeap, equals(n == 1));
        //expect(y.inDays, equals(365 + n));
      }
    });

    test('supports equality and hashCode', () {
      Year y1 = new Year(999);
      Year y2 = new Year(999);
      Year y3 = new Year(1999);
      expect(y1.value, 999);
      expect(y1.hashCode, 999);
      expect(y1, y2);
      expect(y1 == y3, false);
    });

    test('formats correctly', () {
      yearFormats.forEach((int y, String expected) {
        expect(new Year(y).toString(), equals(expected));
      });
    });
  });
}
