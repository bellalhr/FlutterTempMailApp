import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mail_tm_demo/app_cache/session_manager.dart';
import 'package:mail_tm_demo/app_routes/app_pages.dart';
import 'package:mail_tm_demo/controllers/home_controller.dart';
import 'package:mail_tm_demo/custom_widgets/inbox_anim.dart';
import 'package:mail_tm_demo/models/message_model.dart';
import 'package:mail_tm_demo/utils/app_colors.dart';
import 'package:mail_tm_demo/utils/app_dimens.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  _avatar(HydraMemberMessage model){
    var nameShortCode=model.from?.name?.substring(0,2);

    return CircleAvatar(
      child: Center(
        child:  Text(nameShortCode?.toUpperCase()??'NA'),
      ),
    );
  }

  _status(){
    return Positioned(
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(100)),
        ));
  }

  _trailing(BuildContext context,HydraMemberMessage model){
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.subject.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(model.intro.toString(),
              style: const TextStyle(color: Colors.black54),
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  _messageListView(){
    return ListView.builder(
        itemCount: controller.messageList.length,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var model= controller.messageList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: AppColors.white,
              child: ListTile(
                leading: Stack(
                  children: [
                    _avatar(model),
                    if(!model.seen!)
                    _status(),
                  ],
                ),
                isThreeLine: true,
                title: Text(model.from?.name??''),
                subtitle: SelectableText(
                  model.from?.address??'',
                  style: const TextStyle(height: 1.5),
                ),
                trailing: _trailing(context,model),
              ),
            ),
          );
        });
  }

  _emptyMsgWidget(BuildContext context){
    return SizedBox(
      height: MediaQuery.of(context).size.height-150,
      child: const Center(
        child: Text('No message available'),
      ),
    );
  }

  Future<void> _onReload() async {
    await controller.fetchMessageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrayLayoutColor,
      appBar: AppBar(
        title:  Obx(()=>
        SizedBox(
          child: Row(
            children: [
              const Text('Mail Inbox('),
              Theme(
                data: ThemeData(
                    textSelectionTheme: const TextSelectionThemeData(
                      cursorColor: Colors.white70,
                      selectionColor: Colors.white70,
                      selectionHandleColor: Colors.blue,
                    )
                ),
                child: Flexible(
                  child: SelectableText(
                    '${controller.userName}',
                    maxLines: 1,
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 11,),

                  ),
                ),
              ),
              const Text(')'),
            ],
          ),
        )

        ),
        actions: [
          InkWell(
            onTap: ()async{
              _onReload();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 8,left: 8),
              child: Icon(Icons.refresh),
            ),
          ),
          InkWell(
            onTap: ()async{
              await updateLoginStatus(false);
              Get.offNamed(AppPages.login);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 12,left: 12),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body:RefreshIndicator(
        onRefresh: _onReload,
        child:  SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppDimens.pagePadding - 5),
            child: Obx(()=>controller.isLoading.value
                ? const InboxShimmer()
                : controller.messageList.isNotEmpty?
            _messageListView():_emptyMsgWidget(context)
            ),
          ),
        ),
      ),
    );

  }
}
