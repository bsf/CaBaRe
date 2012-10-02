/* Server version: WI-V6.3.0.26074 Firebird 2.5 
   SQLDialect: 3. ODS: 11.2. Forced writes: On. Sweep inteval: 20000.
   Page size: 16384. Cache pages: 2048 (32768 Kb). Read-only: False. */
SET CLIENTLIB 'C:\FB\2_5\bin\fbclient.dll';
SET NAMES WIN1251;

SET SQL DIALECT 3;

CONNECT 'D:\PRJ\BSF\CaBaRe\Release\20120921\DB\CABARE.GDB' USER 'SYSDBA' PASSWORD 'masterkey';

SET AUTODDL ON;

ALTER TABLE CBR_KORD ADD PRINTED INTEGER DEFAULT 0 NOT NULL;

ALTER TABLE CBR_KORD ADD PRINT_TIME TIMESTAMP;

ALTER TABLE CBR_MENU_GRP ADD KITCHEN_ID INTEGER;

/* Create Procedure... */
SET TERM ^ ;

CREATE PROCEDURE CBR_EV_KORD_PRINT(ID_ INTEGER)
 RETURNS(ID INTEGER)
 AS
 BEGIN SUSPEND; END
^


/* Alter Procedure... */
/* Alter (CBR_EV_KORD_CREATE) */
ALTER PROCEDURE CBR_EV_KORD_CREATE(ORD_ID_ INTEGER)
 AS
declare variable id integer;
declare variable check_ integer;
declare variable const_state_active integer = 1;
declare variable const_state_precheck integer = 2;
declare variable ordi_id integer;
declare variable ordi_child_id integer;
declare variable kordi_id integer;
declare variable kitchen_id integer;
begin
  id = null;

  select count(*)
  from cbr_ord h
       left join cbr_ordi i on (h.id = i.hid)
  where h.id = :ord_id_
        and i.kord_id is null
        and i.id is not null
  into :check_;

  if (coalesce(check_, 0) > 0) then
  begin
    update cbr_ord
    set state_id = :const_state_active
    where id = :ord_id_;

    for
      select distinct coalesce(m.kitchen_id, g.kitchen_id)
      from cbr_ordi i
           left join cbr_menu m on (i.menu_id = m.id)
           left join cbr_menu_grp g on (g.id = m.grp_id)
      where i.hid = :ord_id_ and i.kord_id is null and i.parent_id is null
      into :kitchen_id
    do begin
      id = gen_id(cbr_gen_doc, 1);
      insert into cbr_kord(id, dat, ord_id, kitchen_id)
      values(:id, 'today', :ord_id_, :kitchen_id);


      for
        select i.id
        from cbr_ordi i
             left join cbr_menu m on (i.menu_id = m.id)
             left join cbr_menu_grp g on (g.id = m.grp_id)
        where i.hid = :ord_id_ and i.kord_id is null and i.parent_id is null
              and coalesce(m.kitchen_id, g.kitchen_id, 0) = coalesce(:kitchen_id, 0)
        order by i.id
        into :ordi_id
      do begin
        kordi_id = gen_id(cbr_gen_doc, 1);
        insert into cbr_kordi(id, hid, ordi_id)
        values(:kordi_id, :id, :ordi_id);

        update cbr_ordi
        set kord_id = :id
        where id = :ordi_id;

        --mod
        for
          select i.id
          from cbr_ordi i
          where i.parent_id = :ordi_id
          into :ordi_child_id
        do begin
          kordi_id = gen_id(cbr_gen_doc, 1);
          insert into cbr_kordi(id, hid, ordi_id)
          values(:kordi_id, :id, :ordi_child_id);

          update cbr_ordi
          set kord_id = :id
          where id = :ordi_child_id;
        end

      end
    end

  end
end
^

/* Restore proc. body: CBR_EV_KORD_PRINT */
ALTER PROCEDURE CBR_EV_KORD_PRINT(ID_ INTEGER)
 RETURNS(ID INTEGER)
 AS
begin
  id = id_;
  update cbr_kord
  set printed = 1
  where id = :id;
  suspend;
end
^

/* Creating trigger... */
CREATE TRIGGER CBR_KORD_BU FOR CBR_KORD
ACTIVE BEFORE UPDATE POSITION 0 
as
begin
  if (old.printed = 0 and new.printed = 1) then
    new.print_time = 'now';
end
^


/* Alter Procedure... */
SET TERM ; ^

