@echo off
setlocal

set path=%path%;%~p0

echo mysqldump --host=localhost --user=root --password= lightbox ^> lightbox-backup.sql > lightbox-sample.cmdtext
echo mysql -h localhost -u root -D lightbox --password= >> lightbox-sample.cmdtext
echo mysql -h localhost -u root -D lightbox --password= ^< lightbox-sample.txt >> lightbox-sample.cmdtext

set Television=�e���r
set Refrigerator=�①��
set Airconditioner=�G�A�R��

chcp 65001
echo use lightbox;> lightbox-sample.sql
echo;>> lightbox-sample.sql
echo DROP TABLE IF EXISTS sample_syohin;>> lightbox-sample.sql
echo;>> lightbox-sample.sql
echo CREATE TABLE sample_syohin (>> lightbox-sample.sql
echo   scode varchar(4) not null default '',>> lightbox-sample.sql
echo   sname varchar(20) default null,>> lightbox-sample.sql
echo   primary key  (scode)>> lightbox-sample.sql
echo );>> lightbox-sample.sql
echo;>> lightbox-sample.sql
echo INSERT INTO sample_syohin VALUES ('0001','%Television%');>> lightbox-sample.sql
echo INSERT INTO sample_syohin VALUES ('0002','%Refrigerator%');>> lightbox-sample.sql
echo INSERT INTO sample_syohin VALUES ('0003','%Airconditioner%');>> lightbox-sample.sql

chcp 932
echo use lightbox;> lightbox-sample.txt
echo;>> lightbox-sample.txt
echo DROP TABLE IF EXISTS sample_syohin;>> lightbox-sample.txt
echo;>> lightbox-sample.txt
echo CREATE TABLE sample_syohin (>> lightbox-sample.txt
echo   scode varchar(4) not null default '',>> lightbox-sample.txt
echo   sname varchar(20) default null,>> lightbox-sample.txt
echo   primary key  (scode)>> lightbox-sample.txt
echo );>> lightbox-sample.txt
echo;>> lightbox-sample.txt
echo INSERT INTO sample_syohin VALUES ('0001','�e���r');>> lightbox-sample.txt
echo INSERT INTO sample_syohin VALUES ('0002','�①��');>> lightbox-sample.txt
echo INSERT INTO sample_syohin VALUES ('0003','�G�A�R��');>> lightbox-sample.txt

echo;
echo //////////////////////////////////////////////////////////////
echo ���̃R�}���h�v�����v�g�� MySQL �ւ̃p�X���ʂ��Ă��܂�
echo //////////////////////////////////////////////////////////////
echo;

cmd /K

endlocal
