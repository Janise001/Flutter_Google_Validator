import 'package:flutter/material.dart';
import 'model/blog_model.dart';
import './common/algorithm.dart';


class AddNewInfo extends StatefulWidget {
  @override
  _AddNewInfoState createState() => _AddNewInfoState();
}

class _AddNewInfoState extends State<AddNewInfo> {
  final key = GlobalKey<FormState>();
  String account, secret;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Google验证码',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.left,
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                onSaved: (value){
                  account = value;
                },
                decoration: InputDecoration(
                  labelText: '账户名',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: _secretCheck,
                autovalidate: false,
                onSaved: (value){
                  secret = value;
                },
                decoration: InputDecoration(
                  labelText: '密钥',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('基于时间'),
                  ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                    onPressed: _generateCode,
                    child: Text(
                      '添加',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
//密钥输入校验
  String _secretCheck(String value) {
    if (value.isEmpty) {
      return '请输入您的密钥';
    }
    return null;
  }
//保存输入的账号和密钥
  _generateCode() {
    if (key.currentState.validate()) {
      key.currentState.save();
      print('account: $account \n secret: $secret');
      BlogModel model = BlogModel(blog: account,secret: secret);
      Navigator.pop(context,model);
    }
  }
}
