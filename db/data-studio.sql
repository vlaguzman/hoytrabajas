-- Users
select 'candidato' as tipo, u.id, u.email, u.created_at, sexes.description gender, cities.description city
from users u left join sexes on u.sex_id=sexes.id
left join cities on u.city_id=cities.id
union
select 'empresa' as tipo,   c.id, c.email, c.created_at, '' gender, cities.description city
from companies c
left join cities on c.city_id=cities.id;

-- Orders
select o.id, coalesce(o.release_date, o.created_at) offer_date, o.title, ot.description, status, companies.name, cities.description city, count(applied_offers.id) aplicantes,
created_by_admin, string_agg(distinct jc.description, ',' order by jc.description) category
from offers o
join offer_types ot on o.offer_type_id=ot.id
join job_categories_offers jco on o.id=jco.offer_id
join job_categories jc on jco.job_category_id=jc.id
join companies on o.company_id=companies.id
left join cities on o.city_id=cities.id
left join applied_offers on applied_offers.offer_id=o.id
group by o.id, o.release_date, o.title, ot.description, status, companies.name, cities.description, created_by_admin;

-- Applications
select applied_offers.id application_id, aos.description status, applied_date, offers.id offer_id, offers.title offer_title,
string_agg(jc.description, ', ' order by jc.description) category,
ot.description offer_type, users.id user_id, users.email, sexes.description gender, cities.description city, companies.name company
from applied_offers
join offers on applied_offers.offer_id=offers.id
join applied_offer_statuses aos on applied_offers.applied_offer_status_id=aos.id
join job_categories_offers jco on offers.id=jco.offer_id
join job_categories jc on jco.job_category_id=jc.id
join offer_types ot on offers.offer_type_id=ot.id
join curriculum_vitaes cv on applied_offers.curriculum_vitae_id=cv.id
join users on cv.user_id=users.id
join companies on offers.company_id=companies.id
left join sexes on users.sex_id=sexes.id
left join cities on offers.city_id=cities.id
group by applied_offers.id, aos.description, applied_date, offers.id, offers.title, ot.description, users.id, users.email, sexes.description, cities.description, companies.name;
