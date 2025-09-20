class HomeItem {
  final String svgUrl;
  final String title;
  final String description;

  HomeItem({
    required this.svgUrl,
    required this.title,
    required this.description,
  });
}

final List<HomeItem> homeItems = [
  HomeItem(
    svgUrl: "assets/svg/lucky_color.svg",
    title: "Lucky Color",
    description: "Discover your color",
  ),
  HomeItem(
    svgUrl: "assets/svg/qn.svg",
    title: "Yes/No",
    description: "Get an answer",
  ),
];
