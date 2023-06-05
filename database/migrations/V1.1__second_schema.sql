CREATE TABLE IF NOT EXISTS public.users
(
    id serial constraint users_pk primary key,
    first_name text not null,
    second_name text not null,
    email text not null,
    password text not null,
    active boolean default true not null
);
CREATE TABLE IF NOT EXISTS public.expenses
(
    id serial constraint expenses_pk primary key,
    name text not null,
    amount int not null,
    user_id int constraint expense_user_user_id_fk references public.users(id)
);

CREATE TABLE IF NOT EXISTS public.incomes
(
    id serial constraint incomes_pk primary key,
    income int not null,
    startDay text not null,
    endDay text not null,
    user_id int constraint income_user_user_id_fk references public.users(id)
);

CREATE TABLE IF NOT EXISTS public.credits
(
    id serial constraint credits_pk primary key,
    name text not null,
    type text not null,
    user_id int constraint credit_user_user_id_fk references public.users(id)
);

CREATE TABLE IF NOT EXISTS public.credit_cards_information
(
    id serial constraint credit_cards_information_pk primary key,
    cutOff int not null,
    days_for_paying int not null,
    credit_id int constraint credit_card_information_credit_credit_id_fk references public.credits(id)
);

CREATE TABLE IF NOT EXISTS public.credit_card_expenses
(
    id serial constraint credit_card_expenses_pk primary key,
    credit_card_id int constraint credit_card_id_credit_card_information_credit_card_information_id_fk references public.credit_cards_information(id),
    expense_id int constraint expense_id_expense_expense_id_fk references public.expenses(id)
);
