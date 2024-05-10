String formateDateTime(String date) {
  DateTime dateTime = DateTime.parse(date);
  String formattedDate =
      '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
  String formattedTime =
      '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} น.';

  String formattedDateTime = '$formattedDate ($formattedTime)';

  return formattedDateTime;
}
