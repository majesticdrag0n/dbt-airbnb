with rd as(
    select
        listing_id,
        review_date
        from {{ ref('fct_reviews')}}
),

dl as (
    select
        listing_id,
        created_at
    from {{ ref('dim_listings_cleansed')}}
)

select rd.listing_id,
    rd.review_date,
    dl.created_at
from rd
left join dl
on rd.listing_id = dl.listing_id
where rd.review_date < dl.created_at