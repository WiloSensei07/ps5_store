import 'package:app_galery/di/dependency_graph.dart';
import 'package:app_galery/services/authentification_service.dart';
import 'package:app_galery/ui/content/content_viewmodel.dart';
import 'package:app_galery/ui/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContentViewModel>.reactive(
      viewModelBuilder: () => locator<ContentViewModel>(),
      onModelReady: (model) async => await model.initialize(),
      builder: (context, viewModel, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) => viewModel.setIndex(newIndex),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: viewModel.currentIndex,
        ),
        body: const [HomeView(), SearchView(), ProfileView()]
            .elementAt(viewModel.currentIndex),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Je suis connecté"),
            Text(locator<AuthenticationService>().getCurrentUID()),
            Text(locator<AuthenticationService>().appUser != null
                ? locator<AuthenticationService>().appUser!.favoriteAnimal ??
                    "N/A"
                : "N/A"),
            RaisedButton(
              child: Text("Se déconnecter"),
              onPressed: () {
                locator<AuthenticationService>().logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          /*children: [
            Text("Page produit suivant..."),
            RaisedButton(
              child: Text("Accéder au catalogue!"),
            ),
          ],*/
        ),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Profile view")],
        ),
      ),
    );
  }
}
