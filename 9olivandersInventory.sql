with main as (
    select w.*,
           wp.age,
           min(coins_needed) over (partition by age,power) as min_needed
    from wands as w
        left join wands_property as wp 
            on wp.code = w.code
    where wp.is_evil = 0
             )
select id,
       age,
       coins_needed,
       power
from main
where coins_needed = min_needed
order by 4 desc,2 desc;