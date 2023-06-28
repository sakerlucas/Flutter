import 'package:faker/faker.dart';
import 'package:finder/models/bachelor.dart';

List<Bachelor> initBachelors() {
  List<Bachelor> bachelors = [];
  for (int i = 0; i < 30; i++) {
    String firstName;
    Gender gender;
    String image;

    if (i < 15) {
      firstName = maleFirstNames[i];
      gender = Gender.male;
      image = "images/man-${i + 1}.png";
      // print(image);
    } else {
      firstName = femaleFirstNames[i - 15];
      gender = Gender.female;
      image = "images/woman-${i + 1 - 15}.png";
      // print(image);
    }

    bachelors.add(Bachelor(firstName, faker.person.lastName(), gender, image));
  }
  return bachelors;
}

List<String> maleFirstNames = [
  'Liam',
  'Noah',
  'William',
  'James',
  'Oliver',
  'Benjamin',
  'Elijah',
  'Lucas',
  'Mason',
  'Logan',
  'Alexander',
  'Ethan',
  'Jacob',
  'Michael',
  'Daniel'
];
List<String> femaleFirstNames = [
  'Emma',
  'Olivia',
  'Ava',
  'Isabella',
  'Sophia',
  'Charlotte',
  'Mia',
  'Amelia',
  'Harper',
  'Evelyn',
  'Abigail',
  'Emily',
  'Elizabeth',
  'Mila',
  'Ella'
];
