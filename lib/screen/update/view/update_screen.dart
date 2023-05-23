import 'package:date_format/date_format.dart';
import 'package:expensesmanager/screen/add/controller/add_controller.dart';
import 'package:expensesmanager/screen/home/controller/home_controller.dart';
import 'package:expensesmanager/screen/update/controller/update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<UpdateScreen> {
  UpdateController updateController = Get.put(UpdateController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff111113),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
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
                        showModalBottomSheet(
                            barrierColor: Colors.white10,
                            context: context,
                            builder: (context) => Container(
                                  height: 55.h,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25)),
                                      color: Color(0xff111113)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Set transaction type",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          updateController.inex.value =
                                              "Income";
                                        },
                                        child: Container(
                                          height: 9.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: LinearGradient(
                                                  colors: updateController
                                                              .inex.value ==
                                                          'Income'
                                                      ? [
                                                          Color(0xff17CEA0),
                                                          Color(0xff48F1C6),
                                                        ]
                                                      : [
                                                          Colors.white10,
                                                          Colors.white10,
                                                        ])),
                                          padding: EdgeInsets.all(15),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.download,
                                                color: Colors.white,
                                                size: 25.sp,
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text(
                                                "Income",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Expanded(child: SizedBox()),
                                              (updateController.inex.value ==
                                                      'Income')
                                                  ? Icon(
                                                      Icons.done,
                                                      size: 25.sp,
                                                      color: Colors.white,
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.5.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          updateController.inex.value =
                                              "Expense";
                                        },
                                        child: Container(
                                          height: 9.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: LinearGradient(
                                                  colors: updateController
                                                              .inex.value ==
                                                          'Expense'
                                                      ? [
                                                          Color(0xffF7F7F7),
                                                          Color(0xff97969C),
                                                        ]
                                                      : [
                                                          Colors.white10,
                                                          Colors.white10,
                                                        ])),
                                          padding: EdgeInsets.all(15),
                                          child: Row(
                                            children: [
                                              Icon(Icons.upload,
                                                  size: 25.sp,
                                                  color: (updateController
                                                              .inex.value ==
                                                          'Expense')
                                                      ? Colors.black
                                                      : Colors.white),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text(
                                                "Expense",
                                                style: TextStyle(
                                                    color: (updateController
                                                                .inex.value ==
                                                            'Expense')
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 20.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Expanded(child: SizedBox()),
                                              (updateController.inex.value ==
                                                      'Expense')
                                                  ? Icon(
                                                      Icons.done,
                                                      size: 25.sp,
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.5.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          updateController.inex.value="Transfer";
                                          Get.back();
                                        },
                                        child: Container(
                                          height: 9.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              gradient: LinearGradient(colors: updateController.inex.value=="Transfer" ?[
                                                Color(0xff6A4DFF),
                                                Color(0xff947FFE),
                                                Color(0xff947FFE),
                                              ]:[
                                                Colors.white10,
                                                Colors.white10,
                                              ])),
                                          padding: EdgeInsets.all(15),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: Colors.white,
                                                size: 25.sp,
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text(
                                                "Transfer",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Expanded(child: SizedBox()),
                                              (updateController.inex.value ==
                                                  'Transfer')
                                                  ? Icon(
                                                Icons.done,
                                                color: Colors.white,
                                                size: 25.sp,
                                              )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            height: 0.2.h,
                                            width: 10.w,
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
                                                        BorderRadius.circular(
                                                            25),
                                                    border: Border.all(
                                                        color: Colors.white70)),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                )),
                                          ),
                                          Container(
                                            height: 0.2.h,
                                            width: 40.w,
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
                                                        BorderRadius.circular(
                                                            25),
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
                            backgroundColor: Colors.transparent);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                            color: Color(0xff111113),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white70)),
                        child: Obx(() => Row(
                              children: [
                                (updateController.inex.value == 'Expense')
                                    ? Icon(Icons.upload, color: Colors.white)
                                    : Icon(Icons.download, color: Colors.white),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  "${updateController.inex.value}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                ),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        updateController.Delete();
                        homeController.readTransaction();
                        Get.back();
                      },
                      child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: Color(0xff111113),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.white70)),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Obx(
                  () => TextField(
                    controller: updateController.txttitle,
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold),
                    cursorColor: Colors.white54,
                    decoration: InputDecoration(
                      hintText: '${updateController.inex.value} title',
                      hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white24, width: 3)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white24, width: 3)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                InkWell(
                  onTap: () {
                    updateController.inex=="Income"? updateController.redcat():updateController.redexcat();
                    print(updateController.catlist);
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              color: Color(0xff111113)),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Choose Category",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Expanded(
                                child: updateController.inex == "Transfer"
                                    ? GridView.builder(
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 3 / 1,
                                      crossAxisCount: 2),
                                  itemBuilder: (context, index) =>
                                      InkWell(
                                        onTap: () {
                                          updateController.cat.value =
                                          updateController.tlist[index];
                                          Get.back();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 8),
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Color(0xff111113),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  25),
                                              border: Border.all(
                                                  color: Colors.white70)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${updateController.tlist[index]}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                        ),
                                      ),
                                  itemCount:
                                  updateController.tlist.length,
                                )
                                    : Obx(
                                      () =>  GridView.builder(
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 3 / 1),
                                    itemBuilder: (context, index) =>
                                        InkWell(
                                          onTap: () {
                                            updateController.cat.value =
                                            updateController.catlist[index]['title'];
                                            Get.back();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15,
                                                vertical: 8),
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Color(0xff111113),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    25),
                                                border: Border.all(
                                                    color: Colors.white70)),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${updateController.catlist[index]['title']}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 15.sp),
                                            ),
                                          ),
                                        ),
                                    itemCount:
                                    updateController.catlist.length,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xff111113),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Add Category",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          TextField(
                                            controller:
                                            updateController.txtcat,
                                            style: TextStyle(
                                                color: Colors.white54,
                                                fontSize: 30.sp,
                                                fontWeight:
                                                FontWeight.bold),
                                            cursorColor: Colors.white54,
                                            decoration: InputDecoration(
                                              hintText: 'Enter new category',
                                              hintStyle: TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: 30.sp,
                                                  fontWeight:
                                                  FontWeight.bold),
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                  borderSide:
                                                  BorderSide(
                                                      color: Colors
                                                          .white24,
                                                      width: 3)),
                                              focusedBorder:
                                              UnderlineInputBorder(
                                                  borderSide:
                                                  BorderSide(
                                                      color: Colors
                                                          .white24,
                                                      width: 3)),
                                            ),
                                          ),
                                          Expanded(child: SizedBox()),
                                          InkWell(
                                            onTap: () {
                                              updateController.inex=="Income"? updateController.inscat():updateController.insexcat();
                                              updateController.inex=="Income"? updateController.redcat():updateController.redexcat();
                                              Get.back();
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15, vertical: 8),
                                                decoration: BoxDecoration(
                                                    color: Color(0xff111113),
                                                    borderRadius:
                                                    BorderRadius.circular(25),
                                                    border: Border.all(
                                                        color: Colors.white70)),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 1.w,
                                                    ),
                                                    Text(
                                                      "Add",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 15.sp),
                                                    ),
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 8),
                                    decoration: BoxDecoration(
                                        color: Color(0xff111113),
                                        borderRadius:
                                        BorderRadius.circular(25),
                                        border: Border.all(
                                            color: Colors.white70)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text(
                                          "Add Category",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.white10);
                  },
                  child: Obx(
                        () => Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                          color: Color(0xff111113),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.white70)),
                      child: (updateController.cat.value == "")
                          ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Add Category",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp),
                          ),
                        ],
                      )
                          : Text(
                        "${updateController.cat.value}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        barrierColor: Colors.white10,
                        context: context,
                        builder: (context) => Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25)),
                                  color: Color(0xff111113)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Descreiption",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  TextField(
                                    controller: updateController.txtdes,
                                    cursorColor: Colors.white70,
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 18.sp),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter any details here',
                                        hintStyle: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18.sp)),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 0.2.h,
                                        width: 10.w,
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
                                        width: 40.w,
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
                        backgroundColor: Colors.transparent);
                  },
                  child: Container(
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
                          Icons.sort,
                          color: Colors.white,
                          size: 25.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "Add descreiption",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                InkWell(
                  onTap: () async {
                    updateController.d1 = await showDatePicker(
                        context: context,
                        initialDate: updateController.d1 == null
                            ? DateTime.now()
                            : updateController.d1!,
                        firstDate: DateTime(2000),
                        lastDate: updateController.date);
                    updateController.dateint.value = formatDate(
                        (updateController.d1 == null)
                            ? updateController.date
                            : updateController.d1!,
                        [d]);
                    updateController.mon.value = formatDate(
                        (updateController.d1 == null)
                            ? updateController.date
                            : updateController.d1!,
                        [MM]);
                    updateController.year.value = formatDate(
                        (updateController.d1 == null)
                            ? updateController.date
                            : updateController.d1!,
                        [yyyy]);
                  },
                  child: Container(
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
                        Text(
                          "Created on",
                          style: TextStyle(
                              color: Colors.white24,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: SizedBox()),
                        Obx(
                          () => Text(
                            "${updateController.dateint} ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                        ),
                        Obx(
                          () => Text(
                            "${updateController.mon.value} ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                        ),
                        Obx(
                          () => Text(
                            "${updateController.year} ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                InkWell(
                  onTap: () async {
                    updateController.t1 = await showTimePicker(
                        context: context,
                        initialTime: updateController.t1 == null
                            ? updateController.time
                            : updateController.t1!);
                    updateController.min!.value = ((updateController.t1 == null)
                        ? updateController.time.minute
                        : updateController.t1!.minute);
                    updateController.hou!.value = ((updateController.t1 == null)
                        ? updateController.time.hour
                        : updateController.t1!.hour);
                  },
                  child: Container(
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
                          Icons.access_time_outlined,
                          color: Colors.white,
                          size: 25.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "Created on",
                          style: TextStyle(
                              color: Colors.white24,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: SizedBox()),
                        Obx(
                          () => Text(
                            "${updateController.hou} :",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                        ),
                        Obx(
                          () => Text(
                            " ${updateController.min} ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: 95.w,
                  height: 33.h,
                  decoration: BoxDecoration(
                      color: Color(0xff111113),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white70)),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("  Add Money to",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp)),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              updateController.pymethod.value = "Cash";
                            },
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors:
                                            (updateController.pymethod.value ==
                                                    "Cash")
                                                ? [
                                                    Color(0xff17CEA0),
                                                    Color(0xff48F1C6),
                                                  ]
                                                : [
                                                    Color(0xff111113),
                                                    Color(0xff111113),
                                                  ]),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.white70)),
                                child: Text(
                                  "Cash",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          InkWell(
                            onTap: () {
                              updateController.pymethod.value = "Bank";
                            },
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors:
                                            (updateController.pymethod.value ==
                                                    "Bank")
                                                ? [
                                                    Color(0xff17CEA0),
                                                    Color(0xff48F1C6),
                                                  ]
                                                : [
                                                    Color(0xff111113),
                                                    Color(0xff111113),
                                                  ]),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.white70)),
                                child: Text(
                                  "Bank",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(() => InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25)),
                                                color: Color(0xff111113)),
                                            padding: EdgeInsets.all(15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Add Money",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.sp),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                TextField(
                                                  controller:
                                                      updateController.txtamo,
                                                  style: TextStyle(
                                                      color: Colors.white54,
                                                      fontSize: 30.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  cursorColor: Colors.white54,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: '00',
                                                    hintStyle: TextStyle(
                                                        color: Colors.white54,
                                                        fontSize: 30.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white24,
                                                                    width: 3)),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white24,
                                                                    width: 3)),
                                                  ),
                                                ),
                                                Expanded(child: SizedBox()),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      height: 0.2.h,
                                                      width: 10.w,
                                                      color: Colors.white54,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.all(7),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xff111113),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .white70)),
                                                          child: Icon(
                                                            Icons.close,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                    Container(
                                                      height: 0.2.h,
                                                      width: 40.w,
                                                      color: Colors.white54,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                        updateController
                                                                .amt.value =
                                                            updateController
                                                                .txtamo.text;
                                                      },
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.all(7),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xff111113),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .white70)),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.done,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              Text(
                                                                "Set",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20.sp),
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
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Colors.white10);
                                },
                                child: Text(
                                  "${updateController.amt.value}",
                                  style: TextStyle(
                                      fontSize: 50.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))),
                            Text(
                              "INR",
                              style: TextStyle(
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 0.2.h,
                            width: 10.w,
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
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.white70)),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                )),
                          ),
                          Container(
                            height: 0.2.h,
                            width: 35.w,
                            color: Colors.white54,
                          ),
                          InkWell(
                            onTap: () {
                              updateController.Update();
                              Get.back();
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xff111113),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.white70)),
                                child: Text(
                                  "Update",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
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
                        height: 1.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
