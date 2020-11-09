select 
    b.example_id as example_id,
    a.person_id as person_id,
    a.procedure_concept_id || ' - procedure - ' || coalesce (
        c.concept_name, 'no match'
    ) as concept_name,
    a.procedure_datetime as feature_start_date,
    b.start_date as person_start_date,
    b.end_date as person_end_date
from 
    {cdm_schema}.procedure_occurrence a
inner join
    {cohort_table} b
on 
    a.person_id = b.person_id
left join
    {cdm_schema}.concept c
on 
    c.concept_id = a.procedure_concept_id


