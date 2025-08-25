import 'package:flutter/material.dart';

class AddOrUpdateBt extends StatelessWidget {
  const AddOrUpdateBt({super.key, required this.isUpdate, this.onPressed});
  final bool isUpdate;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
      ),
      label: Text(
        isUpdate ? "Update" : "Add",
        style: const TextStyle(color: Colors.white),
      ),
      icon: Icon(
        isUpdate ? Icons.update : Icons.add,
        color: Colors.white,
      ),
    );
  }
}
