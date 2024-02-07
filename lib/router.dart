import 'package:toritora/main.dart';
import '../../../../exports.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MyHomePage.routeName:
      return MaterialPageRoute(
        builder: (context) => const MyHomePage(title: 'Photographer view',),
      );

    case NotificationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) =>  NotificationScreen(),
      );


    case ShootingScreen.routeName:
      return MaterialPageRoute(
        builder: (context) =>const  ShootingScreen(),
      );

    case SearchScreen.routeName:
      return MaterialPageRoute(
        builder: (context) =>const  SearchScreen(),
      );

    case DetailsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) =>const  DetailsScreen(),
      );

    case ProfileScreen.routeName:
      return MaterialPageRoute(
        builder: (context) =>const  ProfileScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) =>const  HomeScreen(),
      );

    case AvailabilityAddingScreen.routeName:
      return MaterialPageRoute(
        builder: (context) =>const  AvailabilityAddingScreen(),
      );




    case ChatScreen.routeName:
/*      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      final isGroupChat = arguments['isGroupChat'];
      final profilePic = arguments['profilePic'];*/
      return MaterialPageRoute(
        builder: (context) =>const ChatScreen(
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(),
        ),
      );
  }
}
