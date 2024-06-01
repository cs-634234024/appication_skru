class MenusModel {
  String name;
  String image;
  String detail;
  String fullDetail;

  MenusModel({
    required this.name,
    required this.detail,
    required this.fullDetail,
    required this.image,
  });

  static List<MenusModel> getNews() {
    List<MenusModel> news = [];

    news.add(MenusModel(
      name: 'รอยร้าวแนวทแยงพาดเฉียง',
      detail: 'detail',
      fullDetail:
          'ลักษณะ: รอยร้าวอาจปรากฏบนเสาคอนกรีตเสริมเหล็ก อาจมีความกว้างและความลึกแตกต่างกันไป รูปร่างอาจเป็นเส้นตรง เฉียง หรือแตกแขนง',
      image: 'assets/images/cracks/dialog_cracks.jpg',
    ));
    news.add(MenusModel(
      name: 'รอยร้าวจากวัสดุเสื่อมสภาพ',
      detail: 'detail2',
      fullDetail:
          'ลักษณะ: รอยร้าวอาจปรากฏบนเสาคอนกรีตเสริมเหล็ก อาจมีความกว้างและความลึกแตกต่างกันไป รูปร่างอาจเป็นเส้นตรง เฉียง หรือแตกแขนง',
      image: 'assets/images/cracks/characteriestic_of_cracks.jpg',
    ));
    news.add(MenusModel(
      name: 'รอยร้าวบริเวณเสา',
      detail: 'detail3',
      fullDetail: 'fullDetail3',
      image: 'assets/images/cracks/crack_around_the_pole.jpg',
    ));

    news.add(MenusModel(
      name: 'รอยร้าวบนหลังคา',
      detail: 'detail4',
      fullDetail: 'fullDetail4',
      image: 'assets/images/cracks/crack_on_the_roof.jpg',
    ));

    news.add(MenusModel(
      name: 'รอยร้าวที่มีเหล็กสนิม',
      detail: 'detail5',
      fullDetail: 'fullDetail5',
      image: 'assets/images/cracks/tint.jpg',
    ));
    news.add(MenusModel(
      name: 'รอยร้าวแตกลายงา',
      detail: 'detail6',
      fullDetail: 'fullDetail6',
      image: 'assets/images/cracks/hairline_crack.jpg',
    ));
    news.add(MenusModel(
      name: 'รอยแตกบนถนน',
      detail: 'detail7',
      fullDetail: 'fullDetail7',
      image: 'assets/images/cracks/crack_in_the_road.jpg',
    ));
    news.add(MenusModel(
      name: 'รอยร้าวกลางคาน',
      detail: 'detail8',
      fullDetail: 'fullDetail8',
      image: 'assets/images/cracks/vertical_crack.jpg',
    ));

    return news;
  }
}
