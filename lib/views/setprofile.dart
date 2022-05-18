import 'package:flutter/material.dart';

class SetProfile extends StatefulWidget {
  const SetProfile({Key? key}) : super(key: key);

  @override
  State<SetProfile> createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(onTap: (){Navigator.pop(context);},
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 18,
            ),
          ),
          title: const Text(
            'Profil düzenle',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          elevation: 0.5,
          actions:  [
          IconButton(onPressed: (){}, icon:   const Icon(
              Icons.check,
              color: Colors.blue,
            ),),
            const SizedBox(
              width: 5,
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  maxRadius: 50,backgroundImage: NetworkImage( 'https://guardian.ng/wp-content/uploads/2017/10/698669.jpg'),
                ),SizedBox(height: 20,),
                Text(
                  'Profil Fotoğrafını Değiştir',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),SizedBox(height: 40,),
                TextField(
                  decoration: InputDecoration(hintText: 'Kullanıcı adı',labelText: 'Kullanıcı Adı'),
                ),
                TextField(decoration: InputDecoration(hintText: 'name',labelText: 'Ad'))
              ]),
        ),
      ),
    );
  }
}
