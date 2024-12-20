import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentsScreen extends StatefulWidget {
  final String makananId; // ID makanan untuk memisahkan komentar

  const CommentsScreen({Key? key, required this.makananId}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<Map<String, dynamic>> comments = [];
  final TextEditingController _commentController = TextEditingController();
  String? fullName;

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _loadComments();
    _saveUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('name'); // Ambil nama pengguna
    });
  }

  Future<void> _saveUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('name', fullName!); // Ambil nama pengguna
    });
  }

  // Load comments from SharedPreferences
  Future<void> _loadComments() async {
    final prefs = await SharedPreferences.getInstance();
    final savedComments = prefs.getStringList('comments_${widget.makananId}') ?? [];
    setState(() {
      comments = savedComments.map((json) => jsonDecode(json) as Map<String, dynamic>).toList();
    });
  }

  // Save comments to SharedPreferences
  Future<void> _saveComments() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonComments = comments.map((comment) => jsonEncode(comment)).toList();
    await prefs.setStringList('comments_${widget.makananId}', jsonComments);
  }

  // Add new comment
  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        comments.add({
          "name": fullName,
          "text": _commentController.text.trim(),
          "likes": 0,
          "isLiked": false,
          "replies": [],
        });
        _commentController.clear();
      });
      _saveComments();
    }
  }

  // Toggle like for a comment
  void _toggleLike(int index) {
    setState(() {
      if (comments[index]["isLiked"]) {
        comments[index]["likes"]--;
        comments[index]["isLiked"] = false;
      } else {
        comments[index]["likes"]++;
        comments[index]["isLiked"] = true;
      }
    });
    _saveComments();
  }

  // Add reply to a comment
  void _addReply(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _replyController = TextEditingController();

        return AlertDialog(
          title: const Text("Balasan Komentar"),
          content: TextField(
            controller: _replyController,
            decoration: const InputDecoration(labelText: "Tulis balasan Anda..."),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                if (_replyController.text.isNotEmpty) {
                  setState(() {
                    comments[index]["replies"].add(_replyController.text.trim());
                  });
                  _replyController.clear();
                  Navigator.pop(context);
                  _saveComments();
                }
              },
              child: const Text("Balas"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Komentar"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    comment["name"] ?? "Anonymous",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(comment["text"]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              comment["isLiked"]
                                  ? Icons.thumb_up
                                  : Icons.thumb_up_outlined,
                              color: comment["isLiked"] ? Colors.blue : Colors.grey,
                            ),
                            onPressed: () => _toggleLike(index),
                          ),
                          Text("${comment["likes"]} Likes"),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: () => _addReply(index),
                            child: const Text("Reply",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                      // Replies section
                      ...comment["replies"].map<Widget>((reply) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 40.0, top: 4.0),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.person,
                                    size: 12, color: Colors.white),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment["name"] ?? "Anonymous",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(reply),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      labelText: "Tulis komentar...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addComment,
                  child: const Text("Kirim"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
