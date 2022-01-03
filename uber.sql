# Write your MySQL query statement below
with unbanned_date as (
    select trips.*, clients.banned c_banned, drivers.banned d_banned
    from trips 
    join users clients on trips.client_id = clients.users_id
    join users drivers on trips.driver_id = drivers.users_id
    where trips.request_at between '2013-10-01' and '2013-10-03'
    and clients.banned = 'No' and drivers.banned = 'No'
),
canceled as (
select request_at, count(status) c
    from unbanned_date
    where status in ('cancelled_by_driver', 'cancelled_by_client')
    group by request_at
)
select ud.request_at Day, round(ifnull(c,0)/count(id),2) "Cancellation Rate"
from unbanned_date ud
left join canceled c on ud.request_at = c.request_at 
group by c.request_at