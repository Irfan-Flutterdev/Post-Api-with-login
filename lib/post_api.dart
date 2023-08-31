import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email,password)async{

    try{
      Response response =await post(
        Uri.parse('https://reqres.in/api/register'),
        body:{
          'email':email,
          'password':password,
        }
      );
      if(response.statusCode ==200){
        print('account successful created');
      }else{
          print('failed');
      }

    }catch(e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Api'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: ('email'),
                hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),
                hoverColor: Colors.green,
                hintTextDirection: TextDirection.ltr,
                hintMaxLines: 3,
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: ('password'),
                hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),
                hoverColor: Colors.green,
                hintTextDirection: TextDirection.ltr,
                hintMaxLines: 3,
              ),
            ),
            const SizedBox(height: 25,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(),passwordController.text.toString());
              },
              child: Container(
                height: 40,
                //width: 400,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                  backgroundBlendMode: BlendMode.dstOut,
                ),
                child: const Center(
                  child: Text('Sign_up',style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

