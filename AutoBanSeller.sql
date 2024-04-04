create trigger BanSeller on shops
after update
as
begin
	update users
	set role = 1
	from users u
	join shops s on u.id = s.shop_id and ban_status = 2
end
go

create trigger UnbanSeller on shops
after update
as
begin
	update users
	set role = 2
	from users u
	join shops s on u.id = s.shop_id and ban_status = -1
end
go