import '../../../../exports.dart';

class ChatListScreen extends StatefulWidget {
  var endedList;
  var chatList;
  var change;
   ChatListScreen({Key? key,this.change,this.chatList,this.endedList}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return      Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context,i){
            return   Column(
              children: [
                ListTile(
                  leading:  CommonWidgets().circlePhotoWidget(KString.size*Dimens.size6,KString.size*Dimens.size6),
                  title: Text(
                    KString.name.replaceRange(
                        16, KString.name.length, '...'),
                    style: TextStyle(
                      fontSize: KString.size*Dimens.size1Point4,
                      color:  KColor.blackColor,
                      fontFamily: KFonts.poppinsBold,
                    ),

                  ),
                  subtitle:Text(
                    'blach blach blach IWDUFVNPICBNPWICNPWIEUCJNPWEIJCNWEPCNEWPIFUN',
                    maxLines:1,
                    style: TextStyle(
                      fontSize: KString.size*Dimens.size1Point4,
                      color:  KColor.greyColor,
                      fontFamily: KFonts.poppinsRegular,
                    ),

                  ),
                  trailing:Visibility(
                    visible: widget.change == true? true:false,
                    child:Column(
                      children: [
                        CustomText(
                          text:'11:00 AM',
                          color: KColor.greyColor,
                          fontFamily: KFonts.poppinsRegular,
                        ),
                        Badge(
                          largeSize:KString.size*Dimens.size4,
                          backgroundColor: KColor.buttonColor,
                          label:   Padding(
                            padding: KString.padding,
                            child: Text("3+"),
                          ),
                        ),
                      ],
                    ),),
                ),
                Padding(
                  padding: KString.padding,
                  child: Container(
                    width: double.infinity,
                    height:KString.size*Dimens.sizePoint2,
                    color: KColor.greyColor.withOpacity(0.3),
                  ),
                ),
              ],
            );

          }),
    );
  }
}
