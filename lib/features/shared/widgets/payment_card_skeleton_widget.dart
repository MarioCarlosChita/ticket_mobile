import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaymentListCardSkeletonWidegt extends StatelessWidget {
  const PaymentListCardSkeletonWidegt({
    required this.itemCount,
    super.key,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) =>
          PaymentCardSkeletonWidget(
        hasMargin: index + 1 == 10,
      ),
    );
  }
}

class PaymentCardSkeletonWidget extends StatelessWidget {
  const PaymentCardSkeletonWidget({
    super.key,
    required this.hasMargin,
  });
  final bool hasMargin;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        margin: EdgeInsets.only(
          bottom: hasMargin ? kToolbarHeight + kFloatingActionButtonMargin : 8,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          color: Colors.grey.withOpacity(0.1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Jan.2023 Marc. 2023",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Pago",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "10,00€",
                style: TextStyle(
                  color: Colors.grey.withOpacity(
                    0.8,
                  ),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
