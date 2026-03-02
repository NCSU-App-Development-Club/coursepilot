# coursepilot

Plan your NC State schedule!

## Getting Started

To get started with this project, ensure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine. Check out these [resources](https://gist.github.com/IAmThe2ndHuman/5483b1f22fccda4be36e1c24b0bf8902#next-steps) to get familiar with Flutter faster.

### Prerequisites

- Flutter SDK
- Android Studio / VS Code with Flutter extensions
- An emulator or physical device for testing

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/NCSU-App-Development-Club/coursepilot.git
    cd coursepilot
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run build runner in watch mode to generate necessary files:**

    ```bash
    flutter pub run build_runner watch --delete-conflicting-outputs
    ```

    Do this in a separate terminal window so it can keep running while you work on the project.

4. **Set up an emulator, connect a physical device, or use Flutter's web support to run the app.**

    You can select your target device in your code editor or run:

    ```bash
    flutter devices
    ```

    to see available devices.

    In VS Code, you can select the device from the bottom right corner or use the command palette (`Ctrl+Shift+P` or `Cmd+Shift+P`) and search for "Flutter: Select Device".

5. **Run the app:**

    ```bash
    flutter run
    ```

    This will launch the app on your selected device.

    Add `-d <device_id>` to specify a device if needed.

## File Structure

This project follows a standard Flutter application structure. Here is a guide to the key files and directories for newcomers:

- **`android/`**: Contains the native Android project files. This is where you would make Android-specific configurations (like permissions in `AndroidManifest.xml`).
- **`ios/`**: Contains the native iOS project files. Similar to the android folder, used for iOS-specific configurations (like `Info.plist`).
- **`web/`**: Contains the web entry point and assets for the web version of the app.
- **`lib/`**: This is where almost all of the code lives. It contains the Dart code that runs the app.
  - **`main.dart`**: The entry point of the Flutter application.
  - **`constants.dart`**: Contains constant values used throughout the app if any.
  - **`models/`**: Contains data models used in the app.
  - **`pages/`**: Contains the UI screens (widgets) for the app.
  - **`services/`**: Contains business logic and data handling services.
- **`test/`**: Contains unit and widget tests to ensure the app works as expected.
- **`analysis_options.yaml`**: Configures the linter rules for the project to ensure code quality.
- **`pubspec.yaml`**: The project's configuration file. It manages dependencies (external libraries), assets (images, fonts), and app metadata (version, description).

## Contributing

1. Checkout the development branch.
2. Create a new feature branch.
3. Commit your changes.
4. Push to the branch and open a Pull Request.
