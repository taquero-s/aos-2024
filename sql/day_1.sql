.mode list
.separator ","
with wishes as (
    select c.name,
        wl.wishes ->> '$.first_choice' primary_wish,
        wl.wishes ->> '$.second_choice' backup_wish,
        wl.wishes ->> '$.colors[0]' favorite_color,
        len(wl.wishes -> '$.colors[*]') colors
    from children c
    left join wish_lists wl using (child_id)
    order by 1
)
select w.*,
    case
        when tc.difficulty_to_make = 1 then 'Simple Gift'
        when tc.difficulty_to_make = 2 then 'Moderate Gift'
        else 'Complex Gift'
    end gift_complexity,
    case
        when tc.category = 'outdoor' then 'Outside Workshop'
        when tc.category = 'educational' then 'Learning Workshop'
        else 'General Workshop'
    end workshop_assignment
from wishes w
left join toy_catalogue tc on w.primary_wish = tc.toy_name
limit 5
;
