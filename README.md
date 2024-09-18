# Coffee Shop

A Ruby on Rails API project designed to manage coffee shop operations, including the inventory of items (such as beverages, snacks, and other products), handling customer orders, processing sales transactions, and applying various discounts. The system supports different types of discounts, such as item-based or category-based discounts, which can be applied based on quantity, purchase combinations, or user-specific offers. Additionally, the API tracks order history, manages user accounts, and includes a royalty program to reward customers based on their purchase behavior. The application is built to be scalable, with endpoints accessible via Postman, and is optimized for easy integration with frontend systems. Docker and Docker Compose are supported for seamless deployment.

<img width="1104" alt="Screenshot 2024-09-18 at 11 31 11 PM" src="https://github.com/user-attachments/assets/54cb90a2-2260-4b1b-8f91-172b9d764d1f">
<img width="1002" alt="Screenshot 2024-09-18 at 11 31 38 PM" src="https://github.com/user-attachments/assets/6dc6480b-b322-41f4-8c12-6de844aadaa2">
<img width="1076" alt="Screenshot 2024-09-18 at 11 31 59 PM" src="https://github.com/user-attachments/assets/52a132c8-4224-4c0f-9795-ac9136ab3b22">
<img width="829" alt="Screenshot 2024-09-18 at 11 32 24 PM" src="https://github.com/user-attachments/assets/d80510bf-9548-4feb-917b-ef84923c2b23">


## Schema

- Item: Any beverage, snack etc
- Discount: Represents discounts on products, discounts can be item based, category based or combo based.
- Category: Category of items.
- Orders: Orders placed by customers.
- Combo: Collection of multiple items upon which discount is applied.

# Build With

- Framework: Ruby on Rails 7.1
- Database: PostgreSQL

# Getting Started

## Prerequisites

- ruby
- postgres


## Installation

1. **Clone the Repository**:
   ```bash
   git clone [<repository-url>](https://github.com/beinghaziq/coffee-shop-assessment.git)
   cd coffee-shop-assessment

   ```
   
2. **Initialize the Database**:
   - Before starting the application for the first time, ensure that the database is set up correctly.
   ```bash
   rails db:create
   rails db:migrate
   ```
   - Now run the application with
   ```bash
   rails server
   ```

## API Documentation

[APIs](https://api.postman.com/collections/36868040-ad57fc67-ea33-4188-8f53-d7965c4acb20?access_key=PMAT-01J835Y523KNAJ9NMKRHDZZH4B)


## Features that are missing or nice to have
- Rubocop can be added
- I have added user creation and JWT generation but it needs to be properly handled with HTTP only cookies and sessions.
- version is added in items table but it needs to be properly configure to use with rails optimistic locking.
- AASM gem is added but proper state management is not configured.
- Rspec and Docker
- Pundit gem for role based authorization.
- Api key handling to secure private API
- Rack Attack to secure from DDOS attacks.



