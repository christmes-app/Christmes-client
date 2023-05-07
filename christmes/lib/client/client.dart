import 'dart:html';
import 'package:christmes/screens/chatPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:matrix/matrix.dart';
import 'package:matrix_api_lite/src/generated/fixed_model.dart';
import '../screens/groupPage.dart';
import '../models/chatUsersModel.dart';



GroupPageState gp = new GroupPageState();

class Clientclass {
  final storage1 = new FlutterSecureStorage();
  String username="";
  String pwd="";
  Future<void> addparams () async{
    username = (await storage1.read(key: "user"))!;
    pwd = (await storage1.read(key: "password"))!;
    print("1"+username + " " + pwd);
  }

  final client = Client(
    "HappyChat",
  );

  List chatrooms = [];

Future<Uri?> getAvatar () async {
  final pic = client.getContentThumbnail("matrix.org", "tHwINSDGpHigLhiNfKAQxMeR", 800, 600);
  //return client.getContentThumbnail("matrix.org", "tHwINSDGpHigLhiNfKAQxMeR", 800, 600);
  return client.getAvatarUrl(client.userID!);
  
}

  Future<void> sentmessage (String message, String roomID, String us, String pass) async {
    print("2"+us + " " + pass);
    await client.checkHomeserver("https://matrix-client.matrix.org/");

    print("log");
    await client.login(
      LoginType.mLoginPassword,
      identifier: AuthenticationUserIdentifier(user: us),
      password: pass,

    );

    await client.getRoomById(roomID)?.sendTextEvent(message);
    //await client.getRoomById("!JRsoxudUBxGOpjPrLM:matrix.org")?.sendTextEvent(message);



    chatrooms = client.rooms;
    print(chatrooms);

    client.logout();
  }

//groups

  List<ChatUsers> groupUsers = [];


  Future<void> getRooms() async {
    print("3"+username + " " + pwd);
    print("room");
    await client.checkHomeserver("https://matrix-client.matrix.org/");

    print("logro");
    await client.login(
      LoginType.mLoginPassword,
      identifier: AuthenticationUserIdentifier(user: username),
      password: pwd,

    );


    Future<List<String>> l = client.getJoinedRooms();
    Future<List> convertFutureListToList() async {

      Future<List> _futureOfList = l;
      List list = await _futureOfList ;
      print(list);
      print(list.iterator);
      for(int i=0; i<list.length; i++){
        bool? directchat = false;
        print(list[i]);
        print(client.getRoomById(list[i])?.displayname);
        print(client.getRoomById(list[i])?.isDirectChat);
        directchat = client.getRoomById(list[i])?.isDirectChat;
        if(directchat!=null) {
          if (!directchat) {
            print("addtolist");

            gp.chatUsers.add(ChatUsers(name: client.getRoomById(list[i])!.displayname,
                messageText: "Awesome Setup",
                imageURL: "https://randomuser.me/api/portraits/men/5.jpg",
                time: "Now", roomID: client.getRoomById(list[i])!.id));
            for(int i=0; i<gp.chatUsers.length; i++) {
              print( gp.chatUsers[i].name);
            }
          } else {

          }
        }
      }

      return list;
    }

    convertFutureListToList();

    client.logout();
  }
}