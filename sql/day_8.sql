with recursive analysis as (
        select staff_id,
            staff_name,
            [staff_id] tree
        from staff
        where manager_id is null
    union all
        select s.staff_id,
            s.staff_name,
            list_prepend(s.staff_id, a.tree) tree
        from staff s
        left join analysis a on s.manager_id = a.staff_id
        where not list_contains(a.tree, s.staff_id)
)
select staff_id, staff_name, len(tree), tree
from analysis
order by len(tree) desc, staff_id
limit 10