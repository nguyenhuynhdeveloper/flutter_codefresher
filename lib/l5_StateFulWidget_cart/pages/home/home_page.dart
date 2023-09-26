import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () async {
                  //Cách 1 :Để Naviagator sang màn hình khác
                  //Đè lên trên
                  // Chuyển màn bằng route trực tiếp
                  // final result = await Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (_) {
                  //       return CartPage();
                  //     },
                  //   ),
                  // // );
                  // print("hoan.dv: resulr is $result");

                  // // thay thế màn hiên tại
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (_) {
                  //       return CartPage();
                  //     },
                  //   ),
                  // );

                  // Cácg 2 cách chuyển màn = named 
                  final result =
                      await Navigator.of(context).pushNamed("cart_page");
                  print("hoan.dv: result is $result");
                },
                icon: const Icon(Icons.add_shopping_cart_outlined),
              ),
              const Positioned(
                top: 3,
                right: 3,
                child: Text('5'),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text('Tuí da ${index + 1}'),
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_shopping_cart_outlined),
                ),
              ],
            );
          }),
    );
  }
}
