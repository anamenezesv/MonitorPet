import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:modelo/components/register_pet_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int heartRate = 0;

  @override
  void initState() {
    super.initState();
    listenToHeartRateChanges();
  }

  void listenToHeartRateChanges() {
    DatabaseReference batimentoRef = FirebaseDatabase.instance.ref('Batimento/Valor');
    batimentoRef.onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        setState(() {
          heartRate = data as int;
        });
      }
    }, onError: (Object error) {
      print('Erro ao obter os batimentos cardíacos: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitoramento de Batimentos'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffEEF1F3),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Color(0xff939393),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Cadastro de Pet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPetPage()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Configurações',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Lógica para navegar para a tela de Configurações
              },
            ),
            ListTile(
              title: const Text(
                'Sobre',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Lógica para navegar para a tela Sobre
              },
            ),
            ListTile(
              title: const Text(
                'Sair',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Redirecionar para a tela de login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            HeartRateWidget(heartRate: heartRate),
          ],
        ),
      ),
    );
  }
}

class HeartRateWidget extends StatefulWidget {
  final int heartRate;

  const HeartRateWidget({Key? key, required this.heartRate}) : super(key: key);

  @override
  _HeartRateWidgetState createState() => _HeartRateWidgetState();
}

class _HeartRateWidgetState extends State<HeartRateWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HeartRateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.heartRate != oldWidget.heartRate) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 60,
                ),
                onPressed: () {},
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        Text(
          'Batimento: ${widget.heartRate}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
