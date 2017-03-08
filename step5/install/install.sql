@?/ctx/admin/catctx.sql oracle SYSAUX TEMP NOLOCK;
connect CTXSYS/oracle
@?/ctx/admin/defaults/dr0defin.sql "AMERICAN";
connect sys/change_on_install as sysdba
alter user ctxsys account lock password expire;
select comp_name,version,status from dba_registry;
