import 'package:flutter/material.dart';

class BottomSheetDraggableIndicator extends StatelessWidget {
  const BottomSheetDraggableIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 6,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
