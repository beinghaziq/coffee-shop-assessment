# Coffee Shop

A Ruby on Rails API project designed to manage coffee shop operations, including the inventory of items (such as beverages, snacks, and other products), handling customer orders, processing sales transactions, and applying various discounts. The system supports different types of discounts, such as item-based or category-based discounts, which can be applied based on quantity, purchase combinations, or user-specific offers. Additionally, the API tracks order history, manages user accounts, and includes a royalty program to reward customers based on their purchase behavior. The application is built to be scalable, with endpoints accessible via Postman, and is optimized for easy integration with frontend systems. Docker and Docker Compose are supported for seamless deployment.

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


