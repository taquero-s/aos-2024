with mins as (
    select *, row_number() over yoe rn
    from workshop_elves
    window yoe as (partition by primary_skill order by years_experience, elf_id)
), maxs as (
    select *, row_number() over yoe rn
    from workshop_elves
    window yoe as (partition by primary_skill order by years_experience desc, elf_id)
)
select we1.elf_id elf_id_1,
    we2.elf_id elf_id_2,
    we1.primary_skill shared_skill,
from maxs we1
left join mins we2 on we1.primary_skill = we2.primary_skill
    and we1.years_experience > we2.years_experience
where we1.rn = 1 and we2.rn = 1
order by 3
limit 5
;
