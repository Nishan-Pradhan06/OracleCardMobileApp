class EntryListModel {
  final String title;
  final String dateTime;
  final String description;

  EntryListModel({
    required this.title,
    required this.dateTime,
    required this.description,
  });
}

final List<EntryListModel> entries = [
  EntryListModel(
    title: 'Today, 10:30 AM',
    dateTime: 'Today\'s Reflection',
    description:
        'I pulled The Star card today and felt an immediate sense of hope and renewal fsfssfs esfs',
  ),
  EntryListModel(
    title: 'Today, 7:00 AM',
    dateTime: 'Morning Reflection',
    description:
        'I woke up feeling refreshed and pulled The Sun card. It reminded me to focus on gratitude and positivity.',
  ),
  EntryListModel(
    title: 'Yesterday, 8:15 PM',
    dateTime: 'Weekly Check-in',
    description:
        'This week has been challenging but I\'ve learned to trust my intuition more about the software.',
  ),
  EntryListModel(
    title: 'Monday, 5:45 PM',
    dateTime: 'Evening Thoughts',
    description:
        'Work was hectic today, but The Hermit card encouraged me to take some time alone and reset my mind.',
  ),
  EntryListModel(
    title: 'Sunday, 9:30 AM',
    dateTime: 'Weekend Reset',
    description:
        'I meditated on The Fool card, reminding myself to embrace new beginnings without fear.',
  ),
  EntryListModel(
    title: 'Saturday, 6:10 PM',
    dateTime: 'Daily Reflection',
    description:
        'The Tower card appeared, showing me that unexpected changes can be opportunities for growth.',
  ),
];
