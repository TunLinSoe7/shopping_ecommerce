import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:iconsax/iconsax.dart';

class MenuScreenPage extends StatelessWidget {
  const MenuScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                ZoomDrawer.of(context)!.close();
              },
                child: const Icon(Iconsax.arrow_left,color: Colors.white,size: 30,)),
            const SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.cyan
              ),
              height: 60,
              width: 65,
              alignment: Alignment.center,
              child: const Text('T',style: TextStyle(fontSize: 30),),
            ),
            const SizedBox(height: 40,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(leading: Icon(Iconsax.home,color: Colors.white,),title: Text('Home',style: TextStyle(
                  color: Colors.white
                ),),),
                ListTile(leading: Icon(Icons.person_2_outlined,color: Colors.white,),title: Text('Account',style: TextStyle(
                  color: Colors.white
                ),),),
                ListTile(leading: Icon(Iconsax.notification,color: Colors.white,),title: Text('Notification',style: TextStyle(
                  color: Colors.white
                ),),),
                ListTile(leading: Icon(Icons.bedtime_outlined,color: Colors.white,),title: Text('Night Mode',style: TextStyle(
                  color: Colors.white
                ),),),
                ListTile(leading: Icon(Iconsax.logout,color: Colors.white,),title: Text('Logout',style: TextStyle(
                    color: Colors.white
                ),),),
              ],
            )

          ],
        ),
      ),
    );
  }
}
