import 'dart:io';

import 'package:communi_in_geil_v2/client/client.dart';
import 'package:communi_in_geil_v2/models/chatUsersModel.dart';
import 'package:communi_in_geil_v2/widgets/conversationList.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:hive/hive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
class PersonalPage extends StatefulWidget {

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

Clientclass client = new Clientclass();
class _PersonalPageState extends State<PersonalPage> {

    List<ChatUsers> chatUsers = [
        ChatUsers(name: "-------Personal Page---------",
            messageText: "Awesome Setup",
            imageURL: "https://randomuser.me/api/portraits/men/5.jpg",
            time: "Now", roomID: ""),

    ];

    final double coverHeight = 500;
    final double profileHeight = 114;

    @override
    Widget build(BuildContext context) {
      final top = coverHeight - profileHeight;

        return Scaffold(
            body: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                buildCoverImage(),
                Positioned(
                    top: top,
                    child:
                    buildProfileImage()
                ),
              ],
            ),
        );

    }


    Widget buildCoverImage() =>
        Container(
            color: Colors.grey,
            child: Image.network(
                'https://images.unsplash.com/photo-1647681105535-b3d6e4f1a0b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
                width: double.infinity,
                height: coverHeight,
                fit: BoxFit.cover,
            ),
        );

    Widget buildProfileImage() =>
     CircleAvatar(
       backgroundColor: Colors.white,
       radius: (profileHeight / 1.9) * 2.2,
        child:
        CircleAvatar(
          radius: (profileHeight / 2) * 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: NetworkImage(

              'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1366&q=80'
          ),
        ),

     );
}





/* return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
        children: [
        // user card
        BigUserCard(
        userName: "sammx22",
        userProfilePic: ,
        cardColor: Colors.red.withOpacity(.90),

        ),
        SettingsGroup(
        settingsGroupTitle: "App Settings",
        items: [
        SettingsItem(
        onTap: () {},
        icons: CupertinoIcons.pencil_outline,
        iconStyle: IconStyle(),
        title: 'Appearance',
        subtitle: "Make it to yours",
        ),
        SettingsItem(
        onTap: () {},
        icons: Icons.fingerprint,
        iconStyle: IconStyle(
        iconsColor: Colors.white,
        withBackground: true,
        backgroundColor: Colors.red,
        ),
        title: 'Privacy',
        subtitle: "Keep Privacy safe",
        ),
        SettingsItem(
        onTap: () {},
        icons: Icons.dark_mode_rounded,
        iconStyle: IconStyle(
        iconsColor: Colors.white,
        withBackground: true,
        backgroundColor: Colors.red,
        ),
        title: 'Dark mode',
        subtitle: "Automatic",
        trailing: Switch.adaptive(
        value: false,
        onChanged: (value) {},
        ),
        ),
        ],
        ),
        SettingsGroup(

        items: [
        SettingsItem(

        onTap: () {},
        icons: Icons.info_rounded,
        iconStyle: IconStyle(
        backgroundColor: Colors.purple,
        ),
        title: 'About',
        subtitle: "Lern more about communi_in_geil_v2",
        ),
        ],
        ),
        // You can add a settings title
        SettingsGroup(
        settingsGroupTitle: "Account",
        items: [
        SettingsItem(
        onTap: () {},
        icons: Icons.exit_to_app_rounded,
        title: "Sign Out",
        ),
        SettingsItem(
        onTap: () {},
        icons: CupertinoIcons.repeat,
        title: "Change email",
        ),
        SettingsItem(
        onTap: () {},
        icons: CupertinoIcons.delete_solid,
        title: "Delete account",
        titleStyle: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        ),
        ),
            SettingsItem(
                icons: CupertinoIcons.info,
                title: "Info Version V2",
                onTap: () {
                    stderr.writeln('print me');
                    },
                titleStyle: TextStyle(
                color: Colors.grey,
            )
        )

        ],
        ),
        ],

        ),
        ),
        ),
        );
  }*/

/*
width: 120,
height: 120,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(90),
color: Colors.redAccent
),
child:
Text("Personal"),

 */
