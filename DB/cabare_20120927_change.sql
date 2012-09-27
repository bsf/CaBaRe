SET NAMES WIN1251;

SET SQL DIALECT 3;

SET AUTODDL ON;

/* Alter Procedure... */
/* Alter (CBR_EV_KORD_CREATE) */
SET TERM ^ ;

ALTER PROCEDURE CBR_EV_KORD_CREATE(ORD_ID_ INTEGER)
 RETURNS(ID INTEGER,
PRINTER VARCHAR(250))
 AS
declare variable check_ integer;
declare variable const_state_active integer = 1;
declare variable const_state_precheck integer = 2;
declare variable ordi_id integer;
declare variable kordi_id integer;
declare variable kitchen_id integer;
begin
  id = null;

  select count(*)
  from cbr_ord h
       left join cbr_ordi i on (h.id = i.hid)
  where h.id = :ord_id_ and h.state_id < :const_state_precheck
        and i.kord_id is null
        and i.id is not null
  into :check_;

  if (coalesce(check_, 0) > 0) then
  begin
    update cbr_ord
    set state_id = :const_state_active
    where id = :ord_id_;

    for
      select distinct m.kitchen_id, k.printer
      from cbr_ordi i
           left join cbr_menu m on (i.menu_id = m.id)
           left join cbr_kitchens k on (k.id = m.kitchen_id)
      where i.hid = :ord_id_ and i.kord_id is null and i.parent_id is null
      into :kitchen_id, :printer
    do begin
      id = gen_id(cbr_gen_doc, 1);
      insert into cbr_kord(id, dat, ord_id, kitchen_id)
      values(:id, 'today', :ord_id_, :kitchen_id);


      for
        select i.id
        from cbr_ordi i
             left join cbr_menu m on (i.menu_id = m.id)
        where i.hid = :ord_id_ and i.kord_id is null
              and coalesce(m.kitchen_id, 0) = coalesce(:kitchen_id, 0)
        order by i.id
        into :ordi_id
      do begin
        kordi_id = gen_id(cbr_gen_doc, 1);
        insert into cbr_kordi(id, hid, ordi_id)
        values(:kordi_id, :id, :ordi_id);

        update cbr_ordi
        set kord_id = :id
        where id = :ordi_id;
      end
      suspend;
    end

    /*
    id = gen_id(cbr_gen_doc, 1);
    insert into cbr_kord(id, dat, ord_id)
    values(:id, 'today', :ord_id_);

    for
      select i.id
      from cbr_ord h
           left join cbr_ordi i on (h.id = i.hid)
      where h.id = :ord_id_ and i.kord_id is null
      into :ordi_id
    do begin
      kordi_id = gen_id(cbr_gen_doc, 1);
      insert into cbr_kordi(id, hid, ordi_id)
      values(:kordi_id, :id, :ordi_id);

      update cbr_ordi
      set kord_id = :id
      where id = :ordi_id;

    end*/
  end
--  suspend;
end
^

SET TERM ; ^

INSERT INTO BFW_ENT_FIELDS (ENTITYNAME, VIEWNAME, FIELDNAME, BAND, TITLE, VISIBLE, READONLY, EDITOR, EDITOR_OPTIONS, OPTIONS, REQ)
  VALUES ('CBR_ORD', 'DetailKOrd', 'KITCHEN', NULL, 'Кухня', 1, 0, NULL, NULL, NULL, 0);


COMMIT WORK;

UPDATE BFW_ENT_VIEWS
SET SQL_SELECT = 'select h.id, h.idat, k.name kitchen from cbr_kord h left join cbr_kitchens k on (k.id = h.kitchen_id) 
where h.ord_id = :hid',
    SQL_INSERT = NULL,
    SQL_INSERTDEF = NULL,
    SQL_UPDATE = NULL,
    SQL_DELETE = NULL,
    SQL_REFRESH = NULL,
    SQL_TITLE = NULL,
    READONLY = 1,
    PKEY = NULL,
    IS_EXEC = 0,
    TITLE = 'Бегунки',
    OPTIONS = NULL
WHERE (ENTITYNAME = 'CBR_ORD') AND (VIEWNAME = 'DetailKOrd');


COMMIT WORK;

