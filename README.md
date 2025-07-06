# Notes App

A simple **Flutter note-taking app** with **Firebase Authentication** and **Cloud Firestore** integration. The app allows users to sign up, log in, and perform full CRUD operations (Create, Read, Update, Delete) on their personal notes.

---

## Features

- **Sign Up & Login:** Email and password-based authentication using Firebase Auth.
- **CRUD Notes:** Add, view, edit, and delete notes stored securely in Firestore.
- **Real-time Updates:** Notes appear and update in real time without refreshing.
- **State Management:** Built using the **Provider** package for clean state management.
- **User Feedback:** Success and error messages shown via SnackBars.
- **Responsive UI:** Works in both **portrait** and **landscape** orientations.
- **Clean Architecture:** Clear separation of concerns with dedicated folders for models, services, providers, screens, and widgets.

---

## Project Structure

```plaintext
lib/
├── models/           # Data models (Note)
├── providers/        # State management (AuthProvider, NotesProvider)
├── services/         # Firebase logic (AuthService, NotesService)
├── screens/          # UI Screens (Login, Signup, Notes)
├── widgets/          # Reusable UI widgets (NoteCard)
└── main.dart         # App entry point
```

---

## 🔍 Architecture Diagram

```plaintext
UI Layer (Screens + Widgets)
         |
     Providers (AuthProvider, NotesProvider)
         |
     Services (AuthService, NotesService)
         |
     Firebase (Authentication + Firestore)
```

- **UI Layer:** Contains visual screens and components.
- **Providers:** Manage the app state and business logic.
- **Services:** Handle interaction with Firebase APIs.
- **Firebase:** Manages data persistence and user authentication.

---

## How to Set Up and Run This App

### 1. Prerequisites

- Install [Flutter](https://flutter.dev/docs/get-started/install)
- Install [VS Code](https://code.visualstudio.com/) or Android Studio
- Create a [Firebase](https://console.firebase.google.com/) project

### 2. Clone the Repository

```bash
git clone https://github.com/Aimee-Gloire/notes_app.git
cd notes-app
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Firebase Configuration

#### a. Create Firebase Project

- Go to [Firebase Console](https://console.firebase.google.com/)
- Click **Add Project** ➔ Follow the steps

#### b. Enable Authentication

- In **Firebase Console** ➔ **Authentication** ➔ **Sign-in Method**
- Enable **Email/Password** sign-in.

#### c. Set up Firestore Database

- In **Firebase Console** ➔ **Firestore Database** ➔ Create a database
- Use **test mode** for development.

### 5. Run the App

```bash
flutter run
```

---

## Notes on Firebase Usage

- **Authentication:** Users are authenticated using email and password.
- **Firestore:** Each user's notes are stored under:

```plaintext
users/{userId}/notes/{noteId}
```

- Each note document contains:

```json
{
  "content": "Your note text here"
}
```

---

## State Management Explained

- We use **Provider** to manage both **authentication state** and **notes state**.
- Providers call **services** that interact with Firebase.
- This ensures the UI is reactive and always reflects the latest data without manual refreshes.

---

## Helpful Commands

| Command                        | Purpose                         |
|--------------------------------|---------------------------------|
| `flutter pub get`              | Install project dependencies     |
| `flutter run`                  | Run the app on a connected device |
| `flutter analyze`              | Check code for errors/warnings    |

---
