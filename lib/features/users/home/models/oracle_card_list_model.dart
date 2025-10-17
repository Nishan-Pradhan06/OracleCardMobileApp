class OracleCardListModel {
  final String svgUrl;
  final String title;
  final String description;

  OracleCardListModel({
    required this.svgUrl,
    required this.title,
    required this.description,
  });
}

final List<OracleCardListModel> oracleCardList = [
  OracleCardListModel(
    svgUrl: "assets/icons/1.svg",
    title: "Lucky Color",
    description: "Discover your color of the day",
  ),
  OracleCardListModel(
    svgUrl: "assets/icons/2.svg",

    title: "Yes / No",
    description: "Get a divine answer instantly",
  ),
  OracleCardListModel(
    svgUrl: "assets/icons/3.svg",

    title: "Daily Guidance",
    description: "Reveal your message for today",
  ),
  OracleCardListModel(
    svgUrl: "assets/icons/4.svg",

    title: "Manifestation",
    description: "Focus your energy on goals",
  ),
  OracleCardListModel(
    svgUrl: "assets/icons/5.svg",

    title: "Relationship Insight",
    description: "Understand your connection better",
  ),
  OracleCardListModel(
    svgUrl: "assets/icons/6.svg",

    title: "Spiritual Path",
    description: "Align yourself with higher purpose",
  ),
];
