import 'package:expensesmanager/screen/add/controller/add_controller.dart';
import 'package:expensesmanager/screen/home/controller/home_controller.dart';
import 'package:expensesmanager/screen/update/controller/update_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AccountMScreen extends StatefulWidget {
  const AccountMScreen({Key? key}) : super(key: key);

  @override
  State<AccountMScreen> createState() => _AccountMScreenState();
}

class _AccountMScreenState extends State<AccountMScreen> {
  HomeController homeController = Get.put(HomeController());
  AddController addController = Get.put(AddController());
  UpdateController updateController = Get.put(UpdateController() );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff17CEA0),
                  Color(0xff48F1C6),
                ]),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Icon(
                          Icons.close,
                          size: 20.sp,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.money_dollar_circle,
                        size: 25.sp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "Cash",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 25.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "INR",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 35.sp),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "${homeController.cashin.value -
                            homeController.cashex.value}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 35.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.all(13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Income",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "${homeController.cashin}.00",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Indian Rupee",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "${homeController.cashint}",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Transactions",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/add');
                                addController.inex.value = "Income";
                                addController.pymethod.value = "Cash";
                              },
                              child: Container(
                                height: 5.h,
                                width: 43.w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xff17CEA0),
                                    Color(0xff48F1C6),
                                  ]),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                alignment: Alignment.center,
                                child: Text("Add Income",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.sp)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.all(13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Expenses",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "${homeController.cashex}.00",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Indian Rupee",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "${homeController.cashext}",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Transactions",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/add');
                                addController.inex.value = "Expense";
                                addController.pymethod.value = "Cash";
                              },
                              child: Container(
                                height: 5.h,
                                width: 43.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                alignment: Alignment.center,
                                child: Text("Add Expense",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.sp)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, 1.2),
              child: Container(
                height: 45.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff111113),
                    borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cash Transactions",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>(homeController.transactionList[index]['pytype']=="Cash")? InkWell(
                          onTap: () {
                            updateController.index.value = homeController.transactionList[index]['id'];
                            updateController.inex.value=homeController.transactionList[index]['type'];
                            updateController.pymethod.value=homeController.transactionList[index]['pytype'];
                            updateController.amt.value=homeController.transactionList[index]['amt'];
                            updateController.hou!.value=int.parse(homeController.transactionList[index]['hou']);
                            updateController.min!.value=int.parse(homeController.transactionList[index]['min']);
                            updateController.txtamo.text=homeController.transactionList[index]['amt'];
                            updateController.year.value=homeController.transactionList[index]['year'];
                            updateController.mon.value=(homeController.transactionList[index]['month']);
                            updateController.dateint.value=homeController.transactionList[index]['date'];
                            updateController.txttitle.text=homeController.transactionList[index]['title'];
                            updateController.txtdes.text=homeController.transactionList[index]['des'];
                            updateController.cat.value=homeController.transactionList[index]['category'];
                            updateController.d1 = DateTime.tryParse(homeController.transactionList[index]['d1']);
                            updateController.t1 = TimeOfDay(hour: int.parse(homeController.transactionList[index]['hou']),minute: int.parse(homeController.transactionList[index]['min']));
                            Get.toNamed('/update');
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.black,),
                                        child: homeController.transactionList[index]['pytype']=="Cash"?Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(CupertinoIcons.money_dollar_circle,size: 15.sp,color: Colors.white,),
                                            SizedBox(width: 5,),
                                            Text("Cash",style: TextStyle(color: Colors.white,fontSize: 15.sp),)
                                          ],
                                        ):Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.comment_bank,color: Colors.white,size: 15.sp,),
                                            SizedBox(width: 5,),
                                            Text("Bank",style: TextStyle(color: Colors.white,fontSize: 15.sp),)
                                          ],
                                        ),
                                      ),
                                      homeController.transactionList[index]['type']=="Transfer"?Container():homeController.transactionList[index]['category']==""?Container():Container(
                                        padding: EdgeInsets.all(12),
                                        margin: EdgeInsets.only(left: 2.w),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.black,),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("${homeController.transactionList[index]['category']}",style: TextStyle(color: Colors.white,fontSize: 15.sp),)
                                          ],
                                        ),
                                      ),
                                      homeController.transactionList[index]['type']=="Transfer"?Container(
                                        padding: EdgeInsets.all(12),
                                        margin: EdgeInsets.only(left: 2.w),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.black,),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Transfer",style: TextStyle(color: Colors.white,fontSize: 15.sp),)
                                          ],
                                        ),
                                      ):Container(),
                                    ],
                                  ),
                                  homeController.transactionList[index]['title']==""?Container():Container(margin: EdgeInsets.symmetric(vertical: 1.h),child: Text("${homeController.transactionList[index]['title']}",style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight: FontWeight.w600),)),
                                  SizedBox(height: 1.h,),
                                  homeController.transactionList[index]['type']=="Transfer"? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(colors: [
                                              Color(0xff6A4DDF),
                                              Color(0xff6A4DFF),
                                            ])),
                                        child:  homeController.transactionList[index]['category']=="Income"?Icon(Icons.download,color: Colors.white,size: 20.sp):Icon(Icons.upload,color: Colors.white,size: 20.sp),
                                      ),
                                      SizedBox(width: 3.w,),
                                      Text("${homeController.transactionList[index]['amt']}",style: TextStyle(color: Color(0xff6A4DDF),fontSize: 18.sp,fontWeight: FontWeight.w600),)
                                    ],
                                  ): homeController.transactionList[index]['type']=="Income"?Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(colors: [
                                              Color(0xff17CEA0),
                                              Color(0xff48F1C6),
                                            ])),
                                        child: Icon(Icons.download,color: Colors.white,size: 20.sp),
                                      ),
                                      SizedBox(width: 3.w,),
                                      Text("${homeController.transactionList[index]['amt']}",style: TextStyle(color: Color(0xff17CEA0),fontSize: 18.sp,fontWeight: FontWeight.w600),)
                                    ],
                                  ):Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(colors: [
                                              Color(0xffF7F7F7),
                                              Color(0xff97969C),
                                            ])),
                                        child: Icon(Icons.upload,color: Colors.black,size: 20.sp),
                                      ),
                                      SizedBox(width: 3.w,),
                                      Text("${homeController.transactionList[index]['amt']}",style: TextStyle(color: Color(0xff97969C),fontSize: 18.sp,fontWeight: FontWeight.w600),)
                                    ],
                                  ),
                                ],
                              )),
                        ):Container(),
                        physics: BouncingScrollPhysics(),
                        itemCount: homeController.transactionList.length,
                      ),
                    ),
                    SizedBox(height: 3.h,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
