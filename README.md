Affinity Answers|| TECHNICAL ASSIGNMENT
Full Stack Engineering
Overview :
This assignment is designed to evaluate your practical skills in Python programming, web scraping and data extraction, SQL and database querying, and Unix/Linux shell scripting.

Project Structure : 

technical-assignment/
├── README.md
├── question1/
│   └── scraper.py
├── question2/
│   └── queries.sql
└── question3/
    └── companies.sh
**
Question 1 — Python Web Scraping**
Product Information Extraction
Write a Python program to extract product information from the MDComputers website for a given search term.
Website: MDComputers
Example search URL: external hard drive
The program should:
Accept a search term as input from the user.
Use the search term to construct the appropriate search URL.
Retrieve the search-results page.
Parse the HTML response.
Extract the products listed in the search results.
Display the extracted products in a clear and readable format.
At minimum, extract:
Product name
Selling price
The search term should not be hard-coded. The program should work with different search terms.



**
Question 2 — SQL and Database**
The following questions are based on the public Rfam MySQL database.
Database documentation and connection details: Rfam Public MySQL Database
You may need to explore the database schema and understand the relationships between the available tables before writing your queries.
Some relevant tables: family, rfamseq, full_region, taxonomy, clan, clan_membership
A.
Write an SQL query to determine how many types of Acacia plants are present in the taxonomy table.
Return the result as a clearly named column.
B.
Write an SQL query to determine which type of wheat has the longest DNA sequence.
Use the appropriate information from the rfamseq and taxonomy tables.
Return the relevant wheat type and its DNA sequence length.
C.
Write an SQL query to generate a list containing:
Family name
Family accession
Maximum DNA sequence length
Only include families where the DNA sequence length is greater than 1,000,000.



**Question 3 — Unix Shell Scripting
**You are provided with a CSV dataset containing information about companies in the S&P 500.
Dataset: S&P 500 Companies — constituents.csv
Write a Unix shell script that accepts the above URL as a command-line argument and processes the CSV data.
The script should:
Accept the CSV URL as a command-line argument.
Retrieve the CSV data from the supplied URL.
Extract company name, location, and founding year.
Sort the resulting records by founding year.
Display the processed information in a clear and readable format.
Example
./companies.sh "DATASET_URL"
The URL should be supplied as an argument rather than being hard-coded inside the script.

