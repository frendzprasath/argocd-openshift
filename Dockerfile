FROM centos:7
 
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
 
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx
 
ADD index.html /usr/share/nginx/html/index.html
 
EXPOSE 80/tcp
 
CMD ["nginx", "-g", "daemon off;"]