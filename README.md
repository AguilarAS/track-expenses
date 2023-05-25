# track-expenses

# Overview

This repository contains an application to track and your monthly expenses

## Problem Definition

People don't use to track expenses, and every month expenses may increase, and if you have credit cards, having multiple ones could be confusing, this app will help the user to set a budget and have a list of your expenses.

## Priorities

### Must have

- A user must be able to log in
- A user must be able to add his monthly income
- A user must be able to add a credit card
- A user must be able to add an expense and link it to a credit card if it was made by one
- A user must be able to edit an expense

### Should have

- A user should be able to set a budget for the month
- A user should be able to see how much money is left according to the budget

### Could have

- The application could remind you the payment days of the credit cards

### Will not have

- Connect to bank apps

## Domain Model Diagram

```mermaid
%%{init: {'theme':'dark'}}%%
erDiagram
    User ||--o{ Credit: creates
    User ||--o{ Expense: creates
    Credit||--|{ Expenses: contains
    Credit||--|{ CreditCardInformation: contains
```

### Entity Relationship Diagram

```mermaid
%%{init: {'theme':'dark'}}%%
erDiagram
    user ||--|| expenses : creates
    user ||--|| credit : creates
    user ||--|{ incomes : includes
    user {
        int id PK
        text first_name
        text last_name
        text email
        text password
    }
    incomes {
        int id PK
        int user_id FK
        int income
        text start_day
        text end_day
    }

    credit {
        int id PK
        text name
        text type
        int user_id FK

    }
    credit ||--|{ credit_cards_information : contains
    credit_cards_information {
        int id PK
        int credit_id FK
        int cutOff
        int days_for_paying
    }
    credit ||--|{ credit_card_expenses : contains
    expenses {
        int id PK
        int user_id FK
        text name
        int amount
    }
    credit_card_expenses {
        int id PK
        int expense_id FK
        int credit_card_id FK
    }

```