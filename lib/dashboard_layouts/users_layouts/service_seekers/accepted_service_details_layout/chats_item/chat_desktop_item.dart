import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/my_text.dart';

class ChatDesktopItem extends StatelessWidget {
  const ChatDesktopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chats = [
      "Hi.. what’s up brother?",
      "i’m fine. you okay?",
      "Don’t worry, i okay. How\nabout your vacation?",
      "Very fun. I've taken all my\nactivities",
      "Wow... that great."
    ];
    var click = "Before Services".obs;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 18.sp),
          width: 70.sp,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return Obx(() {
                return Column(
                  crossAxisAlignment: click.value == "Before Services"
                      ? index % 2 != 0
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end
                      : index % 2 == 0
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                  children: [
                    ChatBubble(
                      elevation: 0,
                      clipper: ChatBubbleClipper2(
                        type: index % 2 == 0
                            ? BubbleType.sendBubble
                            : BubbleType.receiverBubble,
                      ),
                      alignment: click.value == "Before Services"
                          ? index % 2 == 0
                              ? Alignment.topRight
                              : Alignment.topLeft
                          : index % 2 != 0
                              ? Alignment.topRight
                              : Alignment.topLeft,
                      margin: EdgeInsets.only(top: 20),
                      backGroundColor: index % 2 != 0
                          ? Color(0xffEFF5F5)
                          : Color(0xff1B8271),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.4,
                        ),
                        child: Text(
                          chats[index],
                          textScaler: TextScaler.linear(2.85.sp),
                          style: TextStyle(
                            color: index % 2 == 0
                                ? Color(0xffFFFFFF)
                                : Color(0xff000000),
                          ),
                        ).paddingAll(7.sp),
                      ),
                    ),
                    MyText(
                      text:
                          "Today ${DateFormat("hh:mm aaa").format(DateTime.now())}",
                      textScale: 2.4.sp,
                      weight: FontWeight.w400,
                      color: Color(0xffB0B6C3),
                    ),
                  ],
                );
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.sp),
          child: PopupMenuButton(
            position: PopupMenuPosition.under,
            popUpAnimationStyle: AnimationStyle(
              duration: Duration(
                milliseconds: 200,
              ),
              curve: Curves.fastOutSlowIn,
              reverseDuration: Duration(
                milliseconds: 200,
              ),
            ),
            child: Container(
              width: 45.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                minTileHeight: 10,
                minVerticalPadding: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                tileColor: Color(0xff000000).withOpacity(0.1),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10.sp),
                title: MyText(text: "Inbox"),
                subtitle: Obx(
                  () {
                    return MyText(text: click.value);
                  },
                ),
                trailing: Icon(Icons.arrow_drop_down),
                onTap: null,
              ),
            ),
            onSelected: (value) {
              click.value = value;
            },
            constraints: BoxConstraints(
              maxWidth: context.width * 2.19.sp,
              minWidth: context.width * 1.19.sp,
            ),
            // elevation: 0,
            color: Colors.white,
            padding: EdgeInsets.zero,
            menuPadding: EdgeInsets.zero,
            itemBuilder: (context) => [
              PopupMenuItem(
                padding: EdgeInsets.zero,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10.sp),
                  title: MyText(
                    text: "Inbox",
                    color: Color(0xff1D1B20).withOpacity(0.6),
                  ),
                  subtitle: MyText(
                    text: "Before Services",
                    color: Color(0xff49454F).withOpacity(0.6),
                  ),
                  onTap: null,
                ),
                value: 'Before Services',
              ),
              PopupMenuItem(
                padding: EdgeInsets.zero,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10.sp),
                  title: MyText(
                    text: "Inbox",
                    color: Color(0xff1D1B20).withOpacity(0.6),
                  ),
                  subtitle: MyText(
                    text: "After Services",
                    color: Color(0xff49454F).withOpacity(0.6),
                  ),
                  onTap: null,
                ),
                value: 'After Services',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
