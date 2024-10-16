class MyDuration {
  final int  _milliseconds;

  MyDuration(this._milliseconds);
  MyDuration.fromHours(int hours): this._milliseconds = hours * 3600000 {
    _validate();
  }
  MyDuration.fromMinutes(int minutes): this._milliseconds = minutes * 60000 {
    _validate();
  }
  MyDuration.fromSeconds(int seconds): this._milliseconds = seconds * 1000 {
    _validate();
  }
  
  void _validate() {
    if (_milliseconds < 0) {
      throw ArgumentError("Duration cannot be negative");
    }
  }

  @override
  bool operator >(MyDuration other) {
    return this._milliseconds > other._milliseconds;
  }

 @override
  MyDuration operator +(MyDuration other) {
    return new MyDuration(this._milliseconds + other._milliseconds);
  }

   @override
  MyDuration operator -(MyDuration other) {
    MyDuration myduration = new MyDuration(this._milliseconds - other._milliseconds);
    if (myduration._milliseconds >= 0) {
      return myduration;
    } else {
      throw ("Resulting duration cannot be negative");
    }
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
