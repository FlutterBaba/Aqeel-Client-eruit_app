import 'package:eruit_app/const.dart';
import 'package:eruit_app/pages/order_List_page_filter_popup.dart';
import 'package:eruit_app/provider/order_provider/order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/get_orders_model.dart';
import '../test_ui/product_list.dart';
import 'CreateOrder/create_order.dart';
import 'order_details_page.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});
  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  TextEditingController dateInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: kpColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CreateOrder(),
          ));
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
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
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/logo.png"),
              ),
              title: const Text("Order"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const OrderListPageFilterPopup(),
                      ),
                    );
                  },
                  icon: SvgPicture.asset("assets/icons/filter.svg"),
                )
              ],
            ),
            const SizedBox(height: 30),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2050),
                );
                if (pickedDate != null) {
                  setState(() {
                    dateInputController.text =
                        DateFormat('dd MMMM yyyy').format(pickedDate);
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 0.4),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dateInputController.text.isEmpty
                        ? const Text("Select")
                        : Text(dateInputController.text),
                    const Icon(Icons.arrow_drop_down_sharp)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Consumer<OrderProvider>(
                builder: (context, value, child) => StreamBuilder(
                  stream: value.getOrders(dateInputController).asStream(),
                  builder:
                      (context, AsyncSnapshot<List<GetOrdersModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemCount: value.getorderlist.length,
                        itemBuilder: (context, index) {
                          GetOrdersModel orderModel = value.getorderlist[index];
                          return CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OrderDetailsPage(
                                    orderNumber: orderModel.order!),
                              ));
                            },
                            child: ProductRowItem(
                              orderModel: orderModel,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
