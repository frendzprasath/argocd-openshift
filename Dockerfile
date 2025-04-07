FROM centos:7
 
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
 
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html

# Fix permissions for non-root access in OpenShift
RUN chmod -R a+rw /usr/share/nginx/html
 
EXPOSE 8080
 
CMD ["nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;"]
