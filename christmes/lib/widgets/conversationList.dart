import 'dart:developer';

import 'package:christmes/screens/chatDetailPage.dart';
import 'package:christmes/utils/client.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:hive/hive.dart';

import '../models/chatMessageModel.dart';
class ConversationList extends StatefulWidget{
  String name;
  String messageText;
  String imageUrl;
  String time;
  String roomID;
  bool isMessageRead;
  List<ChatMessage> messages;
  ConversationList({required this.name,required this.messageText,required this.imageUrl,required this.time,required this.isMessageRead, required this.roomID,required this.messages});

  @override
  _ConversationListState createState() => _ConversationListState();
}
ChatDetailPageState cdp = new ChatDetailPageState();
class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        MatrixClient client = new MatrixClient();
        List<ChatMessage> message = await client.getMessages(widget.roomID);
        //await client.getMessages(widget.roomID);
        Navigator.push(context, MaterialPageRoute(builder: (context){

          return ChatDetailPage(
            roomName: widget.name,
           roomID: widget.roomID,
            Listmessages:  message,
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    //setAvatarPicture
                    backgroundImage: NetworkImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(widget.messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.time,style: TextStyle(fontSize: 12,fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}