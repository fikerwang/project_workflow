drop table wf_list;
drop table wf_step;
drop table wf_sub_step;

create table wf_list
(
   workflow_id        number,
   workflow_name      varchar2(300) not null,
   status_code        varchar2(30) check(status_code in ('RUN','STOP','SCHEDULED','INTERRUPTED')),
   completed_count    number,
   failed_count       number,
   last_run_states    varchar2(30) check(last_run_states in ('OK','FAILED','INTERRUPTED')),
   creation_date      date default sysdate,
   created_by         number default -1,
   last_update_date   date default sysdate,
   last_updated_by    number default -1
);

create unique index wf_list_u01 on wf_list(workflow_id);
create unique index wf_list_u02 on wf_list(upper(workflow_name));

alter table wf_list add constraints wf_list_pk primary key (workflow_id);


create table wf_step
(
   workflow_id        number not null,
   step_id            number,
   step_name          number,
   step_action        varchar2(2000),
   status_code        varchar2(30) check(status_code in ('PENDING','PROCESSING','OK','FALIED','HOLD')),
   hold_flag          varchar2(1) default 'N' check(hold_flag in ('Y','N')) ,
   creation_date      date default sysdate,
   created_by         number default -1,
   last_update_date   date default sysdate,
   last_updated_by    number default -1
);

create unique index wf_step_u01 on wf_step(step_id);
create unique index wf_step_u02 on wf_step(workflow_id,upper(step_name));

alter table wf_step add constraints wf_step_pk primary key (step_id);


create table wf_sub_step
(
   workflow_id        number not null,
   step_id            number not null,
   parent_step_id     number,
   creation_date      date default sysdate,
   created_by         number default -1,
   last_update_date   date default sysdate,
   last_updated_by    number default -1
);

create unique index wf_sub_step_u01 on wf_sub_step(workflow_id,step_id,parent_step_id);