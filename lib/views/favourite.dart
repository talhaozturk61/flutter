// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  List myimages = [
    {
      'image':
          'https://thumbs.dreamstime.com/b/natural-seen-river-side-time-beauty-146637214.jpg'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__480.jpg'
    },
    {
      'image':
          'https://previews.123rf.com/images/furkanahmet/furkanahmet1909/furkanahmet190900003/133381156-3d-amazing-natural-wallpaper.jpg'
    },
    {
      'image':
          'https://images.news18.com/ibnlive/uploads/2021/07/1627377451_nature.jpg'
    },
    {
      'image':
          'https://cdn.otelleri.net/mugla/fethiye/766x510/kabak-natural-life-genel-gorunum-180587.jpg'
    },
    {
      'image':
          'https://redshed.co.uk/wp-content/uploads/2018/03/Northern-Lights-1024x640.jpg'
    },
    {
      'image':
          'https://thumbs.dreamstime.com/b/natural-seen-river-side-time-beauty-146637214.jpg'
    },
    {
      'image':
          'https://thumbs.dreamstime.com/b/natural-seen-river-side-time-beauty-146637214.jpg'
    },
    {
      'image':
          'https://thumbs.dreamstime.com/b/natural-seen-river-side-time-beauty-146637214.jpg'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__480.jpg'
    },
    {
      'image':
          'https://previews.123rf.com/images/furkanahmet/furkanahmet1909/furkanahmet190900003/133381156-3d-amazing-natural-wallpaper.jpg'
    },
    {
      'image':
          'https://images.news18.com/ibnlive/uploads/2021/07/1627377451_nature.jpg'
    },
  ];
  bool follow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          margin: const EdgeInsets.fromLTRB(4, 18, 2, 0),
          child: TextField(
            cursorColor: Colors.black26,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: 'Ara',
              contentPadding: const EdgeInsets.only(top: 5),
              hintStyle: const TextStyle(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        leadingWidth: 20,
        leading: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black87,
                size: 22,
              )),
        ),
        bottom: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
          indicatorWeight: 2.0,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'Beğendiklerim',
              icon: Icon(
                Icons.favorite_outline_sharp,
                color: Colors.pink,
              ),
            ),
            Tab(
              text: 'Beğenenler',
              icon: Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          MasonryGridView.count(
            itemCount: myimages.length,
            padding: const EdgeInsets.only(top: 5),
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            itemBuilder: (context, index) {
              return Container(
                child: Image.network(
                  myimages[index]['image'],
                  fit: BoxFit.fill,
                ),
                height: 160,
                width: 200,
              );
            },
          ),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.carizon.ca/wp-content/uploads/2014/10/Girl-with-Teddy.jpg'),
                ),
                title: Text.rich(
                  TextSpan(
                    children: [
                      
                      TextSpan(
                        text: 'Cemofficial',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                      ),
                      TextSpan(text: '  paylaşımını beğendi..',style: TextStyle(fontSize: 14),),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
