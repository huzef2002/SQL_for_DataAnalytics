create table payment(
payment_id int primary key,
order_id int,
customer_id int,
payment_date date,
amount decimal(10,2),
payment_method varchar(50),
status varchar(50) ,  --ADD CONSTRAINT
transaction_id int unique, 
payment_gateway varchar(50),
notes text,
processed_by int )



insert into payment(payment_id, order_id, customer_id, payment_date, amount, payment_method, status, transaction_id, payment_gateway, notes, processed_by)
values
(1, 1, 1, '2024-01-15', 110000, 'Credit Card', 'Completed', 'TXN001234567', 'Razorpay', 'No issues', 1),
(2, 2, 2, '2024-01-16', 75000, 'Debit Card', 'Pending', 'TXN001234568', 'Stripe', 'Waiting for confirmation', 2),
(3, 3, 3, '2024-01-17', 45000, 'UPI', 'Completed', 'TXN001234569', 'Paytm', 'Successful', 3),
(4, 4, 4, '2024-01-18', 25000, 'Net Banking', 'Completed', 'TXN001234570', 'PayU', 'Refund processed', 4),
(5, 5, 5, '2024-01-19', 24000, 'Credit Card', 'Failed', 'TXN001234571', 'Razorpay', 'Insufficient funds', 5),
(6, 6, 6, '2024-01-20', 18000, 'Wallet', 'Completed', 'TXN001234572', 'PhonePe', 'Quick payment', 6),
(7, 7, 7, '2024-01-21', 45000, 'Debit Card', 'Completed', 'TXN001234573', 'Stripe', 'International transaction', 7),
(8, 8, 8, '2024-01-22', 10000, 'UPI', 'Pending', 'TXN001234574', 'Google Pay', 'QR code scanned', 8),
(9, 9, 9, '2024-01-23', 7200, 'Net Banking', 'Completed', 'TXN001234575', 'Paytm', 'Corporate account', 9),
(10, 10, 10, '2024-01-24', 7000, 'Credit Card', 'Completed', 'TXN001234576', 'Razorpay', 'Installment payment', 10),
(11, 11, 11, '2024-01-25', 6000, 'Debit Card', 'Failed', 'TXN001234577', 'Stripe', 'Card expired', 11),
(12, 12, 12, '2024-01-26', 13500, 'UPI', 'Completed', 'TXN001234578', 'PhonePe', 'Family account', 12),
(13, 13, 13, '2024-01-27', 16000, 'Net Banking', 'Completed', 'TXN001234579', 'PayU', 'Bulk payment', 13),
(14, 14, 14, '2024-01-28', 10000, 'Credit Card', 'Pending', 'TXN001234580', 'Razorpay', 'Fraud check', 14),
(15, 15, 15, '2024-01-29', 7000, 'Wallet', 'Completed', 'TXN001234581', 'Paytm', 'Cashback applied', 15),
(16, 16, 16, '2024-01-30', 12000, 'Debit Card', 'Completed', 'TXN001234582', 'Stripe', 'Recurring payment', 16),
(17, 17, 17, '2024-01-31', 4500, 'UPI', 'Failed', 'TXN001234583', 'Google Pay', 'Network issue', 17),
(18, 18, 18, '2024-02-01', 3200, 'Net Banking', 'Completed', 'TXN001234584', 'PayU', 'Partial payment', 18),
(19, 19, 19, '2024-02-02', 3000, 'Credit Card', 'Completed', 'TXN001234585', 'Razorpay', 'International card', 19),
(20, 20, 20, '2024-02-03', 17000, 'Debit Card', 'Pending', 'TXN001234586', 'Stripe', 'Verification pending', 20);

alter table payment
alter column transaction_id varchar(30) ;

alter table payment 
drop constraint UQ__payment__85C600AE07577269;

exec sp_rename 'payment' , 'customer_payment'
exec sp_rename 'payment.payment_id', 'id', 'column'

alter table payment
add age varchar(30);

alter table payment
drop column age

alter table payment
add constraint ck_const check(status IN('Completed', 'Failed', 'Pending'))

select * from payment