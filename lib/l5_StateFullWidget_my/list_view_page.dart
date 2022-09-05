import 'package:flutter/material.dart';
import 'package:flutter_18/l3_login_my/login_page.dart';

class ListviewPage extends StatefulWidget {
  const ListviewPage({Key? key}) : super(key: key);

  @override
  State<ListviewPage> createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  int total = 0; //Tổng số tiền hàng trong giỏ hàng
  int sumCount = 0;
  bool refresh = false;

  List<Item> listItem = [
    Item(name: 'item1', price: 10, subTotal: 0, number: 0),
    Item(name: 'item2', price: 20, subTotal: 0, number: 0),
    Item(name: 'item3', price: 30, subTotal: 0, number: 0),
    Item(name: 'item4', price: 40, subTotal: 0, number: 0),
    Item(name: 'item5', price: 10, subTotal: 0, number: 0),
    Item(name: 'item6', price: 120, subTotal: 0, number: 0),
    Item(name: 'item7', price: 120, subTotal: 0, number: 0),
    Item(name: 'item8', price: 130, subTotal: 0, number: 0),
    Item(name: 'item9', price: 140, subTotal: 0, number: 0),
    Item(name: 'item10', price: 210, subTotal: 0, number: 0),
    Item(name: 'item11', price: 110, subTotal: 0, number: 0),
    Item(name: 'item12', price: 310, subTotal: 0, number: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text('LisView'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  itemCount: listItem.length,
                  itemBuilder: (context, i) {
                    //i là tham số kiểu int của method itemBuilder : Biểu thị index của item
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 150,
                                  // color: Colors.amber,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    child: Image.asset(
                                      'assets/images/anh.jpeg',
                                      fit: BoxFit
                                          .fitHeight, //Để hình ảnh điền hết theo chiều cao
                                      width: 20,
                                      height: 30,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(listItem[i].name),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                listItem.removeAt(i);
                                                setState(() {
                                                  refresh = !refresh;
                                                });
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                      Text('Price: ${listItem[i].price}'),
                                      Text(//Tổng tiền của item hàng này
                                          'Sub Total: ${listItem[i].subTotal}'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Ships Free'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                  //khi bấm trừ 1 sản phẩm
                                                  onTap: () {
                                                    if (listItem[i].number >
                                                        0) {
                                                      listItem[i].number--;
                                                      listItem[i].subTotal =
                                                          listItem[i].subTotal -
                                                              listItem[i].price;
                                                      setState(() {
                                                        refresh = !refresh;
                                                        total = total -
                                                            listItem[i].price;
                                                        sumCount = sumCount - 1;
                                                      });
                                                    }
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: Colors.red,
                                                  )),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                  '${listItem[i].number}'), //Số lượng sản phẩm của item hàng
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              GestureDetector(
                                                  //Khi ấn cộng 1 sản phẩm
                                                  onTap: () {
                                                    listItem[i].number =
                                                        listItem[i].number + 1;
                                                    listItem[i].subTotal =
                                                        listItem[i].subTotal +
                                                            listItem[i].price;
                                                    setState(() {
                                                      refresh = !refresh;
                                                      total = total +
                                                          listItem[i].price;
                                                      sumCount = sumCount + 1;
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.green,
                                                  )),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  })),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Checkout Price:'),
                      Text('Rs. $total'), //Tổng số tiền của toàn bộ giỏ hàng
                      Text('Rs. $sumCount'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      color: Colors.red,
                      child: const Center(
                          child: Text(
                        'Checkout',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Item {
  String name;
  int price;
  int subTotal;
  int number;
  Item(
      {required this.name,
      required this.price,
      required this.subTotal,
      required this.number});
}
