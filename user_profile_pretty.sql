----------------------------------------------------------------------------------------
-- This script is helping us to generate the userprofile based on user_defined functions
----------------------------------------------------------------------------------------

--change the scope default to earliest
SET 'auto.offset.reset'='earliest';

--Main Logic
CREATE STREAM user_profile_pretty as
SELECT firstname || ' ' || ucase(lastname)
|| 'from' || countrycode
|| 'has a rating of ' || cast(rating as varchar) || 'stars. '
|| case when rating <2.5 'unsatisfied'
		when rating between 2.5 and 4.2 then 'satisfied'
		else 'Perfect'
		end as rating_description
from userprofile;
