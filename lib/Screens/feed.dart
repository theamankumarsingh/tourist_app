import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<Post> posts = [
    Post(
        "Pickpocketing at an abandoned area",
        "While I was walking through the abandoned area covered with knee-length grass",
        "Me",
        "12.09pm",
        "Assets/avatar.png"),
    Post("Robbery at the junction", "Robbery at the junction", "Anonymous",
        "3:00pm", "Assets/avatar.png"),
    Post(
        "A group of suspicious people",
        "In front of the Supermarket nearby the junction, a group of suspicious people throws stones at people",
        "Lissy",
        "10am",
        "Assets/avatar.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
          title: const Text(
            "Live updates around you",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage(posts[index].image)),
                trailing: const Icon(Icons.arrow_right_rounded),
                title: Text(posts[index].heading),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      posts[index].content.length > 60
                          ? Text(posts[index].content.substring(0, 60) + "...")
                          : Text(posts[index].content),
                      Text(
                        "\nPosted by ${posts[index].author} at ${posts[index].time}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ]),
              ),
            );
          },
          itemCount: posts.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
        ));
  }
}

class Post {
  String heading, content, author, time, image;

  Post(this.heading, this.content, this.author, this.time, this.image);
}
