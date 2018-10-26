import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/material.dart';

List<Widget> TransactionWord = [];

class Request {

  var APIID = "1f16fde3aa7aaea2";
  var APIKEY = "2PsjeAtWXWJsmFd2GhabyB4IU6wRb6t7";


  void translate(String text) async {

    text = "Hello";

    var sign = hex.encode((crypto.md5.convert(new Utf8Encoder().convert(APIID+text+"123"+APIKEY))).bytes);
    var url = "https://openapi.youdao.com/api?from=EN&to=auto&appKey="+APIID+"&salt=123&sign="+sign + "&q=";
    url += Uri.encodeFull(text);

    var res = await http.get(url);

    var data = await json.decode(res.body);

    var t_web = "From web: ";
    var t_nonce = "Nonce: ";

    for(var item in data["web"][0]["value"]){
      t_web += (item + " ");
    }

    t_nonce += "us:"+data["basic"]["us-phonetic"];
    t_nonce += "uk:"+data["basic"]["uk-phonetic"];

    TransactionWord.add(Text(t_web));
    TransactionWord.add(Text(t_nonce));

    for(var item in data["basic"]["wfs"]){
      TransactionWord.add(Text(item["wf"]["name"] + ": " + item["wf"]["value"]));
    }

  }
}