with letters as (
    select id, chr(value) _char
    from letters_a
    where chr(value) similar to '[a-zA-Z !"(),-.:;?]'
    union all
    select id, chr(value) _char
    from letters_b
    where chr(value) similar to '[a-zA-Z !"(),-.:;?]'
    order by 1
)
select string_agg(_char, '')
from letters
