# VisableBank

The application performs basic banking operations like **money transfers** and showing of **current account balance**.

We would like to see your way of implementing the models & API endpoints. Also your coding style is very interesting for us.

Imagine you have bank accounts with transactions and balance. You don’t need to build authentication and UI. All implementation is about the backend part.

1. You need to transfer funds between accounts. Think about what classes and DB tables you need for this task. Implement the models and a service class that wires them together.
2. Build a REST endpoint to show the balance of the account and 10 latest transactions.
3. Build a REST endpoint to transfer money between accounts. Your REST action should use the service class you built in task 1.




## Account
- Account.find_or_create_by(name: "Ronak Bhatt", balance_cents: 10000, balance_currency: "USD")
- Account.find_or_create_by(name: "Shivam Bhatt", balance_cents: 20000, balance_currency: "USD")