CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(255),
    publish_year YEAR,
    genre VARCHAR(100),
    quantity INT
);
INSERT INTO books (title, author, publish_year, genre, quantity) VALUES
('A Game of Thrones', 'George R. R. Martin', 1996, 'Fantasy', 10),
('A Clash of Kings', 'George R. R. Martin', 1998, 'Fantasy', 8),
('A Storm of Swords', 'George R. R. Martin', 2000, 'Fantasy', 7),
('A Feast for Crows', 'George R. R. Martin', 2005, 'Fantasy', 6),
('A Dance with Dragons', 'George R. R. Martin', 2011, 'Fantasy', 5),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction', 5),
('1984', 'George Orwell', 1949, 'Dystopian', 3),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction', 4),
('The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy', 2),
('Brave New World', 'Aldous Huxley', 1932, 'Dystopian', 6);
CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    dob DATE,
    membership_date DATE,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15) 
);
INSERT INTO members (first_name, last_name, dob, membership_date, email, phone_number) VALUES
('sakshi', 'singh', '2004-07-16', '2021-02-20', 'sakshisingh@email.com', '1234567890'),
('saumya', 'singh', '2006-12-20', '2020-03-17', 'saumyasingh@email.com', '0987654321'),
('kiran', 'singh', '2000-06-02', '2022-05-10', 'kiransingh@email.com', '1122334455');

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    status ENUM('Borrowed', 'Returned'),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
INSERT INTO transactions (member_id, book_id, borrow_date, return_date, status) VALUES
(1, 1, '2025-02-01', '2025-02-10', 'Borrowed'),
(1, 3, '2025-02-02', '2025-02-12', 'Borrowed'),
(2, 2, '2025-02-05', '2025-02-15', 'Borrowed'),
(2, 4, '2025-02-06', '2025-02-16', 'Borrowed'),
(3, 5, '2025-02-07', '2025-02-17', 'Borrowed'),
(3, 1, '2025-02-07', '2025-02-17', 'Borrowed');
SELECT * FROM books WHERE quantity > 0;

SELECT book_id, COUNT(transaction_id) AS borrow_count
FROM transactions
GROUP BY book_id
ORDER BY borrow_count DESC;

SELECT b.title, b.author, t.borrow_date, t.return_date
FROM transactions t
JOIN books b ON t.book_id = b.book_id
WHERE t.member_id = 1;

SELECT DISTINCT m.first_name, m.last_name, m.email
FROM transactions t
JOIN members m ON t.member_id = m.member_id
WHERE t.status = 'Borrowed' AND t.return_date < CURDATE();

SELECT member_id, COUNT(transaction_id) AS total_books_borrowed
FROM transactions
GROUP BY member_id;

SELECT book_id, COUNT(transaction_id) AS borrow_count
FROM transactions
GROUP BY book_id
HAVING borrow_count > 1;

ALTER TABLE members ADD phone_number VARCHAR(15);

UPDATE books
SET quantity = quantity - 1
WHERE book_id = 1; 

SELECT b.title, b.author
FROM books b
LEFT JOIN transactions t ON b.book_id = t.book_id
WHERE t.borrow_date < CURDATE() - INTERVAL 1 YEAR OR t.borrow_date IS NULL;

SELECT DISTINCT m.first_name, m.last_name
FROM transactions t
JOIN books b ON t.book_id = b.book_id
JOIN members m ON t.member_id = m.member_id
WHERE b.genre = 'Science Fiction';

SELECT member_id, MAX(borrow_date) AS most_recent_borrow_date
FROM transactions
GROUP BY member_id;

SELECT YEAR(borrow_date) AS year, MONTH(borrow_date) AS month, COUNT(transaction_id) AS total_books_borrowed
FROM transactions
GROUP BY YEAR(borrow_date), MONTH(borrow_date);

DELIMITER //
CREATE TRIGGER update_book_quantity_after_borrow
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    IF NEW.status = 'Borrowed' THEN
        UPDATE books SET quantity = quantity - 1 WHERE book_id = NEW.book_id;
    ELSEIF NEW.status = 'Returned' THEN
        UPDATE books SET quantity = quantity + 1 WHERE book_id = NEW.book_id;
    END IF;
END;
//
DELIMITER ;

SELECT b.title, b.author, m.first_name, m.last_name
FROM transactions t
JOIN books b ON t.book_id = b.book_id
JOIN members m ON t.member_id = m.member_id
WHERE t.status = 'Borrowed';

SELECT b.title, b.author, m.first_name, m.last_name, t.return_date
FROM transactions t
JOIN books b ON t.book_id = b.book_id
JOIN members m ON t.member_id = m.member_id
WHERE t.return_date = CURDATE() OR t.return_date = CURDATE() + INTERVAL 1 DAY;

CREATE INDEX idx_book_id ON transactions(book_id);




