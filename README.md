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
Otherwise it will be executed even if you are not more in the context where it has been placed.

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
