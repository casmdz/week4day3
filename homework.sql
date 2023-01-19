-- 1. List all customers who live in Texas (use JOINs)

select * from customer 
INNER JOIN address
ON customer.address.id =  address.address_id
where district LIKE 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name

select amount, first_name, last_name
from payment
RIGHT JOIN customer
on payment.customer_id = customer.customer_id
where amount >= 6.99;


-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
select * from customer where amount > 175;

Select first_name, last_name
from customer

where customer_id in(
    SELECT customer_id
    from payment
    where amount > 175
    );



-- 4. List all customers that live in Nepal (use the city
-- table)
select * from customer;
SELECT * from country;

select country, first_name, last_name
from country
 JOIN customer 
on customer.address_id = country.country_id
where country LIKE 'Nepal'; 


-- 5. Which staff member had the most
-- transactions?

select first_name, last_name, count(*)
from staff
inner join payment ON payment.staff_id = staff.staff_id
group by staff.staff_id
order by count(*) > 0 DESC;
--limit 1;


-- 6. How many movies of each rating are there?

select rating, count(*)
from film
group by rating 
order by count(*) DESC;

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id =  payment.customer_id
where amount in(
    select amount
    from payment
    where amount > 6.99
    -- group by customer.customer
    -- having COUNT(amount) =1
);


--8 How many free rentals did our stores give away? 

-- select *
-- from payment
-- -- inner join rental 
-- -- on rental.rental_id  = payment.payment_id
-- where amount <= 1.99 ;
 

select count(*) from rental
left join payment on rental.rental_id = payment.rental_id
where payment.amount <= 0;


