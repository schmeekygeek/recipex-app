String getGreeting() {

  var dateTime = DateTime.now();

  if(dateTime.hour >= 17) {
    return "Good evening";
  }

  else if(dateTime.hour >= 12) {
    return "Good afternoon";
  }

  else if(dateTime.hour >= 4) {
    return "Good morning";
  }

  return "Good evening";
}
