import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<String> posts = []; // List to store the community posts

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: Text(
                'Community',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: posts.length,
                separatorBuilder: (context, index) => SizedBox(height: 8.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  posts[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: index == posts.length - 1 ? FontWeight.bold : FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.comment, color: Colors.white),
                                onPressed: () {
                                  // Navigate to comment page for the selected post
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CommentPage(post: posts[index]),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            width: double.infinity,
                            height: 1.0,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8.0),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Author: JinHyeokPark',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF00233B).withOpacity(0.5),
        child: Icon(Icons.edit, color: Colors.white),
        onPressed: () {
          // Navigate to new post page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPostPage(),
            ),
          ).then((newPost) {
            if (newPost != null) {
              setState(() {
                posts.add(newPost);
              });
            }
          });
        },
      ),
    );
  }
}

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Post',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: titleController,
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: bodyController,
                style: TextStyle(color: Colors.white, fontSize: 18),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Body',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Save', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  // Save the new post and return to the community page
                  String title = titleController.text;
                  String body = bodyController.text;
                  String newPost = '$title\n\n$body';
                  Navigator.pop(context, newPost);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentPage extends StatefulWidget {
  final String post;

  CommentPage({required this.post});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  TextEditingController commentController = TextEditingController();
  List<String> comments = [];

  void addComment() {
    String comment = commentController.text;
    setState(() {
      comments.add(comment);
    });
    commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: Text(
                'Post',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.post,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextField(
                              controller: commentController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Add a comment',
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton(
                              child: Text('Comment', style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                addComment();
                              },
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'Comments:',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: comments.map((comment) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text(
                                    comment,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}