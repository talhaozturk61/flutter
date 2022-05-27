import 'package:dusyeriinstagram/locator.dart';
import 'package:dusyeriinstagram/services/account.service.dart';
import 'package:dusyeriinstagram/views/requests.dart';
import 'package:dusyeriinstagram/views/setprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_stories/flutter_stories.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> imgList = [
    Image.network(
      'https://process.images.nathab.com/A6dTpd53SmIg0pBfJJhgAz/resize=width:864/quality=value:60/cache=expiry:31536000/compress/https://www.nathab.com/uploaded-files/carousels/HERO/Regions/African-Safaris.jpg',
    ),
    Image.network(
      'https://static.euronews.com/articles/stories/06/61/81/62/808x454_cmsv2_d51ea0b4-7c40-5a19-94d5-87f860806baa-6618162.jpg',
    ),
    Image.network(
        'https://cdn.evrimagaci.org/WQ9FDUAHA0FXxNIGGInXqlxjPFE=/evrimagaci.org%2Fpublic%2Fcontent_media%2F39cfd395a0ec26b4bc0b19ffe5623741.jpg')
  ];

  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  final ImagePicker storyPicker = ImagePicker();

  List<XFile>? storyimage = [];

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "uğurcan", "subtitle": '@dreamplace'},
    {"id": 2, "name": "puschaz", "subtitle": '@dreamplace'},
    {"id": 3, "name": "vitor", "subtitle": '@dreamplace'},
    {"id": 4, "name": "ahmet", "subtitle": '@dreamplace'},
    {"id": 5, "name": "denswill", "subtitle": '@dreamplace'},
    {"id": 6, "name": "visca", "subtitle": '@dreamplace'},
    {"id": 7, "name": "hamsik", "subtitle": '@dreamplace'},
    {"id": 8, "name": "abdulkadir", "subtitle": '@dreamplace'},
    {"id": 9, "name": "nwakeme", "subtitle": '@dreamplace'},
    {"id": 10, "name": "bakasetas", "subtitle": '@dreamplace'},
    {"id": 11, "name": "cornelius", "subtitle": '@dreamplace'},
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      setState(() {
        results = _allUsers;
      });
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final accountService = locator<AccountService>();
    void selectstoryimage() async {
      final List<XFile>? selectedstoryimage =
          await imagePicker.pickMultiImage();
      if (selectedstoryimage!.isNotEmpty) {
        storyimage!.addAll(selectedstoryimage);
      }
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        actions: [
          IconButton(
              onPressed: () {
                selectstoryimage();
              },
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.black,
              )),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RequestsView()));
            },
            child: Badge(
              position: BadgePosition.topStart(
                top: 5,
              ),
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              child: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            AppBar(
                              toolbarHeight: 80,
                              titleSpacing: 5,
                              backgroundColor: Colors.white,
                              elevation: 0.0,
                              leading: InkWell(
                                onTap: (() {
                                  Navigator.pop(context);
                                  setState(() {
                                    _foundUsers.clear();
                                  });
                                }),
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                              title: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100],
                                ),
                                margin:
                                    const EdgeInsets.fromLTRB(0, 20, 20, 20),
                                child: TextField(
                                  onChanged: (value) => _runFilter(value),
                                  cursorColor: Colors.black26,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Kişi Ara',
                                    contentPadding:
                                        const EdgeInsets.only(top: 5),
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
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
                            ),
                            Expanded(
                              child: Scrollbar(
                                child: _foundUsers.isEmpty
                                    ? ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: _foundUsers.length,
                                        itemBuilder: (context, index) =>
                                            ListTile(
                                          leading: const CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                'https://i.pinimg.com/originals/3b/35/88/3b35884ed94f8efd003eafe8f86538b7.jpg'),
                                            maxRadius: 26,
                                          ),
                                          title:
                                              Text(_foundUsers[index]['name']),
                                          subtitle: Text(_foundUsers[index]
                                                  ["subtitle"]
                                              .toString()),
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.info,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Sonuç Yok',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.send_sharp,
                color: Colors.black,
              )),
          InkWell(
              onTap: () {
                accountService.logout(context);
              },
              child: Icon(Icons.logout,color: Colors.black,)),
          const SizedBox(
            width: 15,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Sosyal',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'BadScript'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
            )),
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                void selectImages() async {
                  final List<XFile>? selectedImages =
                      await imagePicker.pickMultiImage();
                  if (selectedImages!.isNotEmpty) {
                    imageFileList!.addAll(selectedImages);
                  }
                  setState(() {});
                }

                const _momentDuration = Duration(seconds: 5);
                final images = List.generate(
                    imageFileList!.length,
                    (idx) => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageFileList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              color: Colors.red,
                              child: Image.file(
                                  File(imageFileList![index].path),
                                  fit: BoxFit.cover),
                            );
                          },
                        ));
                return Padding(
                  padding: const EdgeInsets.only(right: 3, left: 3),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          if (index == 0) {
                            imageFileList!.isEmpty
                                ? selectImages()
                                : showCupertinoDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoPageScaffold(
                                        child: Story(
                                          onFlashForward:
                                              Navigator.of(context).pop,
                                          onFlashBack:
                                              Navigator.of(context).pop,
                                          momentCount: images.length,
                                          momentDurationGetter: (idx) =>
                                              _momentDuration,
                                          momentBuilder: (context, idx) =>
                                              images[idx],
                                          fullscreen: true,
                                        ),
                                      );
                                    },
                                  );
                          }
                        },
                        child: CircleAvatar(
                          maxRadius: 34,
                          backgroundColor: index == 0 && imageFileList!.isEmpty
                              ? Colors.white
                              : Colors.purpleAccent,
                          child: const CircleAvatar(
                            maxRadius: 32,
                            backgroundImage: NetworkImage(
                                'https://guardian.ng/wp-content/uploads/2017/10/698669.jpg'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Positioned(
                          bottom: 2, right: 15, child: Text('story')),
                      if (index == 0 && imageFileList!.isEmpty)
                        Positioned(
                          bottom: 24,
                          right: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue,
                            ),
                            height: 15,
                            width: 15,
                            child: const Center(
                                child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 10,
                            )),
                          ),
                        )
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 15),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: double.maxFinite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 5),
                          child: Row(
                            children: const [
                              CircleAvatar(
                                maxRadius: 24,
                                backgroundImage: NetworkImage(
                                    'https://i.pinimg.com/originals/3b/35/88/3b35884ed94f8efd003eafe8f86538b7.jpg'),
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text('CemOfficial'),
                            ],
                          ),
                        ),
                        CarouselSlider(
                          items: imgList,
                          carouselController: _controller,
                          options: CarouselOptions(
                              viewportFraction: 1.0,
                              autoPlay: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 9.0,
                                height: 9.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.blue)
                                        .withOpacity(
                                            _current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                '180 Beğenme',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                'Cem Official Gezelim görelim',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
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
                          ],
                        )
                      ]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
