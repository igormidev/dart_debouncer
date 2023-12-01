/// Adds extensions to num (ie. int & double) to make creating durations simple:
///
/// ```
/// 200.ms // equivalent to Duration(milliseconds: 200)
/// 3.seconds // equivalent to Duration(milliseconds: 3000)
/// 1.5.days // equivalent to Duration(hours: 36)
/// ```
extension NumDurationExtensions on num {
  /// Returns a [Duration] with the value of the number in microseconds.
  Duration get microseconds => Duration(microseconds: round());

  /// Returns a [Duration] with the value of the number in milliseconds.
  /// Equal to [milliseconds] extension.
  Duration get ms => (this * 1000).microseconds;

  /// Returns a [Duration] with the value of the number in milliseconds.
  /// Equal to [ms] extension.
  Duration get milliseconds => (this * 1000).microseconds;

  /// Returns a [Duration] with the value of the number in seconds.
  Duration get seconds => (this * 1000 * 1000).microseconds;

  /// Returns a [Duration] with the value of the number in minutes.
  Duration get minutes => (this * 1000 * 1000 * 60).microseconds;

  /// Returns a [Duration] with the value of the number in hours.
  Duration get hours => (this * 1000 * 1000 * 60 * 60).microseconds;

  /// Returns a [Duration] with the value of the number in days.
  Duration get days => (this * 1000 * 1000 * 60 * 60 * 24).microseconds;
}
