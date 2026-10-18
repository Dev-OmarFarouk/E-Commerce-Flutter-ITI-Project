import 'package:flutter/material.dart';

// widget منفصل للمقاسات: شايل الاختيار جواه وبيبلغ اللي بره
// المختار الـ border والرقم بتاعه purple زي الـ theme
class SizeSelector extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String initialValue;

  const SizeSelector({
    super.key,
    this.onChanged,
    this.initialValue = '10',
  });

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String size;

  @override
  void initState() {
    super.initState();
    size = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    List<String> options = ["8", "10", "38", "40"];

    return Row(
      children: [
        for (String item in options)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    size = item;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(item);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: size == item
                          ? const Color(0xff6055D8)
                          : Colors.grey.shade300,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: size == item
                          ? const Color(0xff6055D8)
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
