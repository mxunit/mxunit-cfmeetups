insert into users(firstname,lastname,username,password)
values('Marc','Esher','mesher','mesher');

insert into users(firstname,lastname,username,password)
values('Bill','Shelton','bshelton','bshelton');

insert into permissions(PermissionName)
values('Kick it');

insert into permissions(PermissionName)
values('SmokeStogies');

insert into permissions(PermissionName)
values('BuyScotch');

insert into permissions(PermissionName)
values('Eat Ice Cream');

insert into permissions(PermissionName)
values('Eat Steak');

insert into permissions(PermissionName)
values('Play Hookie From Work');

insert into j_users_permissions(userid,permissionid)
values(1,1);

insert into j_users_permissions(userid,permissionid)
values(1,2);

insert into j_users_permissions(userid,permissionid)
values(2,2);

insert into j_users_permissions(userid,permissionid)
values(2,3);

insert into CleanupConfig(DirectoryPath,StaleInMinutes)
values('\\path\to\share\dir',30);


insert into CleanupConfig(DirectoryPath,StaleInMinutes)
values('\\path\to\othershare\dir',60);