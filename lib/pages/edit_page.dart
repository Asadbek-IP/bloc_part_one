import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditPage extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String id;
  const EditPage(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.id});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
