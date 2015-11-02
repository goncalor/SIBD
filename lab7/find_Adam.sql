select depositor.customer_name, balance, amount
from account full outer join depositor full outer join borrower full outer join loan
where (borrower.customer_name = 'Adams'
		or depositor.customer_name = 'Adams'); 
