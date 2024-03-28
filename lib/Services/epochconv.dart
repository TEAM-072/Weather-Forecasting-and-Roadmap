import 'dart:core';

String rtime = "", stime = "";

String risetime(int rt) {
  // Sample Unix epoch time in seconds
  int epochTimeInSeconds = rt;

  // Convert Unix epoch time to DateTime
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(epochTimeInSeconds * 1000).toLocal();

  // Extract time components (hour, minute, second) as strings
  List<String> timeComponents = [
    '${dateTime.hour}',
    '${dateTime.minute}',
    '${dateTime.second}'
  ];

  // Format each time component to ensure they are in two-digit format (e.g., 09 instead of 9)
  timeComponents =
      timeComponents.map((component) => component.padLeft(2, '0')).toList();

  // Join time components with a colon to form the time string
  String time = timeComponents.join(':');

  return time;
}

String setime(int st) {
  // Sample Unix epoch time in seconds
  int epochTimeInSeconds = st;

  // Convert Unix epoch time to DateTime
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(epochTimeInSeconds * 1000).toLocal();

  // Extract time components (hour, minute, second) as strings
  List<String> timeComponents = [
    '${dateTime.hour}',
    '${dateTime.minute}',
    '${dateTime.second}'
  ];

  // Format each time component to ensure they are in two-digit format (e.g., 09 instead of 9)
  timeComponents =
      timeComponents.map((component) => component.padLeft(2, '0')).toList();

  // Join time components with a colon to form the time string
  String time = timeComponents.join(':');

  return time;
}
