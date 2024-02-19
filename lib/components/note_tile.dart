import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function() onEditPressed;
  final void Function() onDeletePressed;

  const NoteTile({super.key, required this.text, required this.onEditPressed, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: GestureDetector(
        onTap: () {
          //show dialog with note content
        },
        child: ListTile(
          title: Text(text, style: const TextStyle(color: Colors.white),maxLines: 1, softWrap: true,overflow: TextOverflow.ellipsis,),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => onEditPressed(),
                icon: const Icon(Icons.edit, color: Colors.white,),
              ),
              IconButton(
                onPressed: () => onDeletePressed(),
                icon: const Icon(Icons.delete, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
