import 'package:flutter_dev/provider/calculator.dart';
import 'package:flutter_dev/provider/currencyexchange.dart';
import 'package:flutter_dev/screen/pureCalculator/screen_purecalculator.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_dev/screen/currencyExchange/screen_currencyexchange.dart';
import 'package:flutter_dev/provider/pageData.dart';

void main() async{
  await dotenv.load(fileName: 'assests/.env');
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  // This pureCalculator is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PureCalculator>(
          create: (context) => PureCalculator(),
        ),
        ChangeNotifierProvider<PageData>(
          create: (context) => PageData(),
        ),
        ChangeNotifierProvider<CurrencyExchange>(
          create: (context) => CurrencyExchange(),
        ),
      ],
      child: NeumorphicApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: NeumorphicThemeData(
          baseColor: Color(0xFFF0F1F6),
          lightSource: LightSource.topLeft,
          depth: 5,
          intensity: 0.6,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 18,
              right: 18,
              bottom: 15,
              top: 0,
              child: IndexedStack(
                index: Provider.of<PageData>(context).pageIndex,
                children: [
                  PureCalculatorWidget(),
                  CurrencyExchangeWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}