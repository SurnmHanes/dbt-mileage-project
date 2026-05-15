
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

with source_data as (

    select 
        PARSE_DATE( '%d.%m.%y', column1 ) as mileage_date,
        column2                 as mileage,
        column3                 as mileage_diff,
        Notes                   as remarks
    from
        {{ source('mileage_source', 'Mileage') }}
)

select * from source_data



