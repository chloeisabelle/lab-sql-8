-- 1. Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.

select title, length, rank() over (order by length desc) as 'Rank' 
from sakila.film
where length <> ' '
order by length;

-- 2. Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). In your output, only select the columns title, length, rating and rank.
-- ** don't know if this is correct please can you provide right answer?  ** 

select title, length, rating, rank() over (order by length desc) as 'Rank' 
from sakila.film
where length <> ' '
order by rating, length;

-- 3. How many films are there for each of the categories in the category table? Hint: Use appropriate join between the tables "category" and "film_category".

select c.name, count(f.film_id) No_of_films
from category c left join film_category f
on f.category_id = c.category_id
group by c.category_id, c.name;

-- 4. Which actor has appeared in the most films? Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.

select actor.actor_id, actor.first_name, actor.last_name, count(actor_id) as film_count
from sakila.actor join film_actor using (actor_id)
group by actor_id
order by film_count desc;

-- 5. Which is the most active customer (the customer that has rented the most number of films)? Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.

select customer.first_name, customer.last_name, count(rental_id) as rental_count
from sakila.rental join customer using (customer_id)
group by customer_id
order by rental_count desc;


