import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:finder/bachelors_detail.dart';

class BachelorsPreview extends StatelessWidget {
  const BachelorsPreview(
      {Key? key,
      required this.bachelor,
      required this.bachelorsLikes,
      required this.like})
      : super(key: key);

  final Bachelor bachelor;
  final bool bachelorsLikes;
  final VoidCallback like;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(bachelor.avatar),
        backgroundColor: bachelor.gender == Gender.male
            ? const Color.fromARGB(255, 168, 245, 255)
            : const Color.fromARGB(255, 255, 189, 211),
      ),
      title: Text(bachelor.firstName),
      subtitle: Text(bachelor.lastName),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BachelorsDetails(
                bachelor: bachelor, like: like, bachelorsLikes: bachelorsLikes),
          ),
        );
      },
    );
  }
}
