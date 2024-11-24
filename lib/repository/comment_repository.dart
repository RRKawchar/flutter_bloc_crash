

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_demo_main/model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentRepository {

  Future<List<CommentModel>> fetchComment()async{

    try{
      
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      if(response.statusCode==200) {
        final body = json.decode(response.body) as List;

        return body.map((dynamic e){
          return CommentModel(
            postId: e['postId']as int,
            id: e['id']as int,
            email: e['email'] as String,
            name: e['name'] as String,
            body: e['body'] as String,

          );
        }).toList();
      }

    }on SocketException{
      throw Exception('Error while fetching comment Data');
    }on TimeoutException{
      throw Exception('Error while fetching comment Data');
    }
    throw Exception('Error while fetching comment Data');
  }


}