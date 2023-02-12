import 'package:eruit_app/const.dart';
import 'package:eruit_app/extentions.dart';
import 'package:flutter/material.dart';

import '../models/get_orders_model.dart';

class ProductRowItem extends StatelessWidget {
  final GetOrdersModel orderModel;
  const ProductRowItem({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String color = orderModel.colorHexa!;
    return SafeArea(
      top: false,
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
                    "assets/images/image1.png",
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
                        Expanded(
                          child: Text(
                            orderModel.name.toString(),
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.circle_outlined,
                          size: 20,
                          color: color.toColor(),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '#Order No -${orderModel.order}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "orderModel.fromDate,",
                      style: TextStyle(
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
