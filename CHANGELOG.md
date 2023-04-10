v0.0.10 / 2023-04-10
===================

 * Add Dart 3 support
 * Change Theme colours
 * Add ThemeExtension for Zenit
 * Switch to the default strict linter
 * Remove window_manager dependency and related widgets
 * Remove ZenitOptionButton Widget
 * Change Buttons to more meaningful names


v0.0.9 / 2022-12-21
===================

 * Add ZenitNavigationLayout -> replaces ZenitResponsivePlatform
 * Add ZenitIconButton
 * Add ZenitOptionButton
 * Delete Chip widget
 * Create ZenitPillIcon
 * ZenitWindowControls
 * ZenitWindowTitlebar
 * ZenitWindowFrame
 * Updated ZenitTextField
 * Animate Buttons
 * Switch to Constants as default values
 * Slight changes to the default theme
 * Revamped the example with the new ZenitNavigationLayout
 * Create pages for each example
 * Update Gap to version 2.0.1
 * Added window_manager dependency

v0.0.8 / 2022-11-11
===================

 * Repository: file restructuring
 * ZenitUI: add RadioButton
 * ZenitUI: add Checkbox
 * ZenitUI: add SwitchListTile
 * ZenitSwitch: add Theme support
 * ZenitTheme: add disabledColor
 * ZenitUI: migrate to super.key
 * ButtonBase: use theme colours
 * ResponsivePlatform: add a background colour
 * ResponsivePlatform: fix body positioning
 * Dependencies: temporarily use a fork of Gap
 * ZenitWindow: initial release based on window_manager
 * ZenitTheme: add ThemeVariant variable
 * ZenitTheme: set theme preset for FloatingActionButtons, Cards and Icons
 * Example: use ZenitWindow
 * Example: add FloatingActionButton to toggle the theme
 * Example: add new logo


v0.0.7 / 2022-10-15
===================

  * Version 0.0.7 - Add AppBarTheme to the ThemeEngine - Add option for selectedIcon to ResponsivePlatform - Allow the NavigationRail to be expanded - use pill style for NavigationElements
  * feat: update readme links (#3)
  * Merge pull request #2 from dahliaOS/dependabot/pub/google_fonts-3.0.1
  * Bump google_fonts from 2.3.2 to 3.0.1
  * Create dependabot.yml
  * Merge pull request #1 from dahliaOS/feat/improve-ci-cd
  * feat: deploy from action

v0.0.6 / 2022-09-27
===================

  * Version 0.0.6 - Introduce the ResponsivePlatform
  * Runner files
  * feat: update logo
  * Version 0.0.6 - Add Slider Widget - Add tertiary action to ActionBase - Slightly adjust TextField theme properties - Fix TabView closing - Add MouseWheel click (tertiary action) as Tab close action - Add ZenitSliderTheme to ZenitTheme - Update example minimum sdk to 2.17 - Add dahliaOS header to README
  * Update README.md

v0.0.5 / 2022-06-08
===================

  * Version 0.0.5 - Implement SwitchTheme - Define Widget names with typedef - Add a simple Button.primary and Button.secondary constructor - Remove ColorScheme from the ThemeEngine - Add TextField Widget - Add TextField to the Example
  * Add ExcludeFocus to TabView
  * TabView Improvements
  * Don't export Constants and ship default theme
  * Add gh pages path
  * fix web.yaml
  * Update web.yaml
  * Add web dependencies
  * Add working-directory

v0.0.4 / 2022-05-28
===================

  * Version 0.0.4 Theme: - add getter for backgroundColor - textColor -> foregroundColor TabView: - add functionality - respect theme - slightly adjust proportions Example: - add TabView as example Web Preview: - initial build

v0.0.3 / 2022-05-24
===================

  * Version 0.0.3 - Add Theme Engine - SecondaryButton colour based on the Theme - Switch uses Theme colour - Simplify example
  * Update readme and add a Switch to the example
  * Keep MaterialColors as Colors and add ZenitColors
  * Hotfix: fix button text color when disabled

v0.0.2 / 2022-05-17
===================

  * Version 0.0.2 SDK Changes: - Minimum Flutter Version: 3.0.0 - Minimum Dart Version: 2.17 UI Changes: - rework button_base     -> disabled if onPressed is null     -> reworked the Color loading     -> implement ThemeData to load the default color if backgroundColor is null     -> slighly change the button proportions - clean up buttons - create Colors class with callbacks for the Material Colors - create Theme class with callbacks for the Material Theme - add Gap as included package
  * Switch
  * Framework stuff
  * Dependencies
  * Linter Updates
  * Changes and some new Widgets [WIP]
  * First Button Model

v0.0.1 / 2021-09-18
===================

  * Initial commit
