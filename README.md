Posts App

A Flutter 3.27.2 application that manages posts with full CRUD operations (view, update, delete, refresh).
The app uses BLoC for state management, Dio for API requests, and supports offline handling with SharedPreferences.

🚀 Features

📖 Fetch and display posts from API

✏️ Update any post

🗑️ Delete a post

🔄 Pull-to-refresh posts

📶 Internet connectivity check before API calls

💾 Offline cache using SharedPreferences (load posts even without internet)

🛠️ Technologies Used

Flutter 3.27.2

BLoC (flutter_bloc) → state management

Dio → HTTP client for API requests

Connectivity Plus → check internet status

SharedPreferences → offline caching

JSONPlaceholder API → mock REST API


Setup & Installation
git clone https://github.com/your-username/posts_app.git
