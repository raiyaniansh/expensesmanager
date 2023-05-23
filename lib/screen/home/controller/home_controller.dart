import 'package:date_format/date_format.dart';
import 'package:expensesmanager/utils/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  DateTime d1 = DateTime.now();

  List month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  TextEditingController txtdatet = TextEditingController(text: DateTime.now().day.toString());
  TextEditingController txtdatef = TextEditingController(text: DateTime.now().day.toString());
  RxString monthf = "${formatDate(DateTime.now(), ["MM"])}".obs;
  RxInt tin = 0.obs;
  RxInt tex = 0.obs;
  RxInt total = 0.obs;
  RxInt cashin = 0.obs;
  RxInt cashint = 0.obs;
  RxInt cashex = 0.obs;
  RxInt cashext = 0.obs;
  RxInt bankin = 0.obs;
  RxInt bankint = 0.obs;
  RxInt bankex = 0.obs;
  RxInt bankext = 0.obs;
  RxString inex = "".obs;
  RxString date = "".obs;
  RxString type = "ALL".obs;
  RxString pytype = "ALL".obs;
  RxString cat = "".obs;
  RxDouble bankpr = 0.0.obs;
  RxDouble cashpr = 0.0.obs;
  RxList<Map> transactionList = <Map>[].obs;
  RxList<Map> filterlist = <Map>[].obs;
  RxList<Map> catlistin = <Map>[].obs;
  RxList<Map> catlistex = <Map>[].obs;
  RxInt fin = 0.obs;
  RxInt fex = 0.obs;
  RxInt ftotal = 0.obs;

  Future<void> readTransaction() async {
    Dbhelper db = Dbhelper();
    transactionList.value = await db.readData();
  }

  Future<void> filterTransaction() async {
    fex.value=0;
    fin.value=0;
    ftotal.value=0;
    Dbhelper db = Dbhelper();
    if(type.value=="ALL"&&pytype.value=="ALL")
      {
        filterlist.value = await db.filterM(form: txtdatef.text,to:  txtdatet.text,month:  monthf.value,);
      }
    else if(type.value=="ALL")
    {
      filterlist.value = await db.filterM(form: txtdatef.text,to:  txtdatet.text,month:  monthf.value,pytype:  pytype.value);
    }
    else if(pytype.value=="ALL"&&cat.value=="")
      {
        filterlist.value = await db.filterM(type: type.value,form: txtdatef.text,to:  txtdatet.text,month:  monthf.value);
      }
    else if(pytype.value=="ALL")
      {
        filterlist.value = await db.filterM(category: cat.value,type: type.value,form: txtdatef.text,to:  txtdatet.text,month:  monthf.value);
      }
    else if(cat.value=="")
      {
        filterlist.value = await db.filterM(pytype: pytype.value,type: type.value,form: txtdatef.text,to:  txtdatet.text,month:  monthf.value);
      }
    else
      {
        filterlist.value = await db.filterM(type: type.value,form:  txtdatef.text,to:  txtdatet.text,month:  monthf.value,category: cat.value,pytype: pytype.value);
      }
    for(int i=0;i<filterlist.length;i++)
      {
        if(filterlist[i]['type']=="Income")
          {
            fin.value=fin.value+int.parse(filterlist[i]['amt']);
          }
        else if(filterlist[i]['type']=="Transfer")
          {
            if(filterlist[i]['category']=="Income")
              {
                fin.value=fin.value+int.parse(filterlist[i]['amt']);
              }
            else
              {
                fex.value=fex.value+int.parse(filterlist[i]['amt']);
              }
          }
        else
          {
            fex.value=fex.value+int.parse(filterlist[i]['amt']);
          }
      }
    ftotal.value=fin.value-fex.value;
  }

  void income() {
    tex.value = 0;
    tin.value = 0;
    cashin.value = 0;
    cashex.value = 0;
    bankin.value = 0;
    bankex.value = 0;
    bankint.value = 0;
    bankext.value = 0;
    cashext.value = 0;
    cashint.value = 0;
    for (int i = 0; i < transactionList.length; i++) {
      if (transactionList[i]['type'] == "Transfer") {
        if (transactionList[i]['category'] == "Income") {
          tin.value = tin.value + int.parse(transactionList[i]['amt']);
        } else {
          tex.value = tex.value + int.parse(transactionList[i]['amt']);
        }
      } else {
        if (transactionList[i]['type'] == "Income") {
          tin.value = tin.value + int.parse(transactionList[i]['amt']);
        } else {
          tex.value = tex.value + int.parse(transactionList[i]['amt']);
        }
      }
    }
    total.value = tin.value - tex.value;
    for (int i = 0; i < transactionList.length; i++) {
      if (transactionList[i]['type'] == "Transfer") {
        if (transactionList[i]['category'] == "Income") {
          if (transactionList[i]['pytype'] == "Cash") {
            cashin.value = cashin.value + int.parse(transactionList[i]['amt']);
            cashint.value = cashint.value + 1;
          } else {
            bankin.value = bankin.value + int.parse(transactionList[i]['amt']);
            bankint.value = bankint.value + 1;
          }
        } else {
          if (transactionList[i]['pytype'] == "Cash") {
            cashex.value = cashex.value + int.parse(transactionList[i]['amt']);
            cashext.value = cashext.value + 1;
          } else {
            bankex.value = bankex.value + int.parse(transactionList[i]['amt']);
            bankext.value = bankext.value + 1;
          }
        }
      } else {
        if (transactionList[i]['type'] == "Income") {
          if (transactionList[i]['pytype'] == "Cash") {
            cashin.value = cashin.value + int.parse(transactionList[i]['amt']);
            cashint.value = cashint.value + 1;
          } else {
            bankin.value = bankin.value + int.parse(transactionList[i]['amt']);
            bankint.value = bankint.value + 1;
          }
        } else {
          if (transactionList[i]['pytype'] == "Cash") {
            cashex.value = cashex.value + int.parse(transactionList[i]['amt']);
            cashext.value = cashext.value + 1;
          } else {
            bankex.value = bankex.value + int.parse(transactionList[i]['amt']);
            bankext.value = bankext.value + 1;
          }
        }
      }
    }
    bankpr.value = (bankin.value * 100) / ((bankin.value + cashin.value) * 100);
    cashpr.value = (bankex.value * 100) / ((bankex.value + cashex.value) * 100);
  }

  Future<void> redexcat() async {
    Dbhelper dbhelper = Dbhelper();
    catlistex.value = await dbhelper.readexcat();
  }

  Future<void> redcat() async {
    Dbhelper dbhelper = Dbhelper();
    catlistin.value = await dbhelper.readcat();
  }
}
