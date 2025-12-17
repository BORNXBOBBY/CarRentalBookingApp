# Car Rental Booking App

A simple **Flutter Car Rental App** demonstrating a complete booking flow using mock data. No backend integration is required.

---

## Features

1. **Welcome / Login Screen**
    - Mock login functionality (no backend).
    - User enters name and password to login.
    - Password minimum 6 characters with show/hide toggle.

2. **Car List Page**
    - Displays a list of available cars using mock data.
    - Each car card shows:
        - Image
        - Brand & Model
        - Transmission & Fuel type
        - Price per day
    - Tap on a car navigates to **Car Detail Page**.

3. **Car Detail Page**
    - Detailed information about the selected car.
    - Displays:
        - Car image
        - Brand, Model, Transmission, Fuel, Price per day
    - Booking form included:
        - Full Name
        - Pick-up Date (DatePicker)
        - Location

4. **Booking Form & Confirmation**
    - User fills booking details and taps **Confirm Booking**.
    - Booking data stored in **Provider** (`BookingProvider`).
    - Navigates to **Booking Confirmation Page**:
        - Shows user name, car, pickup date, and location.

5. **Booking History**
    - Accessible via Drawer menu.
    - Displays all previous bookings with car details and pickup info.

---

## Getting Started

Follow these steps to run the app:

1. **Clone the repository** (or copy the project files).
2. Make sure **Flutter SDK** is installed.
3. Install dependencies by running:
   ```bash
   flutter pub get
