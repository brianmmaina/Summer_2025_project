# Trail Log — Leave More Than Footsteps

> **Trail Log** is my pocket-sized trail journal: a map-based diary that captures not just where you go, but what you think, see, and hear along the way.  
> Walk. Drop a voice note. Snap a photo. Jot a thought. Revisit your journey anytime.

---

## Table of Contents

1. [Why Trail Log?](#why-trail-log)  
2. [Core Features](#core-features)  
3. [Tech Stack](#tech-stack)  
4. [Prerequisites](#prerequisites)  
5. [Installation & Setup](#installation--setup)  
6. [Usage](#usage)  
7. [App Flow & Screenshots](#app-flow--screenshots)  
8. [Project Structure](#project-structure)  
9. [Roadmap](#roadmap)  
10. [Contributing](#contributing)  
11. [License](#license)  
12. [Contact](#contact)

---

## Why Trail Log?

We love hiking but hate stopping to write things down. Trail Log lets you capture voice notes, photos, or quick text entries right on the map as you go—so you never lose a moment of your journey.

---

## Core Features

- **Live GPS Tracking**  
  - Real-time polyline drawing of your path  
  - Pause/resume so you can refuel or rest  
-  **Location-Pinned Entries**  
  - Text notes, photos, or voice memos  
  - Each entry saved with lat/long & timestamp  
-  **Saved Trails Library**  
  - Browse past journeys by date or name  
  - Quick stats: distance, duration, entry count  
-  **Share With Friends**  
  - Private by default—share individual trails or your whole library  
  - Simple link-based sharing (no accounts required to view)  
-  **Minimal UI**  
  - Distraction-free design—focus on walking & reflecting  
  - Dark mode & light mode support  
-  **Offline First (Coming Soon)**  
  - Record when signal’s weak, sync when you’re back online  

---

## Tech Stack

| Layer             | Technology / Library                   |
|-------------------|----------------------------------------|
| **UI**            | SwiftUI                                |
| **Maps & GPS**    | CoreLocation + MapKit                  |
| **Audio Recording** | AVFoundation                         |
| **Backend**       | Firebase Auth, Firestore, Storage      |
| **Dependency Mgmt** | Swift Package Manager                |
| **Persistence**   | Firestore offline caching + local cache|

---

## Prerequisites

1. **macOS** (Monterey or newer)  
2. **Xcode 15+** with iOS 16+ SDK  
3. **Homebrew** (optional, for installing `firebase-tools`)  
4. A **Firebase project** with:  
   - Firestore enabled  
   - Authentication (Email & Password)  
   - Storage bucket  
