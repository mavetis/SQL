-- What query would you run to get the total revenue for March of 2012?
SELECT MONTHNAME(charged_datetime) AS month, SUM(billing.amount) AS revenue
FROM billing
WHERE billing.charged_datetime >= '2012/03/01' AND charged_datetime <= '2012/03/31';
-- WHERE charged_datetime LIKE '2012-03%'

-- What query would you run to get total revenue collected from the client with an id of 2?
SELECT clients.client_id, CONCAT(clients.first_name , ' ', clients.last_name), SUM(billing.amount)
FROM clients
LEFT JOIN billing ON clients.client_id = billing.client_id
WHERE clients.client_id = 2;

-- What query would you run to get all the sites that client with an id of 10 owns?
SELECT clients.client_id, CONCAT(clients.first_name, ' ', clients.last_name), clients.email, sites.domain_name
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
WHERE clients.client_id = 10;

--  What query would you run to get total # of sites created per month per year for the client with an id of 1? What about for client with an id of 20?
-- a
SELECT clients.client_id, COUNT(sites.domain_name)AS domain_name, MONTHNAME(sites.created_datetime) AS month, YEAR(sites.created_datetime) AS year
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
WHERE clients.client_id = 1
GROUP BY month, year;

-- b
SELECT clients.client_id, COUNT(sites.domain_name)AS domain_name, MONTHNAME(sites.created_datetime) AS month, YEAR(sites.created_datetime) AS year
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
WHERE clients.client_id= 20
GROUP BY month, year;

-- What query would you run to get the total # of leads generated for each of the sites between January 1, 2011 to February 15, 2011?
SELECT sites.domain_name AS website, COUNT(leads.leads_id)As num_of_leads, leads.registered_datetime
FROM sites
LEFT JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime >= '2011-01-01' AND leads.registered_datetime <='2011-02-15'
GROUP BY sites.domain_name; 

-- What query would you run to get a list of client names and the total # of leads we've generated for each of our clients between January 1, 2011 to December 31, 2011?
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client, COUNT(leads.leads_id)As num_of_leads
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
LEFT JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime >= '2011-01-01' AND leads.registered_datetime <= '2011-12-31'
GROUP BY clients.client_id;

-- What query would you run to get a list of client names and the total # of leads we've generated for each client each month between months 1 - 6 of Year 2011?
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client, COUNT(leads.leads_id) AS num_of_leads, MONTHNAME(leads.registered_datetime)AS month_generated
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
LEFT JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime >= '2011-01-01' AND leads.registered_datetime <= '2011-07-01'
GROUP BY  clients.client_id, MONTHNAME(leads.registered_datetime)
ORDER BY num_of_leads;

-- What query would you run to get a list of client names and the total # of leads we've generated for each of our clients' sites between January 1, 2011 to December 31, 2011? Order this query by client id.  
-- a
SELECT CONCAT(clients.first_name, ' ', clients.last_name), sites.domain_name, COUNT(leads.leads_id) AS num_of_leads
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
LEFT JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime >= '2011-01-01' AND leads.registered_datetime<= '2012-12-31'
 GROUP BY sites.domain_name
 ORDER BY clients.client_id;

-- Come up with a second query that shows all the clients, the site name(s), and the total number of leads generated from each site for all time.
-- b
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS name, sites.domain_name AS website, COUNT(leads.leads_id) AS num_of_leads
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
LEFT JOIN leads ON sites.site_id = leads.site_id
GROUP BY clients.client_id, sites.domain_name
ORDER BY clients.first_name, clients.last_name, sites.domain_name;

-- Write a single query that retrieves total revenue collected from each client for each month of the year. Order it by client id.  First try this with integer month, second with month name.  A SELECT subquery will be needed for the second challenge.  Look at this for a hint.
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client, SUM(billing.amount) AS total_revenue,
MONTHNAME(billing.charged_datetime) AS month, YEAR(billing.charged_datetime) AS year
FROM clients
LEFT JOIN billing on clients.client_id = billing.client_id
GROUP BY clients.client_id, MONTHNAME(billing.charged_datetime) 
ORDER BY clients.client_id, MONTHNAME(billing.charged_datetime)ASC, YEAR(billing.charged_datetime)ASC;

-- Write a single query that retrieves all the sites that each client owns. Group the results so that all of the sites for each client are displayed in a single field. It will become clearer when you add a new field called 'sites' that has all the sites that the client owns. (HINT: use GROUP_CONCAT)
SELECT CONCAT(clients.first_name,' ', clients.last_name) AS name, 
GROUP_CONCAT(' ',sites.domain_name)AS sites
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
GROUP BY clients.client_id;

