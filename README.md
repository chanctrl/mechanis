

# Mechanis - Patient Management System

Mechanis is a comprehensive patient management system developed using **Flutter** for both the front-end and back-end. This system helps healthcare providers efficiently manage patient data, including profiles, health history, and emergency alerts, along with optimizing routes for travel based on critical conditions.

## Features

- **Patient Dashboard**: View basic patient information and access profile settings.
- **Patient Profile**: View and edit patient details such as name, email, and other personal information.
- **Health History**: Display and manage medical records for each patient.
- **SOS Emergency Alert**: Send an emergency alert for immediate attention.
- **Login System**: Secure login for patients to access their data.
- **Optimized Route Generation**: Using Dijkstra’s algorithm and the Travelling Salesman Problem (TSP), the app calculates optimized routes for travel, taking into account critical conditions.
- **OpenStreetMap Integration**: OpenStreetMap is used to generate maps and calculate the most efficient routes.

## Tech Stack

### Front-end:
- **Flutter**: A UI toolkit to build natively compiled applications for mobile, web, and desktop from a single codebase.
- **Dart**: Programming language used for developing the Flutter app.

### Back-end (Integrated in the same Flutter Project):
- **Flask**: A micro web framework in Python used for creating the back-end API.
- **Python**: The programming language for developing back-end functionalities.
- **OpenStreetMap**: Open-source mapping service used to generate maps for optimized route calculation.

### Algorithms:
- **Dijkstra's Algorithm**: Used for finding the shortest path in a graph based on distance and other critical conditions like road safety, health facilities, and traffic.
- **Travelling Salesman Problem (TSP)**: Applied to calculate the best-optimized route that visits all required locations in the least time or distance, factoring in critical conditions like emergency access points.

## Key Concepts

### Route Optimization:
The core of this system uses advanced algorithms to calculate the best possible routes for patients or healthcare professionals based on a variety of critical conditions. These include:

- **Distance**: Shortest travel distance.
- **Traffic Conditions**: Routes with less congestion are prioritized.
- **Health Facilities**: Routes that pass near health centers for emergencies.
- **Safety**: Routes that avoid unsafe or high-risk areas.

By combining **Dijkstra’s algorithm** and the **Travelling Salesman Problem (TSP)**, the system efficiently calculates the optimal route to minimize time, distance, and safety concerns.

### OpenStreetMap Integration:
To generate real-time maps and routes, this system integrates **OpenStreetMap (OSM)**, a collaborative mapping project that provides free geographic data. By leveraging OSM, the system can generate accurate and reliable maps for route optimization.

## Installation

### Setting up the project

1. Clone the repository:

    ```bash
    git clone https://github.com/chanctrl/mechanis.git
    cd flutter_application_1
    ```

2. Install Flutter dependencies:

    ```bash
    flutter pub get
    ```

3. Ensure Python is installed and set up for the back-end (see below).

### Back-end (Flask in the Flutter Project)

1. Navigate to the `flutter_application_1` directory (which includes both Flutter front-end and Flask back-end):

    ```bash
    cd flutter_application_1
    ```

2. Set up a Python virtual environment (optional but recommended):

    ```bash
    python -m venv venv
    source venv/bin/activate   # On Windows use `venv\Scripts\activate`
    ```

3. Install the required Python dependencies:

    ```bash
    pip install -r backend/requirements.txt
    ```

4. Start the Flask server:

    ```bash
    python backend/app.py
    ```

    This will run the Flask API server locally at `http://127.0.0.1:5000/`.

### Running the Flutter App

Once the Flask back-end is running, you can start the Flutter front-end:

```bash
flutter run
```

This will run the Flutter app, which connects to the back-end API.

## Project Structure

```
mechanis/
├── flutter_application_1/    # Flutter project containing both front-end and back-end
│   ├── lib/
│   ├── assets/               # Store assets like images and maps
│   ├── backend/              # Flask back-end logic
│   │   ├── app.py            # Flask application file
│   │   ├── algo.py           # Algorithm to find optimal routes (Dijkstra, TSP)  
│   └── pubspec.yaml          # Flutter configuration file
└── README.md                 # Project documentation
```

## API Endpoints

Here are the available API endpoints for the back-end:

### `GET /api/patient/<id>`
Retrieve the profile information of a patient.

**Parameters:**
- `id`: Patient ID

**Response:**
```json
{
  "id": 1,
  "name": "John Doe",
  "email": "johndoe@example.com"
}
```

### `POST /api/patient/update`
Update patient profile information.

**Body:**
```json
{
  "id": 1,
  "name": "John Doe",
  "email": "newemail@example.com"
}
```

**Response:**
```json
{
  "message": "Profile updated successfully"
}
```

### `POST /api/emergency/alert`
Send an emergency alert to healthcare providers.

**Body:**
```json
{
  "patient_id": 1,
  "message": "Emergency Alert: Immediate Attention Needed"
}
```

**Response:**
```json
{
  "message": "SOS alert sent successfully"
}
```

### `GET /api/route/optimize`
Get the optimized route using Dijkstra's algorithm and TSP.

**Parameters:**
- `start`: Starting point (latitude, longitude)
- `destinations`: A list of destinations (latitude, longitude)

**Response:**
```json
{
  "optimized_route": [
    {"lat": 12.9716, "lon": 77.5946},  // Coordinates of optimized stops
    {"lat": 13.0356, "lon": 77.5974}
  ]
}
```

THE LINK TO THE PRESENTION IS :
https://docs.google.com/presentation/d/179049pWc5aZY1-yyzNspfCz2on0vgwhD/edit?usp=sharing&ouid=107088085345986883910&rtpof=true&sd=true
