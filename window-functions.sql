/* find top n ranked products using window functions
 row_number() is sequential like 1, 2, 3, 4
 rank() assigns the same rank to same values and skips the next number like 1, 2, 2, 4
 dense_rank() assigns the same rank to same values and does not skip any number like 1, 2, 2, 3
*/

with ranked_products as(
    select product_id,
    category,
    revenue,
    dense_rank() over (partition by category order by revenue desc) as rnk 
    from sales
)
select product_id, category, revenue
from ranked_products
where rnk <= 3
