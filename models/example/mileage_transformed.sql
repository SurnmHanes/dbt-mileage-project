
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

with source_data as (

    select 
        Date as mileage_date,
        m.Mileage                       as total_mileage,
        Mileage_Diff                    as weekly_mileage,
        Notes                           as remarks
    from
        {{ source('mileage_source', 'raw_mileage') }} as m
)

select * from source_data



