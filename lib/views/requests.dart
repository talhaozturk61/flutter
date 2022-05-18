import 'package:dusyeriinstagram/views/incoming_request.dart';
import 'package:dusyeriinstagram/views/outcoming_requests.dart';
import 'package:flutter/material.dart';

class RequestsView extends StatefulWidget {
  const RequestsView({Key? key}) : super(key: key);

  @override
  State<RequestsView> createState() => _RequestsViewState();
}

class _RequestsViewState extends State<RequestsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'CemOfficial',
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
      body: ListView(
        children: [
          ListTile(
            title: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IncomingRequests()));
                },
                child: const Text('Gelen Talepler')),
            trailing: const Icon(
              Icons.follow_the_signs,
              color: Colors.black,
            ),
          ),
           ListTile(
            title: InkWell( onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OutComingRequests()));
                },
              child: Text('Giden Talepler')),
            trailing: Icon(
              Icons.follow_the_signs,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
