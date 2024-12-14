with greens as (
    SELECT record_id,
        record_date,
        unnest(list_filter(
            cleaning_receipts ->> '$[*]',
            x -> json_extract_string(x, '$.color') = 'green' and json_extract_string(x, '$.garment') = 'suit'
        )) receipt
        -- unnest(list_filter(cleaning_receipts ->> '$[*]', lambda x -> x ->> '$.color' = 'green'))
    FROM SantaRecords
    where list_contains(cleaning_receipts ->> '$[*].color', 'green')
        and list_contains(cleaning_receipts ->> '$[*].garment', 'suit')
)
select *
from greens
order by json_extract(receipt, '$.drop_off')::date desc
limit 10
