String displayClass(String data) {
  String classData = '';
  if (data == 'A diagonal crack runs across the center of the wall') {
    classData = 'รอยร้าวแบบแนวทแยงพาดเฉียงกลางผนัง';
  } else if (data ==
      'Characteristics of cracks caused by deteriorated materials') {
    classData = 'รอยร้าวที่เกิดจากวัสดุเสื่อมสภาพ';
  } else if (data == 'Cracks around the pole') {
    classData = 'รอยร้าวบริเวณเสา';
  } else if (data == 'Cracks on the roof') {
    classData = 'รอยร้าวบนหลังคา';
  } else if (data == 'Cracks with a faint rust tint') {
    classData = 'รอยร้าวที่มีเหล็กสนิม';
  } else if (data == 'Hairline Cracks') {
    classData = 'test';
  } else if (data == 'cracks in the road') {
    classData = 'รอยแตกบนถนน';
  } else {
    classData = 'รอยร้าวกลางคาน';
  }
  return classData;
}
