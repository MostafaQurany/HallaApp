class TimeFormate {
  static String timeAgoSinceDate(DateTime dateString,
      {bool numericDates = true}) {
    DateTime date = dateString;
    final date2 = DateTime.now();
    final difference = date2.difference(date);
    
    // notification for year , mounth and day and now 
    if (difference.inDays > 100) {
      return '${date.day}/${date.month}/${date.year}';
    } else if (difference.inDays > 30) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
