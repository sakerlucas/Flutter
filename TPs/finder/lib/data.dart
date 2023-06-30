import 'package:faker/faker.dart';
import 'package:finder/models/bachelor.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

List<Bachelor> initBachelors() {
  List<Bachelor> bachelors = [];
  for (int i = 0; i < 30; i++) {
    String firstName;
    Gender gender;
    String image;
    String id = const Uuid().v4(options: {'rng': UuidUtil.cryptoRNG});

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

    bachelors
        .add(Bachelor(firstName, faker.person.lastName(), id, gender, image));
  }
  bachelors.shuffle();
  bachelors.shuffle();
  bachelors.shuffle();
  bachelors.shuffle();
  bachelors.shuffle();
  bachelors.shuffle();
  bachelors.shuffle();
  bachelors.shuffle();
  bachelors.shuffle();
  bachelors.shuffle();
  bachelors.shuffle();
  bachelors.shuffle();
  bachelors.shuffle();
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
