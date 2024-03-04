import 'dart:async';

/// The main debouncer class used to create a debouncer
class Debouncer {
  /// The debouncer class is used to debounce a function
  Debouncer({
    this.timerDuration = const Duration(seconds: 1),
  });

  Timer? _timer;
  Completer<void> _isTimerComplete = Completer<void>();

  /// The duration of the timer
  Duration timerDuration;

  final List<FutureOr<void> Function()> _onInitFuncs = [];
  final List<FutureOr<void> Function()> _onEndFuncs = [];

  /// Reset the debounce with a new function or first funcion.
  Future<void> resetDebounce(FutureOr<void> Function() execute) async {
    _timer?.cancel();
    _timer = Timer(timerDuration, () async {
      for (final func in _onInitFuncs) {
        await func();
      }

      _isTimerComplete = Completer<void>();

      await execute();
      for (final func in _onEndFuncs) {
        await func();
      }
      _isTimerComplete.complete();
    });
  }

  /// Returns if the timer is currently active
  bool get isTimerActive => _timer?.isActive ?? false;

  /// If you wan't to execute a function and wan't to garantee that
  /// `if the debounce is active` the function will be executed only
  /// after the debounce if over
  Future<void> garanteedExecutionAfterDebounceFinished(
    FutureOr<void> Function() execute,
  ) async {
    await _isTimerComplete.future;
    await execute();
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
