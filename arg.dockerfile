FROM fedora
ARG  build_var1=mysql
ENV  env_var=$build_var1
ADD  a.sh /opt/
WORKDIR  /opt
RUN chmod  +x  a.sh
CMD ["bash","/opt/a.sh"]
