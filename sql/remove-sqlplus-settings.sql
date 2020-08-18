
-- bind var is :v_sqltempfile

whenever sqlerror exit 1

begin
	-- this will raise a sqlplus error if the variable was not set in save-sqlplus-settings.sql
	-- there is no method to trap sqlplus errors from within a sql script
	-- this will just diplay the error
	if length(:v_sqltempfile) > 0 then
		null;
	end if;
end;
/

host [ ! $(ls -1 &sqltempfile  2>/dev/null) ] || { rm &sqltempfile; }


