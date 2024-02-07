import '../../../../exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toritora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const MyHomePage(title: 'Photographer view'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  static const String routeName = '/myHomeScreen';

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  var listScreenItems = [
    const HomeScreen(),
    const CalendarScreen(),
    const ShootingScreen(),
    const ProfileScreen(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var connectivity = ref.watch(networkControllerProvider);
      connectivity.checkNetwork(context);
    });

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var position = ref.watch(dashboardControllerProvider);
    return Scaffold(
      key: _scaffoldKey,
      body: listScreenItems[position],
      bottomNavigationBar: const BottomNavigationWidget(),
/*      floatingActionButton: Container(
          decoration:  const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              elevation: 0,
              foregroundColor: ConstantColor.primaryColor,
              backgroundColor: ConstantColor.primaryColor,
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: ConstantColor.whiteColor,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
    );
  }
}
