FROM fedora
ARG  var1=mysql
RUN  yum  install -y $var1

