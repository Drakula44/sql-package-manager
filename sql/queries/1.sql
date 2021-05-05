-- Naci sve programe cije je ime duze od 10 karaktera i jos uvek su u alfi verzija im pocinje sa 0.

select *
from programs
where char_length(package_name) > 10 and version like '0%'