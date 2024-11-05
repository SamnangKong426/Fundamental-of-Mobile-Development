# Restaurant Ordering System

Welcome to the Restaurant Ordering System! This system allows you to view the menu, place orders, and pay bills.
This project is a simple command-line application written in Dart. 

## Team Members
1. Kong Samnang
2. Hy Sreanghour

## Features

- Display the menu
- Place an order
- Pay the bill
- Save and load order IDs

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
    cd .\Fundamental-of-Mobile-Development\W2-S3-MICRO-PROJECT\micro_project_rms\
    ```

### Usage

1. Run the application:
    ```sh
    dart lib/customer.dart
    ```

2. Follow the on-screen instructions to interact with the system:
    - **Display menu**: View the available menu items.
    - **Order food**: Place an order by entering item IDs.
    - **Pay bill**: Choose a payment method to complete the order.
    - **Exit**: Exit the application.

### Menu JSON Structure

The menu is stored in a JSON file located at `lib/database/menu.json`. The structure of the JSON file is as follows:

```json
{
  "menu_id": 1,
  "items": {
    "Burger": 5.99,
    "Pizza": 8.99,
    "Salad": 4.99,
    "pasta": 3.0,
    "Soda": 10.0,
    "Coke": 2.0,
    "Korko": 5.0,
    "pepsi": 2.0,
    "Soup": 4.0
  }
}
```
