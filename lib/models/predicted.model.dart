class PredictedModel {
  final String title;
  final String titleEng;
  final String logoImage;
  final List<String> detail;
  PredictedModel(
      {required this.title,
      required this.logoImage,
      required this.detail,
      required this.titleEng});

  static List<PredictedModel> getPredicted() {
    List<PredictedModel> detail = [];
    detail.add(PredictedModel(
      title: 'รอยร้าวแนวทแยงพาดเฉียง',
      titleEng: 'A diagonal crack runs across the center of the wall',
      logoImage: 'assets/images/cracks/dialog_crack.JPG',
      detail: [
        'ลักษณะ: รอยร้าวอาจปรากฏบนเสาคอนกรีตเสริมเหล็ก อาจมีความกว้างและความลึกแตกต่างกันไป รูปร่างอาจเป็นเส้นตรง เฉียง หรือแตกแขนง',
        'รอยร้าวที่เกิดบริเวณเสาบ้าน เสาอาคาร เกิดจากหลายสาเหตุ  ดังนี้                                                                    1. การออกแบบที่ไม่เหมาะสม: เสาอาจมีขนาดเล็กเกินไป ไม่สามารถรับน้ำหนักบรรทุกของโครงสร้างได้ การเสริมเหล็กไม่เพียงพอ การออกแบบฐานรากไม่เหมาะสม 2. แรงดึงเกินกำลัง: เกิดจากการรับน้ำหนักบรรทุกที่มากเกินไป เช่น ชั้นดาดฟ้าที่หนัก โครงสร้างหลังคาที่ใหญ่ เกิดจากแรงดันจากดินที่ไม่สม่ำเสมอ                                                             3. น้ำหนักบรรทุกที่มากเกินไป: เกิดจากการวางเฟอร์นิเจอร์หนักๆ ไว้บนชั้นดาดฟ้า เกิดจากการต่อเติมโครงสร้างโดยไม่ได้รับการออกแบบ                                                       4. ฐานรากทรุด: เกิดจากดินใต้ฐานรากทรุดตัวเกิดจากน้ำใต้ดินกัดเซาะดินใต้ฐานราก                                                        5. คอนกรีตเสื่อมสภาพ: เกิดจากการกัดกร่อนของเหล็กเสริมเกิดจากการเสื่อมสภาพของคอนกรีตตามธรรมชาติเกิดจากความชื้น อุณหภูมิที่เปลี่ยนแปลง                                                     6. การสั่นสะเทือน: เกิดจากแผ่นดินไหวเกิดจากการจราจรเกิดจากงานก่อสร้าง                                           7. รอยต่อ: เกิดจากรอยต่อระหว่างเสาและคานเกิดจากรอยต่อระหว่างเสาและฐานราก                                         8. อุณหภูมิที่เปลี่ยนแปลง: เกิดจากการขยายตัวและหดตัวของคอนกรีตตามอุณหภูมิ                                               9. ความชื้น:เกิดจากการซึมของน้ำเข้าคอนกรีตเกิดจากความชื้นในอากาศ',
        'อาจส่งผลต่อความแข็งแรงของโครงสร้าง เสาอาจหักพังได้อาจทำให้เกิดน้ำรั่วซึม อาจส่งผลต่อความสวยงามของอาคาร',
        'อาจจำเป็นต้องเสริมเหล็กเสา ซ่อมแซมรอยร้าว เปลี่ยนเสาใหม่ หรือปรับปรุงฐานราก'
      ],
    ));
    detail.add(PredictedModel(
      title: 'รอยร้าวจากวัสดุเสื่อมสภาพ',
      titleEng: 'Characteristics of cracks caused by deteriorated materials',
      logoImage: 'assets/images/main.png',
      detail: [
        'ลักษณะ: รอยร้าวอาจปรากฏบนเสาคอนกรีตเสริมเหล็ก อาจมีความกว้างและความลึกแตกต่างกันไป รูปร่างอาจเป็นเส้นตรง เฉียง หรือแตกแขนง',
        'รอยร้าวที่เกิดบริเวณเสาบ้าน เสาอาคาร เกิดจากหลายสาเหตุ  ดังนี้                                                                    1. การออกแบบที่ไม่เหมาะสม: เสาอาจมีขนาดเล็กเกินไป ไม่สามารถรับน้ำหนักบรรทุกของโครงสร้างได้ การเสริมเหล็กไม่เพียงพอ การออกแบบฐานรากไม่เหมาะสม 2. แรงดึงเกินกำลัง: เกิดจากการรับน้ำหนักบรรทุกที่มากเกินไป เช่น ชั้นดาดฟ้าที่หนัก โครงสร้างหลังคาที่ใหญ่ เกิดจากแรงดันจากดินที่ไม่สม่ำเสมอ                                                             3. น้ำหนักบรรทุกที่มากเกินไป: เกิดจากการวางเฟอร์นิเจอร์หนักๆ ไว้บนชั้นดาดฟ้า เกิดจากการต่อเติมโครงสร้างโดยไม่ได้รับการออกแบบ                                                       4. ฐานรากทรุด: เกิดจากดินใต้ฐานรากทรุดตัวเกิดจากน้ำใต้ดินกัดเซาะดินใต้ฐานราก                                                        5. คอนกรีตเสื่อมสภาพ: เกิดจากการกัดกร่อนของเหล็กเสริมเกิดจากการเสื่อมสภาพของคอนกรีตตามธรรมชาติเกิดจากความชื้น อุณหภูมิที่เปลี่ยนแปลง                                                     6. การสั่นสะเทือน: เกิดจากแผ่นดินไหวเกิดจากการจราจรเกิดจากงานก่อสร้าง                                           7. รอยต่อ: เกิดจากรอยต่อระหว่างเสาและคานเกิดจากรอยต่อระหว่างเสาและฐานราก                                         8. อุณหภูมิที่เปลี่ยนแปลง: เกิดจากการขยายตัวและหดตัวของคอนกรีตตามอุณหภูมิ                                               9. ความชื้น:เกิดจากการซึมของน้ำเข้าคอนกรีตเกิดจากความชื้นในอากาศ',
        'อาจส่งผลต่อความแข็งแรงของโครงสร้าง เสาอาจหักพังได้อาจทำให้เกิดน้ำรั่วซึม อาจส่งผลต่อความสวยงามของอาคาร',
        'อาจจำเป็นต้องเสริมเหล็กเสา ซ่อมแซมรอยร้าว เปลี่ยนเสาใหม่ หรือปรับปรุงฐานราก'
      ],
    ));
    detail.add(PredictedModel(
      title: 'รอยร้าวบริเวณเสา',
      titleEng: 'Cracks around the pole',
      logoImage: 'assets/images/main.png',
      detail: [
        'ลักษณะ: รอยร้าวอาจปรากฏบนเสาคอนกรีตเสริมเหล็ก อาจมีความกว้างและความลึกแตกต่างกันไป รูปร่างอาจเป็นเส้นตรง เฉียง หรือแตกแขนง',
        'รอยร้าวที่เกิดบริเวณเสาบ้าน เสาอาคาร เกิดจากหลายสาเหตุ  ดังนี้                                                                    1. การออกแบบที่ไม่เหมาะสม: เสาอาจมีขนาดเล็กเกินไป ไม่สามารถรับน้ำหนักบรรทุกของโครงสร้างได้ การเสริมเหล็กไม่เพียงพอ การออกแบบฐานรากไม่เหมาะสม 2. แรงดึงเกินกำลัง: เกิดจากการรับน้ำหนักบรรทุกที่มากเกินไป เช่น ชั้นดาดฟ้าที่หนัก โครงสร้างหลังคาที่ใหญ่ เกิดจากแรงดันจากดินที่ไม่สม่ำเสมอ                                                             3. น้ำหนักบรรทุกที่มากเกินไป: เกิดจากการวางเฟอร์นิเจอร์หนักๆ ไว้บนชั้นดาดฟ้า เกิดจากการต่อเติมโครงสร้างโดยไม่ได้รับการออกแบบ                                                       4. ฐานรากทรุด: เกิดจากดินใต้ฐานรากทรุดตัวเกิดจากน้ำใต้ดินกัดเซาะดินใต้ฐานราก                                                        5. คอนกรีตเสื่อมสภาพ: เกิดจากการกัดกร่อนของเหล็กเสริมเกิดจากการเสื่อมสภาพของคอนกรีตตามธรรมชาติเกิดจากความชื้น อุณหภูมิที่เปลี่ยนแปลง                                                     6. การสั่นสะเทือน: เกิดจากแผ่นดินไหวเกิดจากการจราจรเกิดจากงานก่อสร้าง                                           7. รอยต่อ: เกิดจากรอยต่อระหว่างเสาและคานเกิดจากรอยต่อระหว่างเสาและฐานราก                                         8. อุณหภูมิที่เปลี่ยนแปลง: เกิดจากการขยายตัวและหดตัวของคอนกรีตตามอุณหภูมิ                                               9. ความชื้น:เกิดจากการซึมของน้ำเข้าคอนกรีตเกิดจากความชื้นในอากาศ',
        'อาจส่งผลต่อความแข็งแรงของโครงสร้าง เสาอาจหักพังได้อาจทำให้เกิดน้ำรั่วซึม อาจส่งผลต่อความสวยงามของอาคาร',
        'อาจจำเป็นต้องเสริมเหล็กเสา ซ่อมแซมรอยร้าว เปลี่ยนเสาใหม่ หรือปรับปรุงฐานราก'
      ],
    ));
    detail.add(PredictedModel(
      title: 'รอยร้าวบนหลังคา',
      titleEng: 'Cracks on the roof',
      logoImage: 'assets/images/main.png',
      detail: [
        'ลักษณะ: รอยร้าวอาจปรากฏบนเสาคอนกรีตเสริมเหล็ก อาจมีความกว้างและความลึกแตกต่างกันไป รูปร่างอาจเป็นเส้นตรง เฉียง หรือแตกแขนง',
        'รอยร้าวที่เกิดบริเวณเสาบ้าน เสาอาคาร เกิดจากหลายสาเหตุ  ดังนี้                                                                    1. การออกแบบที่ไม่เหมาะสม: เสาอาจมีขนาดเล็กเกินไป ไม่สามารถรับน้ำหนักบรรทุกของโครงสร้างได้ การเสริมเหล็กไม่เพียงพอ การออกแบบฐานรากไม่เหมาะสม 2. แรงดึงเกินกำลัง: เกิดจากการรับน้ำหนักบรรทุกที่มากเกินไป เช่น ชั้นดาดฟ้าที่หนัก โครงสร้างหลังคาที่ใหญ่ เกิดจากแรงดันจากดินที่ไม่สม่ำเสมอ                                                             3. น้ำหนักบรรทุกที่มากเกินไป: เกิดจากการวางเฟอร์นิเจอร์หนักๆ ไว้บนชั้นดาดฟ้า เกิดจากการต่อเติมโครงสร้างโดยไม่ได้รับการออกแบบ                                                       4. ฐานรากทรุด: เกิดจากดินใต้ฐานรากทรุดตัวเกิดจากน้ำใต้ดินกัดเซาะดินใต้ฐานราก                                                        5. คอนกรีตเสื่อมสภาพ: เกิดจากการกัดกร่อนของเหล็กเสริมเกิดจากการเสื่อมสภาพของคอนกรีตตามธรรมชาติเกิดจากความชื้น อุณหภูมิที่เปลี่ยนแปลง                                                     6. การสั่นสะเทือน: เกิดจากแผ่นดินไหวเกิดจากการจราจรเกิดจากงานก่อสร้าง                                           7. รอยต่อ: เกิดจากรอยต่อระหว่างเสาและคานเกิดจากรอยต่อระหว่างเสาและฐานราก                                         8. อุณหภูมิที่เปลี่ยนแปลง: เกิดจากการขยายตัวและหดตัวของคอนกรีตตามอุณหภูมิ                                               9. ความชื้น:เกิดจากการซึมของน้ำเข้าคอนกรีตเกิดจากความชื้นในอากาศ',
        'อาจส่งผลต่อความแข็งแรงของโครงสร้าง เสาอาจหักพังได้อาจทำให้เกิดน้ำรั่วซึม อาจส่งผลต่อความสวยงามของอาคาร',
        'อาจจำเป็นต้องเสริมเหล็กเสา ซ่อมแซมรอยร้าว เปลี่ยนเสาใหม่ หรือปรับปรุงฐานราก'
      ],
    ));
    detail.add(PredictedModel(
      title: 'รอยร้าวที่มีเหล็กสนิม',
      titleEng: 'Cracks with a faint rust tint',
      logoImage: 'assets/images/main.png',
      detail: [
        'ลักษณะ: รอยร้าวอาจปรากฏบนเสาคอนกรีตเสริมเหล็ก อาจมีความกว้างและความลึกแตกต่างกันไป รูปร่างอาจเป็นเส้นตรง เฉียง หรือแตกแขนง',
        'รอยร้าวที่เกิดบริเวณเสาบ้าน เสาอาคาร เกิดจากหลายสาเหตุ  ดังนี้                                                                    1. การออกแบบที่ไม่เหมาะสม: เสาอาจมีขนาดเล็กเกินไป ไม่สามารถรับน้ำหนักบรรทุกของโครงสร้างได้ การเสริมเหล็กไม่เพียงพอ การออกแบบฐานรากไม่เหมาะสม 2. แรงดึงเกินกำลัง: เกิดจากการรับน้ำหนักบรรทุกที่มากเกินไป เช่น ชั้นดาดฟ้าที่หนัก โครงสร้างหลังคาที่ใหญ่ เกิดจากแรงดันจากดินที่ไม่สม่ำเสมอ                                                             3. น้ำหนักบรรทุกที่มากเกินไป: เกิดจากการวางเฟอร์นิเจอร์หนักๆ ไว้บนชั้นดาดฟ้า เกิดจากการต่อเติมโครงสร้างโดยไม่ได้รับการออกแบบ                                                       4. ฐานรากทรุด: เกิดจากดินใต้ฐานรากทรุดตัวเกิดจากน้ำใต้ดินกัดเซาะดินใต้ฐานราก                                                        5. คอนกรีตเสื่อมสภาพ: เกิดจากการกัดกร่อนของเหล็กเสริมเกิดจากการเสื่อมสภาพของคอนกรีตตามธรรมชาติเกิดจากความชื้น อุณหภูมิที่เปลี่ยนแปลง                                                     6. การสั่นสะเทือน: เกิดจากแผ่นดินไหวเกิดจากการจราจรเกิดจากงานก่อสร้าง                                           7. รอยต่อ: เกิดจากรอยต่อระหว่างเสาและคานเกิดจากรอยต่อระหว่างเสาและฐานราก                                         8. อุณหภูมิที่เปลี่ยนแปลง: เกิดจากการขยายตัวและหดตัวของคอนกรีตตามอุณหภูมิ                                               9. ความชื้น:เกิดจากการซึมของน้ำเข้าคอนกรีตเกิดจากความชื้นในอากาศ',
        'อาจส่งผลต่อความแข็งแรงของโครงสร้าง เสาอาจหักพังได้อาจทำให้เกิดน้ำรั่วซึม อาจส่งผลต่อความสวยงามของอาคาร',
        'อาจจำเป็นต้องเสริมเหล็กเสา ซ่อมแซมรอยร้าว เปลี่ยนเสาใหม่ หรือปรับปรุงฐานราก'
      ],
    ));
    detail.add(PredictedModel(
      title: 'รอยร้าวแตกลายงา',
      titleEng: 'Hairline Cracks',
      logoImage: 'assets/images/main.png',
      detail: [
        'ลักษณะ: รอยร้าวอาจปรากฏบนเสาคอนกรีตเสริมเหล็ก อาจมีความกว้างและความลึกแตกต่างกันไป รูปร่างอาจเป็นเส้นตรง เฉียง หรือแตกแขนง',
        'รอยร้าวที่เกิดบริเวณเสาบ้าน เสาอาคาร เกิดจากหลายสาเหตุ  ดังนี้                                                                    1. การออกแบบที่ไม่เหมาะสม: เสาอาจมีขนาดเล็กเกินไป ไม่สามารถรับน้ำหนักบรรทุกของโครงสร้างได้ การเสริมเหล็กไม่เพียงพอ การออกแบบฐานรากไม่เหมาะสม 2. แรงดึงเกินกำลัง: เกิดจากการรับน้ำหนักบรรทุกที่มากเกินไป เช่น ชั้นดาดฟ้าที่หนัก โครงสร้างหลังคาที่ใหญ่ เกิดจากแรงดันจากดินที่ไม่สม่ำเสมอ                                                             3. น้ำหนักบรรทุกที่มากเกินไป: เกิดจากการวางเฟอร์นิเจอร์หนักๆ ไว้บนชั้นดาดฟ้า เกิดจากการต่อเติมโครงสร้างโดยไม่ได้รับการออกแบบ                                                       4. ฐานรากทรุด: เกิดจากดินใต้ฐานรากทรุดตัวเกิดจากน้ำใต้ดินกัดเซาะดินใต้ฐานราก                                                        5. คอนกรีตเสื่อมสภาพ: เกิดจากการกัดกร่อนของเหล็กเสริมเกิดจากการเสื่อมสภาพของคอนกรีตตามธรรมชาติเกิดจากความชื้น อุณหภูมิที่เปลี่ยนแปลง                                                     6. การสั่นสะเทือน: เกิดจากแผ่นดินไหวเกิดจากการจราจรเกิดจากงานก่อสร้าง                                           7. รอยต่อ: เกิดจากรอยต่อระหว่างเสาและคานเกิดจากรอยต่อระหว่างเสาและฐานราก                                         8. อุณหภูมิที่เปลี่ยนแปลง: เกิดจากการขยายตัวและหดตัวของคอนกรีตตามอุณหภูมิ                                               9. ความชื้น:เกิดจากการซึมของน้ำเข้าคอนกรีตเกิดจากความชื้นในอากาศ',
        'อาจส่งผลต่อความแข็งแรงของโครงสร้าง เสาอาจหักพังได้อาจทำให้เกิดน้ำรั่วซึม อาจส่งผลต่อความสวยงามของอาคาร',
        'อาจจำเป็นต้องเสริมเหล็กเสา ซ่อมแซมรอยร้าว เปลี่ยนเสาใหม่ หรือปรับปรุงฐานราก'
      ],
    ));
    detail.add(PredictedModel(
      title: 'รอยแตกบนถนน',
      titleEng: 'cracks in the road',
      logoImage: 'assets/images/main.png',
      detail: [
        'ลักษณะ: รอยร้าวอาจปรากฏบนเสาคอนกรีตเสริมเหล็ก อาจมีความกว้างและความลึกแตกต่างกันไป รูปร่างอาจเป็นเส้นตรง เฉียง หรือแตกแขนง',
        'รอยร้าวที่เกิดบริเวณเสาบ้าน เสาอาคาร เกิดจากหลายสาเหตุ  ดังนี้                                                                    1. การออกแบบที่ไม่เหมาะสม: เสาอาจมีขนาดเล็กเกินไป ไม่สามารถรับน้ำหนักบรรทุกของโครงสร้างได้ การเสริมเหล็กไม่เพียงพอ การออกแบบฐานรากไม่เหมาะสม 2. แรงดึงเกินกำลัง: เกิดจากการรับน้ำหนักบรรทุกที่มากเกินไป เช่น ชั้นดาดฟ้าที่หนัก โครงสร้างหลังคาที่ใหญ่ เกิดจากแรงดันจากดินที่ไม่สม่ำเสมอ                                                             3. น้ำหนักบรรทุกที่มากเกินไป: เกิดจากการวางเฟอร์นิเจอร์หนักๆ ไว้บนชั้นดาดฟ้า เกิดจากการต่อเติมโครงสร้างโดยไม่ได้รับการออกแบบ                                                       4. ฐานรากทรุด: เกิดจากดินใต้ฐานรากทรุดตัวเกิดจากน้ำใต้ดินกัดเซาะดินใต้ฐานราก                                                        5. คอนกรีตเสื่อมสภาพ: เกิดจากการกัดกร่อนของเหล็กเสริมเกิดจากการเสื่อมสภาพของคอนกรีตตามธรรมชาติเกิดจากความชื้น อุณหภูมิที่เปลี่ยนแปลง                                                     6. การสั่นสะเทือน: เกิดจากแผ่นดินไหวเกิดจากการจราจรเกิดจากงานก่อสร้าง                                           7. รอยต่อ: เกิดจากรอยต่อระหว่างเสาและคานเกิดจากรอยต่อระหว่างเสาและฐานราก                                         8. อุณหภูมิที่เปลี่ยนแปลง: เกิดจากการขยายตัวและหดตัวของคอนกรีตตามอุณหภูมิ                                               9. ความชื้น:เกิดจากการซึมของน้ำเข้าคอนกรีตเกิดจากความชื้นในอากาศ',
        'อาจส่งผลต่อความแข็งแรงของโครงสร้าง เสาอาจหักพังได้อาจทำให้เกิดน้ำรั่วซึม อาจส่งผลต่อความสวยงามของอาคาร',
        'อาจจำเป็นต้องเสริมเหล็กเสา ซ่อมแซมรอยร้าว เปลี่ยนเสาใหม่ หรือปรับปรุงฐานราก'
      ],
    ));
    detail.add(PredictedModel(
      title: 'รอยร้าวกลางคาน',
      titleEng: 'vertical crack formed in the middle of the beam',
      logoImage: 'assets/images/main.png',
      detail: [
        'ลักษณะ: รอยร้าวอาจปรากฏบนเสาคอนกรีตเสริมเหล็ก อาจมีความกว้างและความลึกแตกต่างกันไป รูปร่างอาจเป็นเส้นตรง เฉียง หรือแตกแขนง',
        'รอยร้าวที่เกิดบริเวณเสาบ้าน เสาอาคาร เกิดจากหลายสาเหตุ  ดังนี้                                                                    1. การออกแบบที่ไม่เหมาะสม: เสาอาจมีขนาดเล็กเกินไป ไม่สามารถรับน้ำหนักบรรทุกของโครงสร้างได้ การเสริมเหล็กไม่เพียงพอ การออกแบบฐานรากไม่เหมาะสม 2. แรงดึงเกินกำลัง: เกิดจากการรับน้ำหนักบรรทุกที่มากเกินไป เช่น ชั้นดาดฟ้าที่หนัก โครงสร้างหลังคาที่ใหญ่ เกิดจากแรงดันจากดินที่ไม่สม่ำเสมอ                                                             3. น้ำหนักบรรทุกที่มากเกินไป: เกิดจากการวางเฟอร์นิเจอร์หนักๆ ไว้บนชั้นดาดฟ้า เกิดจากการต่อเติมโครงสร้างโดยไม่ได้รับการออกแบบ                                                       4. ฐานรากทรุด: เกิดจากดินใต้ฐานรากทรุดตัวเกิดจากน้ำใต้ดินกัดเซาะดินใต้ฐานราก                                                        5. คอนกรีตเสื่อมสภาพ: เกิดจากการกัดกร่อนของเหล็กเสริมเกิดจากการเสื่อมสภาพของคอนกรีตตามธรรมชาติเกิดจากความชื้น อุณหภูมิที่เปลี่ยนแปลง                                                     6. การสั่นสะเทือน: เกิดจากแผ่นดินไหวเกิดจากการจราจรเกิดจากงานก่อสร้าง                                           7. รอยต่อ: เกิดจากรอยต่อระหว่างเสาและคานเกิดจากรอยต่อระหว่างเสาและฐานราก                                         8. อุณหภูมิที่เปลี่ยนแปลง: เกิดจากการขยายตัวและหดตัวของคอนกรีตตามอุณหภูมิ                                               9. ความชื้น:เกิดจากการซึมของน้ำเข้าคอนกรีตเกิดจากความชื้นในอากาศ',
        'อาจส่งผลต่อความแข็งแรงของโครงสร้าง เสาอาจหักพังได้อาจทำให้เกิดน้ำรั่วซึม อาจส่งผลต่อความสวยงามของอาคาร',
        'อาจจำเป็นต้องเสริมเหล็กเสา ซ่อมแซมรอยร้าว เปลี่ยนเสาใหม่ หรือปรับปรุงฐานราก'
      ],
    ));

    return detail;
  }
}
