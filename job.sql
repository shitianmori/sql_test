
-- ����job
declare      
   call_proc_job number;
begin
   dbms_job.submit(call_proc_job, 'CALL_PROC;', sysdate, 'sysdate+10/86400');--ÿ10����һ����¼
end;

