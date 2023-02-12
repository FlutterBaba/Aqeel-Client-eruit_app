import 'package:eruit_app/const.dart';
import 'package:eruit_app/provider/order_provider/order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailsPage extends StatefulWidget {
  final int orderNumber;
  const OrderDetailsPage({
    super.key,
    required this.orderNumber,
  });
  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final double convertHeight = 190;
  final double signleOrderHeight = 80;
  bool switchBool = false;
  OrderProvider? orderProvider;
  @override
  void initState() {
    OrderProvider authProvider =
        Provider.of<OrderProvider>(context, listen: false);
    authProvider.getOrderDetailsById(ordernumber: widget.orderNumber);
    super.initState();
  }

  Widget buildCoverImage() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/image1.png"),
        ),
      ),
      height: convertHeight,
      width: double.infinity,
    );
  }

  Widget buildOrderItem() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width - 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 24,
            color: const Color(0xff000000).withOpacity(0.1),
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            width: 60,
            decoration: BoxDecoration(
              color: kpColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
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
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    orderProvider!.getdetails!.booking!.name.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.circle_outlined,
                    size: 17,
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                '#Order number',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: klightTextColor,
                ),
              ),
              Text(
                orderProvider!.getdetails!.order.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  value: switchBool,
                  onChanged: (va) {
                    setState(() {
                      switchBool = va;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.notifications_none_rounded),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: switchBool,
                      onChanged: (va) {
                        setState(() {
                          switchBool = va;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTop() {
    double bottom = signleOrderHeight / 2;
    double top = convertHeight - signleOrderHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildOrderItem(),
        ),
      ],
    );
  }

  Widget buildListTile() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text(
                  "Hall",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  orderProvider!.getdetails!.booking!.name.toString(),
                  style: const TextStyle(color: ktextColor),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text(
                  "Booking number",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  orderProvider!.getdetails!.booking!.bookingNumber.toString(),
                  style: const TextStyle(color: ktextColor),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text(
                  "Last updated",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  orderProvider!.getdetails!.lastUpdate.toString(),
                  style: const TextStyle(color: ktextColor),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text(
                  "Order date",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  orderProvider!.getdetails!.dateOrder.toString(),
                  style: const TextStyle(color: ktextColor),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text(
                  "Event from time",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  orderProvider!.getdetails!.events![0].fromTime.toString(),
                  style: const TextStyle(color: ktextColor),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text(
                  "Event to time",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  orderProvider!.getdetails!.events![0].toTime!,
                  style: const TextStyle(color: ktextColor),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text(
                  "Last user",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  orderProvider!.getdetails!.lastUser.toString(),
                  style: const TextStyle(color: ktextColor),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text(
                  "Phone number",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  orderProvider!.getdetails!.booking!.number.toString(),
                  style: const TextStyle(color: ktextColor),
                ),
              ),
            )
          ],
        ),
        ListTile(
          title: const Text(
            "Email",
            style: TextStyle(color: klightTextColor),
          ),
          subtitle: Text(
            orderProvider!.getdetails!.booking!.emailAdress.toString(),
            style: const TextStyle(color: ktextColor),
          ),
        ),
        const Divider(color: Colors.white),
        Row(
          children: const [
            Expanded(
              child: ListTile(
                title: Text(
                  "VAT",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  "Include VAT",
                  style: TextStyle(color: ktextColor),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  "Total Before discount",
                  style: TextStyle(color: klightTextColor, fontSize: 14),
                ),
                subtitle: Text(
                  "220,132.00",
                  style: TextStyle(
                    color: ktextColor,
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: const [
            Expanded(
              child: ListTile(
                title: Text(
                  "discount_2",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  "51.11",
                  style: TextStyle(color: ktextColor),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  "t_sum",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  "188,103.32",
                  style: TextStyle(color: ktextColor),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            const Expanded(
              child: ListTile(
                title: Text(
                  "t_mam_sum",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  "188,103.32",
                  style: TextStyle(color: ktextColor),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text(
                  "sum_total",
                  style: TextStyle(color: klightTextColor),
                ),
                subtitle: Text(
                  orderProvider!.getdetails!.sumTotal.toString(),
                  style: const TextStyle(color: ktextColor),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Edit"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/background.png"),
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text("Order"),
              leading: const BackButton(),
              // leading: IconButton(
              //   icon: Image.asset('assets/logo.png'),
              //   onPressed: () {},
              // ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        buildTop(),
                        const SizedBox(
                          height: 20,
                        ),
                        buildListTile(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
