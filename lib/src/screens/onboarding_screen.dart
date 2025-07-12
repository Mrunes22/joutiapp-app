
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  Future<void> _finish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboard_complete', true);
    Navigator.pushReplacementNamed(context, SplashScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _PageData('Bienvenue', 'Découvrez JoutiApp...'),
      _PageData('Éco-responsable', 'Zéro carbone, mode circulaire...'),
      _PageData('Commencez', 'Inscrivez-vous & vendez vos articles'),
    ];
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (_, i) => _PageView(pages[i]),
          ),
          Positioned(
            bottom: 30, left: 20, right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _page == pages.length - 1 ? _finish : () => _controller.jumpToPage(pages.length - 1),
                  child: Text(_page == pages.length - 1 ? 'Terminer' : 'Passer'),
                ),
                Row(
                  children: List.generate(pages.length, (i) =>
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _page == i ? 12 : 8,
                        height: _page == i ? 12 : 8,
                        decoration: BoxDecoration(
                          color: _page == i ? Theme.of(context).primaryColor : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      )
                  ),
                ),
                TextButton(
                  onPressed: _page < pages.length - 1 ? () => _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease) : _finish,
                  child: Text(_page == pages.length - 1 ? 'Démarrer' : 'Suivant'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PageData {
  final String title, subtitle;
  _PageData(this.title, this.subtitle);
}

class _PageView extends StatelessWidget {
  final _PageData data;
  const _PageView(this.data);
  @override
  Widget build(BuildContext c) => Padding(
    padding: const EdgeInsets.all(32),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(data.title, style: Theme.of(c).textTheme.headline4),
        const SizedBox(height: 24),
        Text(data.subtitle, textAlign: TextAlign.center, style: Theme.of(c).textTheme.subtitle1),
      ],
    ),
  );
}
