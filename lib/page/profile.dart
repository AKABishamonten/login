import 'package:flutter/material.dart';
import 'package:loginfuc/getdata_provider.dart';
import 'package:loginfuc/login_fuction/authen_fuction.dart';
import 'package:loginfuc/shimmer_layout.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

    @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<GetDataProvider>(context, listen: false);
    dataProvider.getMyData();
  }


  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<GetDataProvider>(context);
    print(toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<Authenfuction>().signOut(context);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: dataProvider.isLoading
          ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (ctx,i){
              return Column(
                children: [
                  loadingShimmer(),
                  const SizedBox(height: 10,)
                ],
              );
            }),
          )
          : ListView.builder(
              shrinkWrap: true,
              itemCount:  dataProvider.responseData.data!.length,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(dataProvider.responseData.data![i].avatar!,height:100,width: 100,fit: BoxFit.cover,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dataProvider.responseData.data![i].firstName!),
                                const SizedBox(height: 10,),
                                Text(dataProvider.responseData.data![i].email!),
                              ],
                            ),
                          ),
                        ],
                      )),
                );
              }),
    );
  }
}