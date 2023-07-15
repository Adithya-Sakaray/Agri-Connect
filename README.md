# AgriConnect Mobile App


This repository contains the code and resources for the Agri-Connect mobile app. Agri-Connect is a comprehensive mobile application developed with Flutter, designed to provide farmers with essential agricultural data and enable efficient monitoring and management of their farms. The app integrates data from various sources, including Raspberry Pi sensors connected to Firebase and the Open Weather API. It delivers real-time information about humidity, soil moisture, temperature, and the chance of rain, empowering farmers with valuable insights for their farming activities. Additionally, the app incorporates two advanced features: soil detection and yield prediction.

## Features
- **Real-time Data**: The app displays real-time data such as humidity, soil moisture, and temperature obtained from sensors connected to a Raspberry Pi via Firebase.
- **Weather Information**: The Open Weather API integration provides accurate and up-to-date weather information, including the chance of rain, to help farmers plan their farming activities accordingly.
- **Soil Detection**: The app includes a soil detection feature powered by a Convolutional Neural Network (CNN) algorithm. It allows farmers to capture images of soil samples, which are then classified into different soil types using the trained ML model.
- **Yield Prediction**: Using the power of ML, the app offers yield prediction functionality. It utilizes a CNN algorithm hosted on Google Cloud to analyze relevant data such as historical crop records, weather patterns, and soil characteristics. The ML model predicts the potential yield of specific crops, aiding farmers in making informed decisions about their agricultural practices.

## Repository Structure
- `lib/`: Contains the Dart source code for the Agri-Connect mobile app, organized into different folders based on functionality.
- `assets/`: Contains app-related assets, such as images, icons, and fonts.
- `screenshots/`: Screenshots showcasing the different features and screens of the app.
- `docs/`: Additional documentation or resources related to the mobile app.

## Getting Started
To get started with the Agri-Connect mobile app, follow these steps:
1. Clone the repository: `git clone https://github.com/Adithya-Sakaray/Agri-Connect.git`
2. Set up the Flutter development environment by following the official Flutter installation guide.
3. Open the project in your preferred IDE or code editor.
4. Install the required dependencies by running `flutter pub get` in the project directory.
5. Configure the necessary API keys for Firebase and Open Weather in the project.
6. Build and run the app using the `flutter run` command or through the IDE's built-in tools.
7. Test the app on a simulator, emulator, or a physical device.

## Contributors
This project was created by [Aadhithya D](https://github.com/Aadhithya-D), [Adithya S](https://github.com/Adithya-Sakaray), [Sarath Kumar SK](https://github.com/SKSK052003). If you would like to contribute to this project, feel free to fork the repository and submit a pull request.

## Acknowledgments
We would like to express our gratitude to the entire project team and the open-source community for their contributions, resources, and support in developing the Agriconnect mobile app.
