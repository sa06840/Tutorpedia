
class Announcement{
  late String header;
  late String date;
  late String body;

  Announcement({
    required this.header,
    required this.date,
    required this.body,
  });
}

List<Announcement> announcements = [
  Announcement(
    header: 'Announcement 1', 
    date: 'March 25, 2023', 
    body: 'jncjwniucen newncucni nwciniuc icuencunce'
  ),
  Announcement(
    header: 'Announcement 2', 
    date: 'March 26, 2023', 
    body: 'jncjwniucen newncucni nwciniuc icuencunce'
  ),
  Announcement(
    header: 'Announcement 3', 
    date: 'March 28, 2023', 
    body: 'jncjwniucen newncucni nwciniuc icuencunce'
  ),
  Announcement(
    header: 'Announcement 4', 
    date: 'March 28, 2023', 
    body: 'jncjwniucen newncucni nwciniuc icuencunce'
  ),
  Announcement(
    header: 'Announcement 5', 
    date: 'March 31, 2023', 
    body: 'jncjwniucen newncucni nwciniuc icuencunce'
  ),
];