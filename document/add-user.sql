-- 把 service.labs.cn 改为应用服务器(TOMCAT)所中主机IP

CREATE USER 'labs'@'service.labs.cn';

UPDATE mysql.user set password='*8B296F41E4BD17AE2164031E23C88420FC948048' where user='labs' and host='service.labs.cn';

GRANT ALL ON *.* TO 'labs'@'service.labs.cn';

FLUSH PRIVILEGES;
