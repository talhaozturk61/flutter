import 'package:dusyeriinstagram/views/followers.dart';
import 'package:dusyeriinstagram/views/posts.dart';
import 'package:dusyeriinstagram/views/setprofile.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class MyStory extends StatefulWidget {
  const MyStory({Key? key}) : super(key: key);

  @override
  State<MyStory> createState() => _MyStoryState();
}

late TabController _tabController;

class _MyStoryState extends State<MyStory> with TickerProviderStateMixin {
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
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(175.0),
          child: Column(
            children: [
              const Divider(color: Colors.grey, thickness: 0.5),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (Context) => const SetProfile()));
                      },
                      child: const CircleAvatar(
                        maxRadius: 32,
                        backgroundImage: NetworkImage(
                            'https://guardian.ng/wp-content/uploads/2017/10/698669.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text('20024010'),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text('@dreamplace'),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Posts()));
                  },
                  child: Column(
                    children: const [
                      Text('10'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Gönderi'),
                      SizedBox(
                        height: 8,
                      ),
                      Icon(Icons.account_tree_sharp)
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Follows(
                                  index: 'Takip',
                                )));
                  },
                  child: Column(
                    children: const [
                      Text('30'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Takip'),
                      SizedBox(
                        height: 8,
                      ),
                      Icon(Icons.person)
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Follows(
                                  index: 'Takipçi',
                                )));
                  },
                  child: Column(
                    children: const [
                      Text('40'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Takipçi'),
                      SizedBox(
                        height: 8,
                      ),
                      Icon(Icons.person_add)
                    ],
                  ),
                )
              ]),
              const SizedBox(
                height: 15,
              ),
              TabBar(
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.dialpad_rounded,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.co_present_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: Colors.black87,
        ),
        title: Row(
          children: const [
            Text(
              'CemOfficial',
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
            Icon(
              Icons.menu,
              color: Colors.black,
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: myimages.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (a) => AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text("Ebeveyn onayı"),
                                  const Spacer(),
                                  InkWell(onTap: (){  Navigator.of(context, rootNavigator: true).pop();},
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),content: const Divider(color: Colors.grey,thickness: 1),
                              actions: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(margin: const EdgeInsets.only(bottom: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue,
                                      ),
                                      height: 120,
                                      width: 120,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.lock_open,
                                              size: 40, color: Colors.white),SizedBox(height: 10,),
                                          Text(
                                            "Onayla ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(onTap: (){ showDialog(
                        context: context,
                        builder: (a) => AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                               
                                 
                                  const Text("Ebeveyn Şifresi"),
                                  const Spacer(),
                                  InkWell(onTap: (){  Navigator.of(context, rootNavigator: true).pop();},
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),content: Text('Aşağıdaki alana ebeveyn şifrenizi giriniz...'),
                              actions: [
                      
                              ],
                            ));},
                                      child: Container(margin: const EdgeInsets.only(bottom: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.blue,
                                        ),
                                        height: 120,
                                        width: 120,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.lock,
                                                size: 40, color: Colors.white),SizedBox(height: 10,),
                                            Text(
                                              "Ebeveyn şifresi",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    child: Image.network(
                      myimages[index]['image'],
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
          GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: myimages.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(1),
                  color: Colors.white,
                  child: Image.network(
                    myimages[index]['image'],
                    fit: BoxFit.fill,
                  ),
                );
              })
        ],
      ),
    );
  }
}
