# Restaurant Ordering System

Welcome to the Restaurant Ordering System! This system allows you to view the menu, place orders, and pay bills.
This project is a simple command-line application written in Dart. 

## Team Members
1. Kong Samnang
2. Hy Sreanghour

## Features

1. View Menu = Display the menu items and their prices.
2. Place an Order = Add items to the order and calculate the total price.
3. Make a Table Reservation = Reserve a table for a specific date and time.
4. Pay Bill = Display the total price of the order and calculate the change.


## Getting Started

### Prerequisites

- Dart SDK installed on your machine
- A terminal or command prompt

### Installation

1. Clone the repository to your local machine:
    ```sh
    git clone https://github.com/SamnangKong426/Fundamental-of-Mobile-Development.git
    ```
2. Navigate to the project directory:
    ```sh
    cd .\Fundamental-of-Mobile-Development\W2-S3-MICRO-PROJECT\restaurant_management_system\   
    ```

### Usage

1. Run the application:
    ```sh
    dart lib/main.dart
    ```

2. Follow the on-screen instructions to interact with the system:
    ```
    --- Main Menu ---
    1. View Menu
    2. Place an Order
    3. Make a Table Reservation
    4. Pay Bill
    5. Exit
    Choose an option: 
    ```
### Folder Structure
```
.
├── analysis_options.yaml
├── bin
│   └── restaurant_management_system.dart
├── CHANGELOG.md
├── lib
│   ├── cli
│   │   └── restaurant_cli.dart
│   ├── main.dart
│   ├── model
│   │   ├── menu
│   │   │   └── menu.dart
│   │   ├── order
│   │   │   └── order.dart
│   │   └── reservation
│   │       └── table_reservation.dart
│   ├── repository
│   │   ├── order_repository.dart
│   │   ├── orders
│   │   │   ├── order1.json
│   │   │   ├── order2.json
│   │   │   ├── order3.json
│   │   │   ├── order4.json
│   │   │   ├── order5.json
│   │   │   ├── order6.json
│   │   │   ├── order7.json
│   │   │   └── order_id.json
│   │   ├── reservation_repository.dart
│   │   └── tablereservations
│   │       └── data.json
│   └── service
│       ├── menu_service.dart
│       ├── order_service.dart
│       └── reservation_service.dart
├── pubspec.lock
├── pubspec.yaml
└── README.md

11 directories, 25 files
```

