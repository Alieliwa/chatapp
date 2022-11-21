import 'package:chatapp/Screens/WelcomeScreen.dart';
import 'package:chatapp/shared/Constans/constans.dart';
import 'package:chatapp/shared/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = FirebaseFirestore.instance;
late User signinUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  final massageController = TextEditingController();

  String? massagesText;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signinUser = user;
        print(signinUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessagesStreem() async {
    await for (var snapshot in _fireStore.collection("massages").snapshots()) {
      for (var massage in snapshot.docs) {
        print("masssssssss ${massage.data()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Chat',
          style: TextStyle(
            fontSize: 25.sp,
            fontFamily: 'Pacifico',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await _auth.signOut();
              NavigateAndFinsh(context: context, router: WelcomeScreen());
            },
            icon: Icon(
              Icons.logout,
              size: 30,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MassageStreem(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: defultColor, width: 2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: massageController,
                      onChanged: (value) {
                        massagesText = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.w,
                          horizontal: 20.h,
                        ),
                        hintText: 'Write Your Message Here',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        massageController.clear();
                        _fireStore.collection("massages").add({
                          'text': massagesText,
                          'sender': signinUser.email,
                          'time': FieldValue.serverTimestamp(),
                        });
                      },
                      icon: Icon(
                        Icons.send,
                        color: defultColor,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MassageStreem extends StatelessWidget {
  const MassageStreem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection("massages").orderBy('time').snapshots(),
      builder: (context, snapshots) {
        List<MassageLine> messageWidgets = [];
        if (!snapshots.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
        final massages = snapshots.data!.docs.reversed;
        for (var massage in massages) {
          final massageText = massage.get("text");
          final massageSender = massage.get("sender");
          final CurrentUser = signinUser.email;
          final messageWidget = MassageLine(
            text: massageText,
            Sender: massageSender,
            isMe: CurrentUser == massageSender,
          );
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 20.w,
            ),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class MassageLine extends StatelessWidget {
  const MassageLine(
      {Key? key, required this.text, required this.Sender, required this.isMe})
      : super(key: key);

  final String Sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$Sender',
            style: TextStyle(fontSize: 12.sp, color: isMe?Colors.blueAccent:Colors.indigo),
          ),
          SizedBox(
            height: 5.h,
          ),
          Material(
            borderRadius: isMe? BorderRadius.only(
              topLeft: Radius.circular(30.r),
             bottomLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
              // bottomRight: Radius.circular(30.r),
            ):BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            elevation: isMe? 5.sp: 10.sp,
            color: isMe? Colors.blue[900]: Colors.grey.shade400,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.w, horizontal: 20.h),
              child: Text(
                "$text",
                style: TextStyle(fontSize: 15.sp, color: isMe? Colors.white: Colors.indigo),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
