<style>
.heading-1{
  font-size: 360%!important;
}
</style>

<h1 class="heading-1"><img align="center" height="60" src="https://raw.githubusercontent.com/igormidev/dart_debouncer/master/art/logo_image.png"> Dart debouncer</h1>

A package for creating debounce in dart will possibilities of multi instances debounce. With `no singleton pattern`, this package provides a convenient way to handle debouncing scenarios for user interactions, such as button presses or text input changes, in order to enhance the user experience and avoid unintended actions, unnecessary logic execution or frequent updates.

--- 

# How to use
First, instanciate a Debouncer class.<pr>
Notice: it is not a singletton so you have the option to create multiple instances of deboncer each one of them with one logic.
```dart
final Debouncer debouncer = Debouncer();
```

Then, in any place, use it. 
```dart
TextFormField(
  ...
  onChanged: (final String text) {
    decouncer.resetDebounce(() {
      // Do something with the text
    });
  },
),
```

# Don't forget to dispose the debounce timer after using it
```dart
debouncer.dispose();
```

⚠️ Note: Calling dispose `is not mandatory`. But if you don't dispose it the function will be executed even if you are not more in the context where it has been placed. So if, for example, the function inside the debouncer uses a dependencies that dosen't exist any more you will get an error. This will basically cancel the debounce timer and execution.

# Other helpfull functions

### Add a function that will be executed before debounce execute function
You can add how many functions you want. They will run in the order they where added.
```dart
debouncer.addOnInitFunction(() {
    print('start 1');
});
debouncer.addOnInitFunction(() {
    print('start 2');
});
```

### Add a function that will be executed after debounce execute function
You can add how many functions you want. They will run in the order they where added.
```dart
debouncer.addOnEndFunction(() {
    print('end 1');
});
debouncer.addOnEndFunction(() {
    print('end 2');
});
```

### Garantee an function will not bee runned in parallel to the debouncer function
Whant to run a function but ensure it won't run at the same time an asyncronous execute function is running on the debouncer? No problem, Use `garanteedExecutionAfterDebounceFinished` for that.
```dart
final debouncer = Debouncer(timerDuration: Duration(seconds: 1));

decouncer.resetDebounce(() {
  await Future.delayed(Duration(seconds: 1));
  print('Done!');
});

// Will not execute until debounce function is running. Will wait it finish first
debounter.garanteedExecutionAfterDebounceFinished(() {
  print('Only runned after 2 seconds');
});
print(isDebouncerRunning);
```

### Know if debounce function is active/running
```dart
final debouncer = Debouncer(timerDuration: Duration(seconds: 1));
final bool isDebouncerRunning = debounter.isTimerActive();
print(isDebouncerRunning);
```

### Change debounce duration
```dart
// The debouncer time is 1 sec
final debouncer = Debouncer(timerDuration: Duration(seconds: 1));

// Now the timer is 3 secs
debounder.updateTimer(Duration(seconds: 3));
``` 
### Duration extensions 
Extension methods for num, to make specifying durations easier. For example: 2.seconds, 0.1.minutes, or 300.ms.

---
Made with ❤ by [Igor Miranda](https://github.com/igormidev) <br>
If you like the package, give a 👍
