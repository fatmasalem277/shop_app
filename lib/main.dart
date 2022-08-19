import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/products_screen.dart';
import 'productmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Dio dio = Dio();
  String url = 'https://fakestoreapi.com/products';
  List<dynamic> productmodel = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<List<dynamic>> getData() async {
    Response response = await dio.get(url);
    print(response.data);
    print(response.statusCode);
    productmodel = response.data
        .map((product) => ProductModels.fromJson(product))
        .toList();
    return productmodel;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Promoted Products',
              style: TextStyle(color: Colors.black),
            ),
            leading: Icon(Icons.shopping_cart, color: Colors.black),
          ),
          body: Container(
              color: Color(0x1fc2baba),
              child: FutureBuilder(
                  future: getData(),
                  builder: ((context, snapshot) {
                    return snapshot.hasData
                        ? Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 10),
                          itemCount: productmodel.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: GridTile(
                                child: Image.network(
                                    productmodel[index].image!),
                                footer: Container(
                                    alignment: Alignment.center,
                                    color: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: (Text(
                                      '${productmodel[index].title!} ${productmodel[index].price!}',
                                      textAlign: TextAlign.center,
                                    ))),
                              ),
                            );
                          }),
                    )
                        : Center(child: CupertinoActivityIndicator());
                  })))),
    );
  }
}
