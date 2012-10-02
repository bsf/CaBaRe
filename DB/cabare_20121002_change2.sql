SET SQL DIALECT 3;

SET NAMES WIN1251;

SET CLIENTLIB 'C:\FB\2_5\bin\fbclient.dll';


CONNECT 'D:\PRJ\BSF\CaBaRe\Release\20120921\DB\CABARE.GDB' USER 'SYSDBA' PASSWORD 'masterkey';

INSERT INTO BFW_ENT_FIELDS (ENTITYNAME, VIEWNAME, FIELDNAME, BAND, TITLE, VISIBLE, READONLY, EDITOR, EDITOR_OPTIONS, OPTIONS, REQ)
  VALUES ('CBR_MENU_GRP', 'Item', 'KITCHEN_ID', NULL, 'Кухня', 1, 0, 'Lookup', 'Entity=CBR_KITCHEN;EView=Lookup', NULL, 0);

INSERT INTO BFW_ENT_FIELDS (ENTITYNAME, VIEWNAME, FIELDNAME, BAND, TITLE, VISIBLE, READONLY, EDITOR, EDITOR_OPTIONS, OPTIONS, REQ)
  VALUES ('CBR_MENU_GRP', 'List', 'KITCHEN', NULL, 'Кухня', 1, 0, NULL, NULL, NULL, 0);

INSERT INTO BFW_ENT_FIELDS (ENTITYNAME, VIEWNAME, FIELDNAME, BAND, TITLE, VISIBLE, READONLY, EDITOR, EDITOR_OPTIONS, OPTIONS, REQ)
  VALUES ('CBR_MENU_GRP', 'New', 'KITCHEN_ID', NULL, 'Кухня', 1, 0, 'Lookup', 'Entity=CBR_KITCHEN;EView=Lookup', NULL, 0);

INSERT INTO BFW_ENT_FIELDS (ENTITYNAME, VIEWNAME, FIELDNAME, BAND, TITLE, VISIBLE, READONLY, EDITOR, EDITOR_OPTIONS, OPTIONS, REQ)
  VALUES ('CBR_ORD', 'DetailItems', 'ID', NULL, NULL, -1, 0, NULL, NULL, NULL, 0);

INSERT INTO BFW_ENT_FIELDS (ENTITYNAME, VIEWNAME, FIELDNAME, BAND, TITLE, VISIBLE, READONLY, EDITOR, EDITOR_OPTIONS, OPTIONS, REQ)
  VALUES ('CBR_ORD', 'DetailKOrd', 'KITCHEN', NULL, 'Кухня', 1, 0, NULL, NULL, NULL, 0);


COMMIT WORK;

UPDATE BFW_ENT_VIEWS
SET SQL_SELECT = 'execute procedure cbr_ev_kord_create(:ord_id)',
    IS_EXEC = 1
WHERE (ENTITYNAME = 'CBR_KORD') AND (VIEWNAME = 'Create');

INSERT INTO BFW_ENT_VIEWS (ENTITYNAME, VIEWNAME, SQL_SELECT, SQL_INSERT, SQL_INSERTDEF, SQL_UPDATE, SQL_DELETE, SQL_REFRESH, SQL_TITLE, READONLY, PKEY, IS_EXEC, TITLE, OPTIONS)
  VALUES ('CBR_KORD', 'NotPrinted', 'select h.id, k.printer
from cbr_kord h
left join cbr_kitchens k on (h.kitchen_id = k.id)
where h.ord_id = :ord_id and h.printed = 0', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL);

UPDATE BFW_ENT_VIEWS
SET SQL_SELECT = 'select id, name, idx, is_addon, addon_grp_id, kitchen_id from cbr_menu_grp where id = :id',
    SQL_UPDATE = 'update cbr_menu_grp set name = :name, idx = :idx, is_addon = :is_addon, addon_grp_id = :addon_grp_id, kitchen_id = :kitchen_id where id = :id'
WHERE (ENTITYNAME = 'CBR_MENU_GRP') AND (VIEWNAME = 'Item');

UPDATE BFW_ENT_VIEWS
SET SQL_SELECT = 'select g.id, g.name, g.idx, a.name addon_grp, g.is_addon, k.name kitchen 
from cbr_menu_grp g left join cbr_menu_grp a on (g.addon_grp_id = a.id) left join cbr_kitchens k on (k.id = g.kitchen_id)
order  by g.idx',
    SQL_REFRESH = 'select g.id, g.name, g.idx, a.name addon_grp, g.is_addon, k.name kitchen 
from cbr_menu_grp g left join cbr_menu_grp a on (g.addon_grp_id = a.id) left join cbr_kitchens k on (k.id = g.kitchen_id)
where g.id = :id'
WHERE (ENTITYNAME = 'CBR_MENU_GRP') AND (VIEWNAME = 'List');

UPDATE BFW_ENT_VIEWS
SET SQL_SELECT = 'select id, name, idx, is_addon, addon_grp_id, kitchen_id from cbr_menu_grp where id is null',
    SQL_INSERT = 'insert into cbr_menu_grp(id, name, idx, is_addon, addon_grp_id, kitchen_id) values(:id, :name, :idx, :is_addon, :addon_grp_id, :kitchen_id)'
WHERE (ENTITYNAME = 'CBR_MENU_GRP') AND (VIEWNAME = 'New');

UPDATE BFW_ENT_VIEWS
SET SQL_SELECT = 'select i.id, 
         (case when i.parent_id is not null then ''  +'' || m.name else m.name end) name,
         i.qty qty, i.qty * i.price summ
from  cbr_ordi i
     left join cbr_menu m on (i.menu_id = m.id)
where i.hid = :hid
order by i.id'
WHERE (ENTITYNAME = 'CBR_ORD') AND (VIEWNAME = 'DetailItems');

UPDATE BFW_ENT_VIEWS
SET SQL_SELECT = 'select h.id, h.idat, k.name kitchen from cbr_kord h left join cbr_kitchens k on (k.id = h.kitchen_id) 
where h.ord_id = :hid'
WHERE (ENTITYNAME = 'CBR_ORD') AND (VIEWNAME = 'DetailKOrd');


COMMIT WORK;

