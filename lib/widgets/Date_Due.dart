import 'package:flutter/material.dart';
import '../routes/home/components/ValueDate.dart';

class Date_Due extends StatelessWidget {
  Date_Due({
    required this.function,
    required this.index_begin,
    required this.index_end,
    Key? key,
  }) : super(key: key);
  int index_begin;
  int index_end;
  Function function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = index_begin; i < index_end; i++) ValueDate(index: i),
          ],
        ),
      ),
    );
  }
}
