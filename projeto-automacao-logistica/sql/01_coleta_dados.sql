-- SQL script for data collection and processing in the logistics automation project

-- Create table for storing raw data
CREATE TABLE raw_data (
    id INT PRIMARY KEY,
    data_date DATE,
    product_name VARCHAR(255),
    quantity INT,
    status VARCHAR(50)
);

-- Create table for processed data
CREATE TABLE processed_data (
    id INT PRIMARY KEY,
    data_date DATE,
    product_name VARCHAR(255),
    total_quantity INT,
    processing_status VARCHAR(50)
);

-- Insert mock data into raw_data table
INSERT INTO raw_data (id, data_date, product_name, quantity, status) VALUES
(1, '2023-01-01', 'Beverage A', 100, 'Completed'),
(2, '2023-01-01', 'Beverage B', 150, 'Pending'),
(3, '2023-01-02', 'Beverage C', 200, 'Completed'),
(4, '2023-01-02', 'Beverage D', 50, 'Pending');

-- Query to select all data from raw_data
SELECT * FROM raw_data;

-- Query to aggregate data for processed_data
INSERT INTO processed_data (id, data_date, product_name, total_quantity, processing_status)
SELECT 
    ROW_NUMBER() OVER (ORDER BY data_date) AS id,
    data_date,
    product_name,
    SUM(quantity) AS total_quantity,
    'Processed' AS processing_status
FROM raw_data
GROUP BY data_date, product_name;