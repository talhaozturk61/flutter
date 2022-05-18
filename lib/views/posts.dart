import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List posts = [
    {
      'username': 'Magifilu',
      'userimage': 'https://guardian.ng/wp-content/uploads/2017/10/698669.jpg',
      'likes': '129',
      'published': '15-04-2022',
      'image':
          'https://cdn.evrimagaci.org/WQ9FDUAHA0FXxNIGGInXqlxjPFE=/evrimagaci.org%2Fpublic%2Fcontent_media%2F39cfd395a0ec26b4bc0b19ffe5623741.jpg'
    },
    {
      'username': 'Zeynep',
      'userimage': 'https://c1.wallpaperflare.com/preview/322/938/447/child-model-beauty-girl.jpg',
      'likes': '45',
      'published': '9-03-2022',
      'image':
          'https://cdn.evrimagaci.org/WQ9FDUAHA0FXxNIGGInXqlxjPFE=/evrimagaci.org%2Fpublic%2Fcontent_media%2F39cfd395a0ec26b4bc0b19ffe5623741.jpg'
    },
    {
      'username': 'kemal',
      'userimage': 'https://co.stci.uk/sites/stcico.turkey.savethechildren.net/files/styles/full_landscape/public/RS115035_IMG_2998_L.jpg',
      'likes': '65',
      'published': '4-01-2021',
      'image':
          'https://cdn.evrimagaci.org/WQ9FDUAHA0FXxNIGGInXqlxjPFE=/evrimagaci.org%2Fpublic%2Fcontent_media%2F39cfd395a0ec26b4bc0b19ffe5623741.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 18,
            )),
        title: const Text(
          'Gönderiler',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.fromLTRB(2, 6, 2, 6),
            height: 450,
            width: double.maxFinite,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: NetworkImage(posts[index]['userimage']),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(posts[index]['username']),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  child: Image.network(
                posts[index]['image'],
                fit: BoxFit.cover,
              )),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.maxFinite,
                child: Column(children: [
                  Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.favorite_border),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.emoji_emotions_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.send),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      )
                    ],
                  )
                ]),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        minRadius: 8,
                        backgroundImage: NetworkImage(
                            'https://www.carizon.ca/wp-content/uploads/2014/10/Girl-with-Teddy.jpg'),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CircleAvatar(
                        minRadius: 8,     backgroundImage: NetworkImage(
                            'https://www.carizon.ca/wp-content/uploads/2014/10/Girl-with-Teddy.jpg'),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CircleAvatar(
                        minRadius: 8,     backgroundImage: NetworkImage(
                            'https://www.carizon.ca/wp-content/uploads/2014/10/Girl-with-Teddy.jpg'),
                      ),SizedBox(
                        width: 2,
                      ),
                      Text(
                        'Emre ve diğer 14 kişi beğendi',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'Cem Official Gezelim görelim',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  '2 saat önce',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                      color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ]),
          );
        },
      ),
    );
  }
}
