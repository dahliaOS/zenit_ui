<p align="center">
  <img width="30%" src="https://github.com/dahliaOS/brand/blob/main/assets/dahliaos/banner/colored.svg#gh-dark-mode-only" />
  <img width="30%" src="https://github.com/dahliaOS/brand/blob/main/assets/dahliaos/banner/colored.svg#gh-light-mode-only" />
  
</p>

<p align="center">
<a href="https://dahliaos.io">Website</a> ●
<a href="https://discord.gg/7qVbJHR">Discord</a> ●
<a href="https://github.com/dahliaos/releases/releases">Releases</a> ●
<a href="https://paypal.me/officialdahliaos">Donate</a> ●
<a href="https://github.com/dahliaos/documentation">Documentation</a>


<div>
  <h1 align="center">ZenitUI</h1>
  <p align="center">
  Design beautiful apps using Flutter
  </p>
</div>

### What is ZenitUI

ZenitUI is a UI library for Flutter meant to be used besides the Material library

### Content:
- [Installation](#installation)
- [Components](#components)
    - [Button](#button)
    - [Switch](#switch)

### Installation
Add the package to your dependencies:
```yaml
dependencies:
  zenit_ui: 
    git: https://github.com/dahliaOS/zenit_ui
```
### Components
#### Button
A button gives the user a way to trigger an immediate action.
There are two types of Buttons. Primary and Secondary.

Here is an example of how to create a basic Primary Button:
```dart
PrimaryButton(
  onPressed: () => print("PrimaryButton was clicked"),
  backgroundColor: ZenitColors.blue,
  foregroundColor: const Color(0xffffffff),
  child: const Text(
    "Primary Button",
  ),
),
```
For a SecondaryButton just change the keyword to SecondaryButton.

#### Switch
A Switch is a component which allows you to toggle things on and off.

Here is an example of how to create a basic Switch:
```dart
bool _checked = false;

Switch(
  value: _checked,
  onChanged: (value) => setState(() => _checked = value),
),
```

## License

<p align="left">
  <img width="40%" src="https://github.com/dahliaOS/brand/blob/main/assets/dahliaos/banner/monochrome_dark.svg#gh-dark-mode-only"/>
  <img width="40%" src="https://github.com/dahliaOS/brand/blob/main/assets/dahliaos/banner/monochrome_light.svg#gh-light-mode-only"/>
</p>

Copyright @ 2019-2022 - The dahliaOS Authors - contact@dahliaos.io

This project is licensed under the [Apache 2.0 license](/LICENSE)
