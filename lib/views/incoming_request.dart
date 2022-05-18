import 'package:flutter/material.dart';

class IncomingRequests extends StatefulWidget {
  const IncomingRequests({Key? key}) : super(key: key);

  @override
  State<IncomingRequests> createState() => _IncomingRequestsState();
}

class _IncomingRequestsState extends State<IncomingRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Gelen Talepler',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 18,
          ),
        ),
        actions: const [
          Icon(Icons.menu, color: Colors.black87),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Container(margin: EdgeInsets.only(top: 10),
            width: double.maxFinite,
            child: Row(children: const [
              Spacer(),
              Text('Onayla'),
              SizedBox(
                width: 10,
              ),
              Text('Reddet'), SizedBox(
                width: 10,
              ),
            ]),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 10),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/3b/35/88/3b35884ed94f8efd003eafe8f86538b7.jpg'),
                    maxRadius: 24,
                  ),
                  title: Row(
                    children: const [
                      Text(
                        'Hasan Akyüz',
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.thumb_up_alt,
                        color: Colors.green,
                        size: 18,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Icon(
                        Icons.thumb_down_alt,
                        color: Colors.red,
                        size: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
