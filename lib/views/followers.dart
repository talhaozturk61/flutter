// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Follows extends StatefulWidget {
  final String index;
  const Follows({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<Follows> createState() => _FollowsState();
}

class _FollowsState extends State<Follows> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> myimages = [
    {
      'image':
          'https://thumbs.dreamstime.com/b/natural-seen-river-side-time-beauty-146637214.jpg',
      'isSelected': false,
      'name': 'cem'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__480.jpg',
      'isSelected': false,
      'name': 'bahri'
    },
    {
      'image':
          'https://previews.123rf.com/images/furkanahmet/furkanahmet1909/furkanahmet190900003/133381156-3d-amazing-natural-wallpaper.jpg',
      'isSelected': false,
      'name': 'yusuf'
    },
    {
      'image':
          'https://images.news18.com/ibnlive/uploads/2021/07/1627377451_nature.jpg',
      'isSelected': false,
      'name': 'cenk'
    },
    {
      'image':
          'https://cdn.otelleri.net/mugla/fethiye/766x510/kabak-natural-life-genel-gorunum-180587.jpg',
      'isSelected': false,
      'name': 'hakan'
    },
    {
      'image':
          'https://redshed.co.uk/wp-content/uploads/2018/03/Northern-Lights-1024x640.jpg',
      'isSelected': false,
      'name': 'mert'
    },
    {
      'image':
          'https://thumbs.dreamstime.com/b/natural-seen-river-side-time-beauty-146637214.jpg',
      'isSelected': false,
      'name': 'ömer'
    },
    {
      'image':
          'https://thumbs.dreamstime.com/b/natural-seen-river-side-time-beauty-146637214.jpg',
      'isSelected': false,
      'name': 'kenan'
    },
    {
      'image':
          'https://thumbs.dreamstime.com/b/natural-seen-river-side-time-beauty-146637214.jpg',
      'isSelected': false,
      'name': 'yılmaz'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__480.jpg',
      'isSelected': false,
      'name': 'ali'
    },
    {
      'image':
          'https://previews.123rf.com/images/furkanahmet/furkanahmet1909/furkanahmet190900003/133381156-3d-amazing-natural-wallpaper.jpg',
      'isSelected': false,
      'name': 'hasan'
    },
    {
      'image':
          'https://images.news18.com/ibnlive/uploads/2021/07/1627377451_nature.jpg',
      'isSelected': false,
      'name': 'ahmet'
    },
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.index == 'Takip' ? 0 : 1);
    _foundUsers = myimages;
  }

  bool follow = false;
  List<Map<String, dynamic>> _foundUsers = [];

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = myimages;
    } else {
      results = myimages
          .where((user) => user["name"].contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

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
            onChanged: (value) => _runFilter(value),
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
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black87,
                size: 22,
              )),
        ),
        bottom: TabBar(
          labelColor: Colors.green,
          unselectedLabelColor: Colors.green.shade200,
          indicatorColor: Colors.green,
          indicatorWeight: 2.0,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'Takip Ettiklerim',
              icon: Icon(
                Icons.person,
              ),
            ),
            Tab(
              text: 'Takip Edenler',
              icon: Icon(
                Icons.person_pin_rounded,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _foundUsers.isNotEmpty
              ? Scrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _foundUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            myimages[index]['image'],
                          ),
                        ),
                        title: Text(
                          myimages[index]['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Container(
                          height: 34,
                          width: 114,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.2, color: Colors.black)),
                          child: RaisedButton(
                            elevation: 0.5,
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                myimages.removeAt(index);
                              });
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.delete,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                    child: Text(
                                  'Kaldır',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.info,
                      size: 30,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Sonuç bulunamadı '),
                  ],
                )),
          _foundUsers.isNotEmpty
              ? Scrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _foundUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            myimages[index]['image'],
                          ),
                        ),
                        title: Text(
                          myimages[index]['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Container(
                          height: 34,
                          width: 114,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.2, color: Colors.black)),
                          child: RaisedButton(
                            elevation: 0.5,
                            color: Colors.green,
                            onPressed: () {
                              setState(() {});
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.person,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                    child: Text(
                                  'Takip',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.info,
                      size: 30,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Sonuç bulunamadı '),
                  ],
                ))
        ],
      ),
    );
  }
}
