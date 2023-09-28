import 'package:flutter/material.dart';
import 'package:free1/Screen/Home/Model/HomeModel.dart';
import 'package:free1/Utiles/ApiHelper.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeModel homeModel = HomeModel();

  List<ProductDatum>? data = [];

  @override
  void initState() {
    super.initState();

    apiCall();
  }

  Future<void> apiCall() async {
    homeModel = await ApiHelper.apiHelper.insertStudent();
    data = homeModel.data![0].productData;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50.sp,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          height: 300.sp,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.sp),
                                topRight: Radius.circular(30.sp),
                              )),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  data!.sort(
                                    (a, b) => a.name!.compareTo(b.name!),
                                  );

                                  setState(() {});
                                },
                                child: Text(
                                  "A to Z",
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // data!.sort(
                                  //   (a, b) =>
                                  //       a.minPrice!.compareTo(b.minPrice!),
                                  // );

                                  for (int i = 0; i < data!.length; i++) {
                                    data![i].minPrice!.codeUnitAt(i);
                                  }

                                  // data!.sort(
                                  // );

                                  setState(() {});
                                },
                                child: Text(
                                  "Prize Min To Max",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );

                      setState(() {});
                    },
                    icon: Icon(
                      Icons.filter_alt,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150.sp,
                    margin: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 120.sp,
                          width: 100.sp,
                          child: Image.network(
                            "https://s3.us-east-2.amazonaws.com/inunion/1661900951051.jpg",
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 15.sp,
                              width: 180.sp,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                data![index].name == null
                                    ? ""
                                    : "${data![index].name}",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            Container(
                              height: 15.sp,
                              width: 180.sp,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                data![index].minPrice == null
                                    ? ""
                                    : "Price :- ${data![index].minPrice}",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            Container(
                              height: 15.sp,
                              width: 180.sp,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                data![index].categoryName == null
                                    ? ""
                                    : "Category :- ${data![index].categoryName}",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            Container(
                              height: 15.sp,
                              width: 180.sp,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                data![index].deliveryCharge == null
                                    ? ""
                                    : "Category :- ${data![index].deliveryCharge}",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
