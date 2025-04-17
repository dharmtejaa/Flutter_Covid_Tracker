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
| ![Splash](assets/screens/splash.png) | ![World](assets/screens/world_stats.png) | ![List](assets/screens/countries_list.png) | ![Details](assets/screens/details_view.png) |

> _Make sure to add actual screenshots to the `assets/screens/` folder for proper rendering._

---

## 🎥 Demo

📽️ [Watch Demo on YouTube Shorts](https://youtube.com/shorts/XmmvJWN5ni8?feature=shared)

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
