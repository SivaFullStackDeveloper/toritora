import '../../../../exports.dart';

class ChatScreen extends ConsumerStatefulWidget {
  static const String routeName = '/chatScreen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var change = ref.watch(chatTabControllerProvider);
    return Scaffold(
        appBar: CommonWidgets().commonAppBar(
          context: context,
          text: KString.chatsMessages,
          ref: ref,
          pop: true,
          actions: [],
        ),
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(KString.size*Dimens.size1Point8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                ///----------------active Chats and  ended Conversations buttons--------------------------------------------------
                CommonWidgets().commonDualButtons(
                    context,
                    change,
                    ref,
                    KString.activeChats,
                    KString.endedConversations,
                    chatTabControllerProvider),
                CommonWidgets().commonSizedBox(KString.size*Dimens.size2),

                ///---------------- your Chats and  expired Chats text --------------------------------------------------
                CustomText(
                  text:
                      change == true ? KString.yourChats : KString.expiredChats,
                  color: KColor.greyColor,
                  fontFamily: KFonts.poppinsRegular,
                ),
                CommonWidgets().commonSizedBox(KString.size*Dimens.size2),

                ///---------------- chat list and ended chat list --------------------------------------------------
                ChatListScreen(
                  change: change,
                  chatList: const [],
                  endedList: const [],
                )
              ],
            ),
          ),
        ));
  }
}
