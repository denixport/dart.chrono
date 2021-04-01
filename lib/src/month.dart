/// Month enum
class Month implements Comparable<Month> {
  static const Month january = Month._(1);
  static const Month february = Month._(2);
  static const Month march = Month._(3);
  static const Month april = Month._(4);
  static const Month may = Month._(5);
  static const Month june = Month._(6);
  static const Month july = Month._(7);
  static const Month august = Month._(8);
  static const Month september = Month._(9);
  static const Month october = Month._(10);
  static const Month november = Month._(11);
  static const Month december = Month._(12);

  static const values = <Month>[
    january,
    february,
    march,
    april,
    may,
    june,
    july,
    august,
    september,
    october,
    november,
    december,
  ];

  final int index;

  ///
  static int checkedValue(int month) {
    if (1 > month || month > 12) {
      throw RangeError.range(month, 1, 12, 'month');
    }
    return month;
  }

  const Month._(this.index);

  ///
  factory Month(int month) => values[checkedValue(month) - 1];

  ///
  bool operator ==(Object other) {
    if (other is Month) return index == other.index;
    return false;
  }

  int get hashCode => index;

  ///
  Month operator +(int months) =>
      values[(index + (((months % 12) + 12)) % 12) - 1];

  ///
  Month operator -(int months) =>
      values[(index + (-((months % 12) + 12)) % 12) - 1];

  ///
  int compareTo(Month other) => index - other.index;

  ///
  bool operator <=(Month other) => (index - other.index) <= 0;

  ///
  String toString() {
    const names = <String>[
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december',
    ];
    return names[index - 1];
  }
}
