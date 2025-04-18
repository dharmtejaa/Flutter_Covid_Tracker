# 🌍 Covid Tracker App

A real-time **Covid-19 tracker app** built using **Flutter**, providing global and per-country statistics with animated charts, API integration, search functionality, and a beautiful, responsive UI.

This project is ideal for Flutter developers looking to explore API integration, responsive layouts, animations, and real-time data rendering.

---

## 🚀 Features

- 📊 **Global Covid-19 Stats**: Track worldwide confirmed, recovered, and death cases.
- 🌎 **Country-Specific Data**: Search and view Covid-19 details by country.
- 🔍 **Search Functionality**: Search bar with live filtering.
- 🧁 **Pie Chart Representation**: Visualize key metrics with animated charts.
- ✨ **Splash Screen**: Animated splash with rotating virus image.
- 💫 **Shimmer Loading**: Smooth shimmer effect while fetching data.
- 📱 **Responsive UI**: Works seamlessly on all screen sizes.

---

## 📸 Screenshots

| Splash Screen | World Stats | Country List | Country Details |
|---------------|-------------|---------------|------------------|
| ![Splash Screen](https://github.com/dharmtejaa/Flutter_Covid_Tracker/blob/7d9cfd87f64f9161d8830080ea31fc5e637b0490/assets/splash%20screen.jpg) | ![World Stats](https://github.com/dharmtejaa/Flutter_Covid_Tracker/blob/7d9cfd87f64f9161d8830080ea31fc5e637b0490/assets/wolrd%20list.jpg) | ![Country List](https://github.com/dharmtejaa/Flutter_Covid_Tracker/blob/42033468b9e17de1a57ca55059ae4dd55e660887/assets/Countries%20List.jpg) | ![Country Details](https://github.com/dharmtejaa/Flutter_Covid_Tracker/blob/ab5c5588a698dcf63ede9c71cd7aaf8a9d3886e5/assets/details%20list.jpg) |

---

## 🎥 Demo

📽️ [Watch Demo on YouTube Shorts](https://www.youtube.com/shorts/4RdNrTBUb0c)

---

## 🗂️ Project Structure

```
lib/
├── main.dart                   # App entry point
├── view/
│   ├── splash_screen.dart      # Animated splash screen
│   ├── world_states.dart       # Global Covid-19 stats view
│   ├── countries_list.dart     # List of countries with search
│   └── details_list.dart       # Country-specific detail screen
├── Services/
│   └── states_services.dart    # API service class
├── Model/
│   ├── world_states_model.dart # World data model
│   └── countries_list_model.dart # Country data model
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3
  pie_chart: ^5.1.0
  shimmer: ^2.0.0
  flutter_spinkit: ^5.1.0
```

Install dependencies:

```bash
flutter pub get
```

---

## 🛠️ Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/covid-tracker-app.git
   cd covid-tracker-app
   ```

2. **Run the app**
   ```bash
   flutter run
   ```

> Ensure you have [Flutter installed](https://flutter.dev/docs/get-started/install) and a device/emulator ready.

---

## 📌 Use Cases

- Learn **API integration** with `http` package
- Understand **state management** using `setState`
- Build **animated & interactive UIs**
- Perfect for **portfolio projects** or **Flutter internships**

---

## 👨‍💻 Author

**Dharma Teja**  
📧 dharmateja238@gmail.com

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

> ⭐ Star this repo if you found it useful! Contributions are welcome.
