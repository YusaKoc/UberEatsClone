import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/foodbackground.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: [
            buildLogonButton(ekranGenisligi, ekranYuksekligi, context),
            Expanded(child: Container()),
            buildBottomContainer(context, ekranGenisligi, ekranYuksekligi),
          ],
        ),
      ),
    );
  }

  Row buildLogonButton(double ekranGenisligi, double ekranYuksekligi, BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0,left: 25.0),
                child: Image.asset("images/UberEatsLogo.webp",width: ekranGenisligi/3,),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 38.0,right: 10),
                child: SizedBox(
                  height: ekranYuksekligi/20,
                  child: ElevatedButton(
                    child: Text("Skip",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: ekranGenisligi/25
                    ),
                    ),
                    onPressed: (){},
                  ),
                ),
              ),
            ],
          );
  }

  Container buildBottomContainer(BuildContext context, double ekranGenisligi, double ekranYuksekligi) {
    return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Get started with Uber Eats", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold,fontSize: ekranGenisligi/15),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SizedBox(
                    height: ekranYuksekligi/13,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green,shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Center(child: Text("Continue", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: ekranGenisligi/19,color: Colors.white,),))),
                          Icon(Icons.arrow_forward_outlined,color: Colors.white,),
                        ],
                      ),
                      onPressed: (){
                        GoRouter.of(context).replace("/mainpage");
                      },
                    ),
                  ),
                )
              ],
            ),
            width: ekranGenisligi/1,
            height: ekranYuksekligi/5,
            color: Colors.white,
          );
  }
}
