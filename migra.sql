-- employees_ranges
insert into employees_ranges(id, description, created_at, updated_at) values(1, 'testing', now(), now());

-- cities
insert into cities(id, description, created_at, updated_at) values(1, 'Bogota', now(), now());

-- Industries
insert into industries(id, description, created_at, updated_at) values(1, 'General', now(), now());

-- Categories
insert into job_categories(id, description, created_at, updated_at) values(1, 'General', now(), now());

-- Offer types
insert into offer_types(id, description, created_at, updated_at) values(1, 'General', now(), now());

-- Contract types
insert into contract_types(id, description, created_at, updated_at) values(1, 'General', now(), now());

-- Work modes
insert into work_modes(id, description, created_at, updated_at) values(1, 'General', now(), now());

-- Sexes
insert into sexes(id, description, created_at, updated_at) values(1, 'Hombre', now(), now());

-- Companies
insert into companies(id, name, contact_name, cellphone, contact_cellphone, nit, address, web_site,
contact_web_site, description, contact_work_position, email, created_at, updated_at, employees_range_id,
city_id)
select distinct
  u.id,
  company_name.meta_value as name,
  '-' as contact_name,
  '-' as cellphone,
  '-' as contact_cellphone,
  '-' as nit,
  '-' as address,
  company_website.meta_value as web_site,
  '-' as contact_web_site,
  '-' as description,
  '-' as contact_work_position,
  u.user_email as email,
  now() as created_at,
  now() as updated_at,
  1 as employees_range_id,
  1 as city_id
from ( select meta_value, user_id from hoytrabajas.wp_usermeta where meta_key='_company_name') as company_name
join ( select meta_value, user_id from hoytrabajas.wp_usermeta where meta_key='_company_website') as company_website
  on company_name.user_id=company_website.user_id
join hoytrabajas.wp_users as u on u.id=company_name.user_id;


-- ofertas con la fecha mal puesta
select * from hoytrabajas.wp_postmeta where meta_key='_job_deadline' and meta_value like '__-__-____';

update hoytrabajas.wp_postmeta set meta_value='2019-03-01' where meta_key='_job_deadline' and meta_value='01-03-2019';
update hoytrabajas.wp_postmeta set meta_value='2019-05-18' where meta_key='_job_deadline' and meta_value='18-05-2019';
update hoytrabajas.wp_postmeta set meta_value='2019-09-30' where meta_key='_job_deadline' and meta_value='20190930';
update hoytrabajas.wp_postmeta set meta_value='2019-10-15' where meta_key='_job_deadline' and meta_value='20191015';

-- Offers
insert into offers(title,address,cellphone,description,vacancies_quantity,close_date,immediate_start,required_experience,
description_responsibilities,release_date,status,city_id,job_category_id,offer_type_id,contract_type_id,
created_at,updated_at,work_mode_id,sex_id,company_id,slug)
select p.post_title as title,
    _job_location.meta_value as address,
    _job_phone.meta_value as cellphone,
    p.post_content as description,
    1 as vacancies_quantity,
    to_date(_job_deadline.meta_value, 'YYYY-MM-DD') as close_date,
    cast(coalesce(_job_inmediato.meta_value, '0') as boolean) as immediate_start,
    cast(coalesce(_job_noexperiencia.meta_value, '0') as boolean) as required_experience,
    _job_description.meta_value as description_responsibilities,
    p.post_date as release_date,
    p.post_status as status,
    1 as city_id,
    1 as job_category_id,
    1 as offer_type_id,
    1 as contract_type_id,
    p.post_date as created_at,
    p.post_date as updated_at,
    1 as work_mode_id,
    1 as sex_id,
    p.post_author as company_id,
    p.post_name as slug
from hoytrabajas.wp_posts as p
join (select post_id, meta_value from hoytrabajas.wp_postmeta where meta_key='_job_location') as _job_location
  on _job_location.post_id=p.id
join (select post_id, meta_value from hoytrabajas.wp_postmeta where meta_key='_job_phone') as _job_phone on _job_phone.post_id=p.id
join (select post_id, meta_value from hoytrabajas.wp_postmeta where meta_key='_job_deadline') as _job_deadline on _job_deadline.post_id=p.id
join (select post_id, case meta_value when '' then '0' else meta_value end as meta_value from hoytrabajas.wp_postmeta where meta_key='_job_inmediato') as _job_inmediato
  on _job_inmediato.post_id=p.id
join (select post_id, case meta_value when '' then '0' else meta_value end as meta_value from hoytrabajas.wp_postmeta where meta_key='_job_noexperiencia') as _job_noexperiencia
  on _job_noexperiencia.post_id=p.id
join (select post_id, meta_value from hoytrabajas.wp_postmeta where meta_key='_job_description') as _job_description
  on _job_description.post_id=p.id
where p.post_type='job_listing';
