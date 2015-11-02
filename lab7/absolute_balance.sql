use ist173294

drop function a_balance;

delimiter $$

create function a_balance(c_name varchar(255))
returns integer
begin
	declare a_balance integer;
    select (ifnull(sum(a.balance),0) - sum(l.amount)) into a_balance
    from account as a, depositor as d, borrower as b, loan as l
    where a.account_number = d.account_number
    -- and d.customer_name = b.customer_name
    and b.loan_number = l.loan_number
    and d.customer_name = c_name;
	return a_balance;
end$$

delimiter ;
