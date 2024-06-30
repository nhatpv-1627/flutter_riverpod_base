# FlutterBase

A clean &amp; clear Flutter Basecode

## Installation
Clone this repository
```bash
git clone git@github.com:namnh-0652/FlutterBase.git
```
Install Pub
```bash
flutter clean
flutter pub get
```

Run command to add file `locale_keys.g.dart`, this file support for library `easy_localization`
```bash
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart
```

Run command to run code generator for your assets, fonts, colors... by `FlutterGen`
```bash 
flutter packages pub run build_runner build
```
## Build environment
- develop
- staging
- production

## Note: With Android Studio need to implement Flavor in Flutter 
- Open Android Studio redirect to `FlutterBase` project folder.
- Step 1, 2: Select `Run/Debug Configuration` -> `Edit Configurations...`
![1](https://user-images.githubusercontent.com/60587905/220844756-b1e082ce-2590-46e9-a0d7-b6e7c98a086c.png)

- Step 3, 4: On new window `Run/Debug Configuration` -> select `+` -> choose `Flutter`
 ![3](https://user-images.githubusercontent.com/60587905/220844953-40eb8b6c-0785-417e-a00d-7a51dad84951.png)


- Step 5: Create 3 new configurations `develop`, `staging`, `production`. Fill `Additional run args` respectively:
```bash
--flavor develop --dart-define=environmentName=develop
--flavor staging --dart-define=environmentName=staging
--flavor production --dart-define=environmentName=production
```
![1](https://user-images.githubusercontent.com/60587905/220845320-32a03eb5-e94f-44ef-8b5c-da64fe03e7e8.png)
![2](https://user-images.githubusercontent.com/60587905/220845347-b04f0b5e-7386-4d19-aac4-5d9c0b084406.png)
![3](https://user-images.githubusercontent.com/60587905/220845368-1383cc44-8469-48a8-bce2-f4ab7844ba13.png)


- Run and try. Happy coding <3
