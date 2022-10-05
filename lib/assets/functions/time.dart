String timeAgo(DateTime dateTime) {
  Duration diff = DateTime.now().difference(dateTime);
  if (diff.inDays > 365) {
    if ((diff.inDays / 365).floor() == 1) return "a year ago";
    return "${(diff.inDays / 365).floor()} years ago";
  }
  if (diff.inDays > 30) {
    if ((diff.inDays / 30).floor() == 1) return "a month ago";
    return "${(diff.inDays / 30).floor()} months ago";
  }
  if (diff.inDays > 7) {
    if ((diff.inDays / 7).floor() == 1) return "a week ago";
    return "${(diff.inDays / 7).floor()} weeks ago";
  }
  if (diff.inDays > 0) {
    if (diff.inDays == 1) return "a day ago";
    return "${diff.inDays} days ago";
  }
  if (diff.inHours > 0) {
    if (diff.inHours == 1) return "an hour ago";
    return "${diff.inHours} hours ago";
  }
  if (diff.inMinutes > 0) {
    if (diff.inMinutes == 1) return "a minute ago";
    return "${diff.inMinutes} minutes ago";
  }
  return "just now";
}

String timeAgoNum(DateTime dateTime) {
  Duration diff = DateTime.now().difference(dateTime);
  if (diff.inDays > 365) {
    return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
  }
  if (diff.inDays > 30) {
    return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
  }
  if (diff.inDays > 7) {
    return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
  }
  if (diff.inDays > 0) {
    return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
  }
  if (diff.inHours > 0) {
    return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
  }
  if (diff.inMinutes > 0) {
    return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
  }
  return "just now";
}
