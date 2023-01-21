use sakila;
/* 1.In the table actor, which are the actors whose last names are not repeated?
For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd,
Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include
this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", 
hence we would want this in our output list.*/
select last_name from actor
group by last_name
having count(*) = 1;


/* 2.Which last names appear more than once? We would use the same logic as in the previous question
 but this time we want to include the last names of the actors where the last name was present more than once.*/
select last_name from actor
group by last_name
having count(*) > 1;
 
 
 -- 3.Using the rental table, find out how many rentals were processed by each employee.
select * from staff;

select count(staff_id) as num_of_rent_proc_by_Mike_Hillyer from rental
where staff_id = 1;
 
 select count(staff_id) as num_of_rent_proc_by_Jon_Stephens from rental
where staff_id = 2;
-- Mike proceeded more rentals (8040) than Jon (8004).
select staff_id as employee, count(*) as number_of_rental_processed from rental
group by staff_id
order by number_of_rental_processed desc;
-- This is another valid approach and more powerfull
 
 -- 4.Using the film table, find out how many films were released each year.
 select distinct(release_year) from film; 
 -- Taking into account there is just 1 release year in the table:
 select release_year, count(*) as number_of_films_released_per_year from film; -- 1000 films in 2006
 
-- But with the following approach you could calculate it if there were different years:
select distinct release_year, count(*) as number_of_films_released from film
group by release_year
order by number_of_films_released;
 
 -- 5.Using the film table, find out for each rating how many films were there.
select rating, count(*) as number_of_films from film
group by rating
order by number_of_films;
 
 -- 6.What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.
select rating, round(avg(length),2) as average_lenght from film
group by rating
order by average_lenght;
 
 -- 7.Which kind of movies (rating) have a mean duration of more than two hours?
select rating, round(avg(length),2) as average_lenght from film
group by rating
having average_lenght > 120
order by average_lenght;
 
 /* 8.Rank films by length (filter out the rows that have nulls or 0s in length column). 
 In your output, only select the columns title, length, and the rank.*/
SELECT title, length, RANK() OVER (ORDER BY length DESC) AS 'rank' FROM film
WHERE length IS NOT NULL AND length > 0;


 