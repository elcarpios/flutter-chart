import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_chat/widgets/chat/message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [];

  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
          title: Column(
            children: [
              CircleAvatar(
                  child: Text('UN', style: TextStyle(fontSize: 12)),
                  backgroundColor: Colors.blue[100],
                  maxRadius: 16),
              SizedBox(height: 3),
              Text('User Name',
                  style: TextStyle(color: Colors.black87, fontSize: 12))
            ],
          ),
        ),
        body: Container(
            child: Column(children: [
          Flexible(
              child: ListView.builder(
                  reverse: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: _messages.length,
                  itemBuilder: (BuildContext buildContext, index) =>
                      _messages[index])),
          Divider(height: 1),
          Container(color: Colors.white, child: _buildInputChat())
        ])));
  }

  Widget _buildInputChat() {
    return SafeArea(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Flexible(
                    child: TextField(
                  focusNode: _focusNode,
                  controller: _textController,
                  onSubmitted: _handleSubmit,
                  onChanged: (String text) {
                    setState(() {
                      _isWriting = text.trim().length > 0;
                    });
                  },
                  decoration:
                      InputDecoration.collapsed(hintText: 'Send message'),
                )),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: !Platform.isIOS
                        ? CupertinoButton(child: Text('Send'), onPressed: () {})
                        : Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: IconTheme(
                              data: IconThemeData(color: Colors.blue[400]),
                              child: IconButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  icon: Icon(Icons.send),
                                  onPressed: _isWriting
                                      ? () => _handleSubmit(
                                          _textController.text.trim())
                                      : null),
                            ),
                          ))
              ],
            )));
  }

  _handleSubmit(String text) {
    if (text.trim().length > 0) {
      _textController.clear();
      _focusNode.requestFocus();

      final message = ChatMessage(
          uid: '123',
          text: text,
          animationController: AnimationController(
              vsync: this, duration: Duration(milliseconds: 200)));

      _messages.insert(0, message);
      message.animationController.forward();

      setState(() {
        _isWriting = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: Off of the socket
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
