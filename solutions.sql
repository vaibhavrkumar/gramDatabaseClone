-- oldest users
-- select * from users order by created_at limit 5;

-- most popular registeration date
-- SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- select DAYNAME(created_at) as day, count(*)
-- from users
-- group by day
-- order by count(*);

-- identifying inactoive users
-- select username, image_url
-- from users 
-- left join photos
-- on users.id = photos.user_id
-- where photos.id is null;

-- most liked photo

select photos.id, photos.image_url, count(*)AS total , username 
from photos, likes, users
where photos.id = likes.photo_id and users.id = photos.user_id
group by photos.id
order by total desc
limit 1;