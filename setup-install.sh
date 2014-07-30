INSTALL_ENV=`python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
[ -d ${INSTALL_ENV}/glance ] || mkdir -p ${INSTALL_ENV}/glance
cp -rf /usr/share/glance/* ${INSTALL_ENV}/glance
cp -rf /usr/local/etc/rc.d/init.d/openstack-glance* /etc/init.d
cp  /usr/local/etc/rc.d/init.d/openstack-glance* /etc/rc.d/init.d/

[ -d /etc/glance ] || mkdir /etc/glance
cp /usr/share/glance/etc/* /etc/glance
cp /usr/local/*.py ${INSTALL_ENV}/glance/
 
if [ -f /etc/glance/glance.conf.sample ];then
mv -f /etc/glance/glance.conf.sample /etc/glance/glance.conf
fi

[ -d /var/lib/glance ] || mkdir /var/lib/glance
[ -d /var/log/glance ] || mkdir /var/log/glance
[ -d /var/run/glance ] || mkdir /var/run/glance