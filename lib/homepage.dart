import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? pickedFile;
  File? image;
  int indexnum = 0;
  List img = [];
  getPic() async {
    ImagePicker picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedFile!.path);
    });
    img.add(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(2.0),
              child: IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                ),
                onPressed: () async {
                  getPic();
                },
              )),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: IconButton(
              icon: Icon(
                Icons.maps_ugc_outlined,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
                size: 30,
              ),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                color: Colors.black,
                size: 30,
              ),
              label: 'search',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.video_collection_outlined,
                color: Colors.black,
                size: 30,
              ),
              label: 'reels',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.black,
                size: 30,
              ),
              label: 'likes',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://www.gettyimages.in/gi-resources/images/500px/983794168.jpg')),
              label: 'likes',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: indexnum,
          onTap: (int index) {
            setState(() {
              indexnum = index;
            });
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.pinkAccent,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                'https://www.gettyimages.in/gi-resources/images/500px/983794168.jpg'),
                          ),
                        ),
                        Text('_akshay_')
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 506,
              child: ListView.builder(
                itemCount: img.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://www.gettyimages.in/gi-resources/images/500px/983794168.jpg')),
                        title: Text('Akshay'),
                        trailing: Icon(Icons.more_horiz_outlined),
                      ),
                      Container(
                        height: 350,
                        width: double.infinity,
                        color: Colors.black,
                        child: image == null
                            ? Text('no image')
                            : Image.file(img[index]),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Icon(Icons.favorite_border_outlined, size: 32),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.mode_comment_outlined,
                              size: 32,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.send_outlined,
                              size: 32,
                            ),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.bookmark_border_outlined,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text('liked by'),
                          Text(
                            'abhi and others',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Jan 11',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
