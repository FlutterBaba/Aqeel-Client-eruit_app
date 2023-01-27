import 'dart:math';

import 'package:eruit_app/const.dart';
import 'package:eruit_app/data/data.dart';
import 'package:flutter/material.dart';

class ProductRowItem extends StatelessWidget {
  final OrderModel orderModel;
  const ProductRowItem({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      // bottom: false,
      minimum: const EdgeInsets.all(15),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xffffffff),
          ),
        ),
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    orderModel.image,
                    height: 76,
                    width: 76,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  height: 50,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "07",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        "Oct",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        const Text(
                          "Elimelech Meir",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.circle_outlined,
                          size: 17,
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '#Order No - ${orderModel.orderNo}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      orderModel.time,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: klightTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
