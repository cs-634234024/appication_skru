class NewsModal {
  String name;
  String image;
  String detail;
  String fullDetail;

  NewsModal({
    required this.name,
    required this.detail,
    required this.fullDetail,
    required this.image,
  });

  static List<NewsModal> getNews() {
    List<NewsModal> news = [];

    news.add(NewsModal(
      name: 'รอยร้าวแนวทแยงพาดเฉียง',
      detail: 'detail',
      fullDetail: 'fullDetail',
      image: 'assets/images/skeleton.png',
    ));
    news.add(NewsModal(
      name: 'รอยร้าวจากวัสดุเสื่อมสภาพ',
      detail: 'detail2',
      fullDetail: 'fullDetail2',
      image: 'assets/images/skeleton.png',
    ));
    news.add(NewsModal(
      name: 'รอยร้าวบริเวณเสา',
      detail: 'detail3',
      fullDetail: 'fullDetail3',
      image: 'assets/images/skeleton.png',
    ));

    news.add(NewsModal(
      name: 'รอยร้าวบนหลังคา',
      detail: 'detail4',
      fullDetail: 'fullDetail4',
      image: 'assets/images/skeleton.png',
    ));

    news.add(NewsModal(
      name: 'รอยร้าวที่มีเหล็กสนิม',
      detail: 'detail5',
      fullDetail: 'fullDetail5',
      image: 'assets/images/skeleton.png',
    ));
    news.add(NewsModal(
      name: 'เมนู 6',
      detail: 'detail6',
      fullDetail: 'fullDetail6',
      image: 'assets/images/skeleton.png',
    ));
    news.add(NewsModal(
      name: 'รอยแตกบนถนน',
      detail: 'detail7',
      fullDetail: 'fullDetail7',
      image: 'assets/images/skeleton.png',
    ));
    news.add(NewsModal(
      name: 'รอยร้าวกลางคาน',
      detail: 'detail8',
      fullDetail: 'fullDetail8',
      image: 'assets/images/skeleton.png',
    ));

    return news;
  }
}
