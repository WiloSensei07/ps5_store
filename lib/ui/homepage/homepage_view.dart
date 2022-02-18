import 'package:app_galery/di/dependency_graph.dart';
import 'package:app_galery/ui/homepage/homepage_viewmodel.dart';
import 'package:app_galery/ui/widgets/button_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:app_galery/ui/styles/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomepageViewModel>.reactive(
      viewModelBuilder: () => locator<HomepageViewModel>(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: ThemeColor.light,
          appBar: AppBar(
            title: const Text("Page de connexion"),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Connectez-vous',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(viewModel.displayedError),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      controller: viewModel.emailController,
                      onSubmitted: (value) {
                        viewModel.verifyEmail(value);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    controller: viewModel.passwordController,
                    onSubmitted: (value) => viewModel.verifyPassword(value),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => viewModel.login(context),
                    child: const Text('Se connecter'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: GestureDetector(
                      onTap: () => viewModel.navigateToRegisterView(context),
                      child: const Text(
                          "Vous n'avez pas de compte ? Inscrivez-vous"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _buildBottomNavBar(),
        );
      },
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColor.dark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonNeumorphic(
            onTap: () {},
            bgColor: ThemeColor.dark,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            topShadowColor: Colors.grey.withOpacity(0.1),
            bottomShadowColor: Colors.black.withOpacity(0.5),
          ),
          ButtonNeumorphic(
            onTap: () {},
            bgColor: ThemeColor.dark,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            topShadowColor: Colors.grey.withOpacity(0.1),
            bottomShadowColor: Colors.black.withOpacity(0.5),
          ),
          ButtonNeumorphic(
            onTap: () {},
            bgColor: ThemeColor.dark,
            icon: Icon(
              FontAwesomeIcons.userCircle,
              color: Colors.white,
              size: 20,
            ),
            topShadowColor: Colors.grey.withOpacity(0.1),
            bottomShadowColor: Colors.black.withOpacity(0.5),
          ),
          ButtonNeumorphic(
            onTap: () {},
            bgColor: ThemeColor.dark,
            icon: Icon(
              FontAwesomeIcons.shoppingCart,
              color: Colors.white,
              size: 18,
            ),
            topShadowColor: Colors.grey.withOpacity(0.1),
            bottomShadowColor: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
