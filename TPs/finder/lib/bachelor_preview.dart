import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:finder/bachelors_detail.dart';
import 'package:go_router/go_router.dart';

class BachelorsPreview extends StatelessWidget {
  const BachelorsPreview({
    Key? key,
    required this.bachelor,
  }) : super(key: key);

  final Bachelor bachelor;

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
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        context.go('/bachelor/${bachelor.id}');
      },
    );
  }
}
