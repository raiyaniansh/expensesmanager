import 'dart:async';

import 'package:expensesmanager/screen/home/controller/home_controller.dart';
import 'package:expensesmanager/screen/update/controller/update_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  HomeController homeController = Get.put(HomeController());
  UpdateController updateController = Get.put(UpdateController());

  @override
  void initState() {
    super.initState();
    homeController.filterTransaction();
    homeController.date.value =
        "${homeController.txtdatef.text} to ${homeController.txtdatet.text}";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff111113),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Color(0xff111113),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white70)),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  ),
                  Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {
                      homeController.redcat();
                      homeController.redexcat();
                      showModalBottomSheet(
                        barrierColor: Colors.white24,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => Container(
                          height: 85.h,
                          decoration: BoxDecoration(
                            color: Color(0xff111113),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(
                                "    Date Filter",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeController.month.length,
                                  itemBuilder: (context, index) => Obx(
                                    () => InkWell(
                                      onTap: () {
                                        homeController.monthf.value =
                                            homeController.month[index];
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        margin:
                                            EdgeInsets.only(top: 20, left: 15),
                                        decoration: BoxDecoration(
                                            color: homeController.monthf ==
                                                    homeController.month[index]
                                                ? Colors.white38
                                                : Color(0xff111113),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                                color: Colors.white70)),
                                        child: Text(
                                          "${homeController.month[index]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "    Date Filter",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                height: 9.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(colors: [
                                      Colors.white10,
                                      Colors.white10,
                                    ])),
                                padding: EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 25.sp,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Container(
                                      width: 70.w,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600),
                                        controller: homeController.txtdatef,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "From Date",
                                          hintStyle: TextStyle(
                                              color: Colors.white24,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                height: 9.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(colors: [
                                      Colors.white10,
                                      Colors.white10,
                                    ])),
                                padding: EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 25.sp,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Container(
                                      width: 70.w,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600),
                                        controller: homeController.txtdatet,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "To Date",
                                          hintStyle: TextStyle(
                                              color: Colors.white24,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "    Category Filter",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        homeController.cat.value = "";
                                        homeController.type.value = "ALL";
                                      },
                                      child: Obx(
                                        () => Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 8),
                                          margin: EdgeInsets.only(
                                              top: 10, left: 15),
                                          decoration: BoxDecoration(
                                              color:
                                                  homeController.type.value ==
                                                          "ALL"
                                                      ? Colors.white38
                                                      : Color(0xff111113),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color: Colors.white70)),
                                          child: Text(
                                            "ALL",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        homeController.cat.value = "";
                                        homeController.type.value = "Income";
                                      },
                                      child: Obx(
                                        () => Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 8),
                                          margin: EdgeInsets.only(
                                              top: 10, left: 15),
                                          decoration: BoxDecoration(
                                              color:
                                                  homeController.type.value ==
                                                          "Income"
                                                      ? Colors.white38
                                                      : Color(0xff111113),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color: Colors.white70)),
                                          child: Text(
                                            "Income",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        homeController.cat.value = "";
                                        homeController.type.value = "Expense";
                                      },
                                      child: Obx(
                                        () => Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 8),
                                          margin: EdgeInsets.only(
                                              top: 10, left: 15),
                                          decoration: BoxDecoration(
                                              color:
                                                  homeController.type.value ==
                                                          "Expense"
                                                      ? Colors.white38
                                                      : Color(0xff111113),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color: Colors.white70)),
                                          child: Text(
                                            "Expense",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        homeController.cat.value = "";
                                        homeController.type.value = "Transfer";
                                      },
                                      child: Obx(
                                        () => Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 8),
                                          margin: EdgeInsets.only(
                                              top: 10, left: 15),
                                          decoration: BoxDecoration(
                                              color:
                                                  homeController.type.value ==
                                                          "Transfer"
                                                      ? Colors.white38
                                                      : Color(0xff111113),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color: Colors.white70)),
                                          child: Text(
                                            "Transfer",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "    payment type",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        homeController.pytype.value = "ALL";
                                      },
                                      child: Obx(
                                        () => Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 8),
                                          margin: EdgeInsets.only(
                                              top: 10, left: 15),
                                          decoration: BoxDecoration(
                                              color:
                                                  homeController.pytype.value ==
                                                          "ALL"
                                                      ? Colors.white38
                                                      : Color(0xff111113),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color: Colors.white70)),
                                          child: Text(
                                            "ALL",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        homeController.pytype.value = "Cash";
                                      },
                                      child: Obx(
                                        () => Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 8),
                                          margin: EdgeInsets.only(
                                              top: 10, left: 15),
                                          decoration: BoxDecoration(
                                              color:
                                                  homeController.pytype.value ==
                                                          "Cash"
                                                      ? Colors.white38
                                                      : Color(0xff111113),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color: Colors.white70)),
                                          child: Text(
                                            "Cash",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        homeController.pytype.value = "Bank";
                                      },
                                      child: Obx(
                                        () => Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 8),
                                          margin: EdgeInsets.only(
                                              top: 10, left: 15),
                                          decoration: BoxDecoration(
                                              color:
                                                  homeController.pytype.value ==
                                                          "Bank"
                                                      ? Colors.white38
                                                      : Color(0xff111113),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color: Colors.white70)),
                                          child: Text(
                                            "Bank",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Obx(
                                () => (homeController.type.value == "Income" ||
                                        homeController.type.value == "Expense")
                                    ? Text(
                                        "    ${homeController.type.value} type",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Obx(
                                () => (homeController.type.value == "Income" ||
                                        homeController.type.value == "Expense")
                                    ? (homeController.type.value == "Expense")
                                        ? Expanded(
                                            child: ListView.builder(
                                            itemCount:
                                                homeController.catlistex.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () {
                                                if (homeController.cat.value ==
                                                    "") {
                                                  homeController.cat.value =
                                                      homeController
                                                              .catlistex[index]
                                                          ['title'];
                                                } else {
                                                  homeController.cat.value = "";
                                                }
                                              },
                                              child: Obx(
                                                () => Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 8),
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 15),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          homeController.catlistex[
                                                                          index]
                                                                      [
                                                                      'title'] ==
                                                                  homeController
                                                                      .cat.value
                                                              ? Colors.white38
                                                              : Color(
                                                                  0xff111113),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      border: Border.all(
                                                          color:
                                                              Colors.white70)),
                                                  child: Text(
                                                    "${homeController.catlistex[index]['title']}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ))
                                        : Expanded(
                                            child: ListView.builder(
                                            itemCount:
                                                homeController.catlistin.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () {
                                                if (homeController.cat.value ==
                                                    "") {
                                                  homeController.cat.value =
                                                      homeController
                                                              .catlistin[index]
                                                          ['title'];
                                                } else {
                                                  homeController.cat.value = "";
                                                }
                                              },
                                              child: Obx(
                                                () => Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 8),
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 15),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          homeController.catlistin[
                                                                          index]
                                                                      [
                                                                      'title'] ==
                                                                  homeController
                                                                      .cat.value
                                                              ? Colors.white38
                                                              : Color(
                                                                  0xff111113),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      border: Border.all(
                                                          color:
                                                              Colors.white70)),
                                                  child: Text(
                                                    "${homeController.catlistin[index]['title']}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ))
                                    : Container(),
                              ),
                              Expanded(child: SizedBox()),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 0.2.h,
                                    width: 15.w,
                                    color: Colors.white54,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            color: Color(0xff111113),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                                color: Colors.white70)),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Container(
                                    height: 0.2.h,
                                    width: 47.w,
                                    color: Colors.white54,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      homeController.filterTransaction();
                                      homeController.date.value =
                                          "${homeController.txtdatef.text} to ${homeController.txtdatet.text}";
                                      Get.back();
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            color: Color(0xff111113),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                                color: Colors.white70)),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.done,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Set",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.sp),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                          ],
                                        )),
                                  ),
                                  Container(
                                    height: 0.2.h,
                                    width: 5.w,
                                    color: Colors.white54,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                          color: Color(0xff111113),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.white70)),
                      child: Row(
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.date_range,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Obx(
                            () => Text(
                              "${homeController.monthf.value}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 6.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "  Filter Your data",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Obx(() => Text(
                              "  ${homeController.date.value} ${homeController.monthf}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp),
                            )),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Obx(() => Text(
                              "Filtered Income: ${homeController.fin.value} INR",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.white70),
                            )),
                        Obx(() => Text(
                              "Filtered Expense: ${homeController.fex.value} INR",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.white70),
                            )),
                        Expanded(child: SizedBox()),
                        Obx(() => Text(
                              "Filtered Total: ${homeController.ftotal.value} INR",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: Obx(() => ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black,
                                  ),
                                  child: homeController.filterlist[index]
                                              ['pytype'] ==
                                          "Cash"
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              CupertinoIcons
                                                  .money_dollar_circle,
                                              size: 15.sp,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Cash",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.sp),
                                            )
                                          ],
                                        )
                                      : Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.comment_bank,
                                              color: Colors.white,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Bank",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.sp),
                                            )
                                          ],
                                        ),
                                ),
                                homeController.filterlist[index]['type'] == "Transfer"
                                    ? Container()
                                    : homeController.filterlist[index]
                                                ['category'] == ""
                                        ? Container()
                                        : Container(
                                            padding: EdgeInsets.all(12),
                                            margin: EdgeInsets.only(left: 2.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.black,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "${homeController.filterlist[index]['category']}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.sp),
                                                )
                                              ],
                                            ),
                                          ),
                                homeController.filterlist[index]['type'] ==
                                        "Transfer"
                                    ? Container(
                                        padding: EdgeInsets.all(12),
                                        margin: EdgeInsets.only(left: 2.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.black,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Transfer",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.sp),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            homeController.filterlist[index]['title'] == ""
                                ? Container()
                                : Container(
                                    margin: EdgeInsets.symmetric(vertical: 1.h),
                                    child: Text(
                                      "${homeController.filterlist[index]['title']}",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )),
                            SizedBox(
                              height: 1.h,
                            ),
                            homeController.filterlist[index]['type'] ==
                                    "Transfer"
                                ? Row(
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
                                        child: homeController.filterlist[index]
                                                    ['category'] == "Income"
                                            ? Icon(Icons.download,
                                                color: Colors.white,
                                                size: 20.sp)
                                            : Icon(Icons.upload,
                                                color: Colors.white,
                                                size: 20.sp),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "${homeController.filterlist[index]['amt']}",
                                        style: TextStyle(
                                            color: Color(0xff6A4DDF),
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  )
                                : homeController.filterlist[index]['type'] == "Income"
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient:
                                                    LinearGradient(colors: [
                                                  Color(0xff17CEA0),
                                                  Color(0xff48F1C6),
                                                ])),
                                            child: Icon(Icons.download,
                                                color: Colors.white,
                                                size: 20.sp),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Text(
                                            "${homeController.filterlist[index]['amt']}",
                                            style: TextStyle(
                                                color: Color(0xff17CEA0),
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      )
                                    : Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient:
                                                    LinearGradient(colors: [
                                                  Color(0xffF7F7F7),
                                                  Color(0xff97969C),
                                                ])),
                                            child: Icon(Icons.upload,
                                                color: Colors.black,
                                                size: 20.sp),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Text(
                                            "${homeController.filterlist[index]['amt']}",
                                            style: TextStyle(
                                                color: Color(0xff97969C),
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                          ],
                        )),
                    itemCount: homeController.filterlist.length)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}