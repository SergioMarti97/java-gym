use gym_db;

insert into `exercise`(`name`) values("Press de banca");
insert into `exercise`(`name`) values("Sentadilla");
insert into `exercise`(`name`, `id_parent`) values("Press mancuerna plano", 1);

select * from `exercise`;

delete from `exercise` where `id` = 1;