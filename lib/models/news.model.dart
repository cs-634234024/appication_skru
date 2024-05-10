class NewsModal {
  String name;
  String image;
  String detail;
  String fullDetail;

  NewsModal(
      {required this.name,
      required this.detail,
      required this.fullDetail,
      required this.image});

  static List<NewsModal> getNews() {
    List<NewsModal> news = [];

    news.add(NewsModal(
        name: 'เมนู 1',
        detail: 'detail',
        fullDetail: 'fullDetail',
        image: 'assets/images/image1.png'));
    news.add(NewsModal(
        name: 'เมนู 2',
        detail: 'detail2',
        fullDetail: 'fullDetail2',
        image: 'assets/images/image2.png'));
    news.add(NewsModal(
        name: 'เมนู 3',
        detail: 'detail3',
        fullDetail: 'fullDetail3',
        image: 'assets/images/image3.png'));

    news.add(NewsModal(
        name: 'เมนู 4',
        detail: 'detail4',
        fullDetail: 'fullDetail4',
        image: 'assets/images/image4.png'));

    news.add(NewsModal(
        name: 'เมนู 5',
        detail: 'detail5',
        fullDetail: 'fullDetail5',
        image: 'assets/images/image5.png'));
    news.add(NewsModal(
        name: 'เมนู 6',
        detail: 'detail6',
        fullDetail: 'fullDetail6',
        image: 'assets/images/image5.png'));
    news.add(NewsModal(
        name: 'เมนู 7',
        detail: 'detail7',
        fullDetail: 'fullDetail7',
        image: 'assets/images/image5.png'));
    news.add(NewsModal(
        name: 'เมนู 8',
        detail: 'detail8',
        fullDetail: 'fullDetail8',
        image: 'assets/images/image5.png'));

    return news;
  }
}
