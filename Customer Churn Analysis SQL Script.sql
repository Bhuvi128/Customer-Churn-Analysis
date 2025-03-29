use telecom_customers;

-- Verify tables
show tables;

desc customers;
desc services;
desc billing;
desc customer_churn;


-- Exploratory Data Analysis (EDA)

/*  Check total customers */

select count(*) total_customers 
from customers;

/* Find how much customers churned */

SET SQL_SAFE_UPDATES = 0;

UPDATE customer_churn 
SET churn = REPLACE(churn, CHAR(13), '');

SET SQL_SAFE_UPDATES = 0; 

select churn, count(*) total_customers,
round((count(*) / (select count(*) from customers) * 100),2) churn_rate
from customer_churn
group by churn;

/* Find which gender of customers the company have more */

select gender, count(*) 
from customers
group by gender;

/* Find which gender of customers churned more */

select cu.gender, ch.churn, count(*) total_customers
from customers cu left join customer_churn ch
on cu.customer_id = ch.customer_id
group by cu.gender, ch.churn;

/* Find how much customers are senior citizens */

select seniorcitizen, count(*) total_customers
from customers
group by seniorcitizen;

/* Find how much senior citizen customers churned */

select cu.seniorcitizen, ch.churn,
count(*) total_customers
from customers cu left join customer_churn ch
on cu.customer_id = ch.customer_id
group by cu.seniorcitizen, ch.churn;

/* How much of the customers are partnered */

select partner, count(*) total_customers
from customers
group by partner;

/* Find whether partnered customers are churned or not partenered customers churned */

select cu.partner, ch.churn,
count(*) total_customers
from customers cu left join customer_churn ch
on cu.customer_id = ch.customer_id
group by cu.partner, ch.churn;






