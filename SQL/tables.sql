create table wf_list
(
   id                 number,
   workflow_name      varchar2(300) not null,
   status_code        varchar2(30) check(status_code in ('RUN','STOP','SCHEDULED','INTERRUPTED')),
   completed_count    number,
   failed_count       number,
   last_run_states    varchar2(30) check(last_run_states in ('SUCCESS','FAILED','INTERRUPTED')),
   creation_date      date default sysdate,
   created_by         number default -1,
   last_update_date   date default sysdate,
   last_updated_by    number default -1
);

create unique index wf_list_u01 on wf_list(id);
create unique index wf_list_u02 on wf_list(upper(workflow_name));