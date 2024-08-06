import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'MessageBubble.dart';

class MessageStream extends StatelessWidget {
  MessageStream({
    super.key,
    required this.logginedUser,
  });

  final User? logginedUser;
  final _firestore = FirebaseFirestore.instance;
  String? messageText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('massages')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data?.docs;
            List<MessageBubble> messageWidgets = [];

            for (var message in messages!) {
              final messageData = message.data() as Map<String, dynamic>;
              final messageText = messageData['text'];
              final messageSender = messageData['sender'];
              final messageTimestamp = messageData['timestamp'] as Timestamp?;

              final messageWidget = MessageBubble(
                sender: messageSender,
                text: messageText,
                timestamp: messageTimestamp?.toDate() ?? DateTime.now(),
                bgColor: messageSender == logginedUser?.email
                    ? Colors.lightBlueAccent
                    : Colors.amber,
                alignment: messageSender == logginedUser?.email
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
              );

              messageWidgets.add(messageWidget);
            }

            return ListView(
              reverse: true,
              children: messageWidgets,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
