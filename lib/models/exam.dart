class Exam {
  final String subject;
  final DateTime dateTime;
  final List<String> rooms;

  Exam({
    required this.subject,
    required this.dateTime,
    required this.rooms,
  });

 
  bool isPast() {
    return dateTime.isBefore(DateTime.now());
  }

  // Formatiram vreme
  String getFormattedTime() {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  // za datum
  String getFormattedDate() {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year;
    return '$day.$month.$year';
  }

  // presmetuvanje predostanato vreme
  String getTimeRemaining() {
    final now = DateTime.now();
    final difference = dateTime.difference(now);

    if (difference.isNegative) {
      return 'Испитот е завршен';
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24;

    return '$days дена, $hours часа';
  }
}