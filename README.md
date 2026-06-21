# 🚀 Flutter Users List API App

A simple yet well-structured Flutter application that fetches and displays user data from a REST API. The app demonstrates API integration, error handling for network connectivity issues, and clean UI rendering of dynamic data using a List-based approach.

---

## 🎯 Project Overview

**Flutter Users List API** is a lightweight Flutter application that fetches user data from the **JsonPlaceholder API** and displays it in a structured list format.

The app focuses on:
- API integration using HTTP requests  
- Handling network errors (including WiFi disconnection scenarios)  
- Displaying dynamic data in a clean UI  
- Navigating between list and detail (profile) screens  

When a user taps on any item in the list, the app navigates to a **Profile Screen** showing detailed information such as name, email, and profile picture.

---

## 🚀 Features

- Fetch users from REST API (JsonPlaceholder)
- Display users in a scrollable list
- Show loading state while fetching data
- Handle **No Internet / API failure errors**
- Display error message when API data is unavailable
- Tap on user to open detailed profile screen
- Profile screen shows:
  - User name  
  - Email address  
  - Profile avatar (placeholder)
- Clean and responsive UI design
- Simple navigation between screens
- Local state management (no external state management used)

---

## 📸 Screenshots

### ⏳ Loading Users

<img src="screenshots/Loading_Users.jpg" width="250"/>

> Displays loading indicator while fetching data from API.

---

### ⚠️ No Internet Connection / API Error

<img src="screenshots/No Internet Connection Error.jpg" width="250"/>

> Shows error message when API request fails or internet is disconnected.

---

### 👤 Users List Screen

<img src="screenshots/Users List.jpg" width="250"/>

> Displays list of users fetched from JsonPlaceholder API.

---

### 👤 User Profile Screen

<img src="screenshots/User Profile.jpg" width="250"/>

> Shows detailed user information including name, email, and profile avatar.

---

## 🛠️ Tech Stack

- Flutter  
- Dart  
- HTTP Package (API calls)  
- Material Design  
- JsonPlaceholder REST API  
- Local State Management (setState)

---

## ⚙️ Functional Flow

1. App starts and Home Screen loads  
2. API request is sent to **JsonPlaceholder**  
3. While fetching, loading indicator is displayed  
4. If API succeeds:
   - User list is shown on Home Screen  
5. If API fails or no internet:
   - Error message is displayed  
6. User taps on a list item  
7. App navigates to Profile Screen  
8. Profile screen displays user details:
   - Name  
   - Email  
   - Profile image (placeholder)  

---

## 🧠 Key Concepts Used

- REST API integration using HTTP package  
- Asynchronous programming (`async / await`)  
- Error handling for network failures  
- Conditional UI rendering (loading / error / success states)  
- Navigation between screens (`Navigator.push`)  
- JSON parsing into Dart models  
- ListView builder for dynamic rendering  
- Basic state management using `setState()`  

---

## 🏗️ Architecture Overview

### Structure Used

- Simple layered structure (no external architecture pattern)

### Flow

- **Service Layer**
  - `api_services.dart` handles API requests

- **Model Layer**
  - `user.dart` parses JSON response into Dart objects

- **UI Layer**
  - `home_screen.dart` displays user list
  - `profile_screen.dart` shows user details

- **Utils**
  - `app_colors.dart` contains UI theme colors

---

## 📂 Project Structure

```text
lib/
├── models/
│   └── user.dart
├── services/
│   └── api_services.dart
├── screens/
│   ├── home_screen.dart
│   └── profile_screen.dart
└── utils/
    └── app_colors.dart
```

---

## 📱 How to Run

Clone the repository:

```bash
git clone https://github.com/your-username/flutter_users_list_api.git
```

Navigate to project:

```bash
cd flutter_users_list_api
```

Install dependencies:

```bash
flutter pub get
```

Run the app:

```bash
flutter run
```

---

## 🎯 Future Improvements

- Add caching using Hive or SharedPreferences  
- Implement Provider or Riverpod for state management  
- Add pagination for large user lists  
- Improve UI with animations and skeleton loaders  
- Add search functionality for users  
- Replace placeholder avatars with real image APIs  

---

## 👨‍💻 Author

**Umar Jawad**

Flutter Developer | BSCS Student
