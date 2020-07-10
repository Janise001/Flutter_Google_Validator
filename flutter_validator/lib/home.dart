import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import './common/count_down_timer.dart';
import 'model/blog_model.dart';
import './add_new_info.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BlogModel> _models = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Google验证码',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.left,
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Image.asset('image/policy.png'),
            tooltip: '隐私政策',
            onPressed: () => debugPrint('转至隐私政策'),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: _models.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        elevation: 0.0,
        onPressed: _chooseHandle,
      ),
    );
  }

  //生成列表item
  Widget _itemBuilder(BuildContext context, int index) {
    String secret = _models[index].secret;
    String blog = _models[index].blog;

    return CountDownTimer(secret, blog);
  }

  //底部选择弹出
  Future _chooseHandle() async {
    final options = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 130,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '扫描条形码',
                  style: TextStyle(color: Colors.black45),
                ),
                leading: Icon(Icons.camera_alt, color: Colors.black45),
                onTap: () {
                  Navigator.pop(context, Option.ScannerType);
                  print('扫描条形码');
                  scan();
                },
              ),
              ListTile(
                title: Text(
                  '输入提供的密钥',
                  style: TextStyle(color: Colors.black45),
                ),
                leading: Icon(
                  Icons.keyboard,
                  color: Colors.black45,
                ),
                onTap: () {
                  Navigator.pop(context, Option.ScannerType);
                  _navigateAddNewInfo(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  //跳转并接收返回值
  void _navigateAddNewInfo(BuildContext context) async {
    final BlogModel result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddNewInfo()));
    print(result.secret);
    setState(() {
      _models.add(result);
    });
  }

//  Future scan() async {
//    var options = ScanOptions();
//    ScanResult result = await BarcodeScanner.scan(options: options);
//    print('扫描结果：${result.rawContent}');
//    BlogModel model = BlogModel(blog: result.rawContent,secret: result.rawContent);
//    setState(() {
//      _models.add(model);
//    });
//  }

  scan() async {
    var options = ScanOptions();

    ScanResult result = await BarcodeScanner.scan(options: options);
    print(result.rawContent);
    BlogModel model = BlogModel(blog: result.rawContent,secret: result.rawContent);
    setState(() {
      _models.add(model);
    });
  }

}

enum Option { ScannerType, InputType }
