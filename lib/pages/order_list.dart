import 'package:eruit_app/const.dart';
import 'package:eruit_app/pages/order_List_page_filter_popup.dart';
import 'package:eruit_app/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../models/order_model.dart';
import '../test_ui/product_list.dart';
import 'CreateOrder/create_order.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: OrderDropDown(),
            ),
            Expanded(
              child: authProvider.orderslist.isEmpty
                  ? const Text("No Order")
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      itemCount: authProvider.orderslist.length,
                      itemBuilder: (context, index) {
                        OrderModel orderModel = authProvider.orderslist[index];
                        return CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) =>
                            //       OrderDetailsPage(orderModel: orderModel),
                            // ));
                          },
                          child: ProductRowItem(
                            orderModel: orderModel,
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class OrderDropDown extends StatefulWidget {
  const OrderDropDown({super.key});
  @override
  State<OrderDropDown> createState() => _OrderDropDownState();
}

class _OrderDropDownState extends State<OrderDropDown> {
  String dropdownvalue = 'Select';

  // List of items in our dropdown menu
  var items = [
    'Select',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.4),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map(
                  (String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
                isExpanded: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
