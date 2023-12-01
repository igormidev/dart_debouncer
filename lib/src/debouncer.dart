import 'dart:async';

class Debouncer {
  /// The debouncer class is used to debounce a function
  Debouncer({
    this.timerDuration = const Duration(seconds: 1),
  });

  Timer? _timer;

  /// The duration of the timer
  Duration timerDuration;

  final List<FutureOr<void> Function()> _onInitFuncs = [];
  final List<FutureOr<void> Function()> _onEndFuncs = [];

  /// Reset the debounce with a new function or first funcion.
  Future<void> resetDebounce(FutureOr<void> Function() execute) async {
    _timer?.cancel();
    for (final func in _onInitFuncs) {
      await func();
    }

    _timer = Timer(timerDuration, () async {
      await execute();
      for (final func in _onEndFuncs) {
        await func();
      }
    });
  }

  /// Update the timer with a new duration
  void updateTimer(Duration newDuration) {
    timerDuration = newDuration;
  }

  /// Add a function that will be executed `after`
  /// the [resetDebounce] executable function
  void addOnEndFunction(FutureOr<void> Function() func) {
    _onEndFuncs.add(func);
  }

  /// Add a function that will be executed `before`
  /// the [resetDebounce] executable function
  void addOnInitFunction(FutureOr<void> Function() func) {
    _onInitFuncs.add(func);
  }

  /// Will dispose the timer.
  ///
  /// ```dart
  /// Timer(...).cancel();
  /// ```
  void dispose() {
    _timer?.cancel();
  }
}
