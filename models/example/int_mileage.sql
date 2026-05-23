with staging as (

    select * from {{ ref('mileage_transformed') }}
),

added_week as (

    select *,
        date_sub( mileage_date, interval 6 day) as week_start_date,
        mileage_date as week_end_date,
        concat( 
            format_date( '%-d %b %y', date_sub( mileage_date, interval 6 day) ),
            ' - ', 
            format_date( '%-d %b %y', mileage_date ) 
        ) as relevant_week
    
    from staging
)

select * from added_week