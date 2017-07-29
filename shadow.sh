#!/bin/sh
#
echo 'Go!'
sleep 2
echo '创建临时目录'
echo ''
mkdir -p /tmp/geewan
cd /tmp/geewan
echo 'Done! 成功创建临时目录!'
echo ''
sleep 3
echo '下载插件'
echo ''

if [ "$1"x = "12515805sx" ]; then
    echo "=1.2.5.15805s"
    curl -k https://raw.githubusercontent.com/qiwihui/hiwifi-ss/master/ss.12515805s.tar.gz -o ss.tar.gz
else
    echo ">1.2.5.15805s"
    curl -k https://raw.githubusercontent.com/qiwihui/hiwifi-ss/master/ss.tar.gz -o ss.tar.gz
fi

echo 'Done! 下载完成'
echo ''
sleep 3
echo -n "备份系统文件...."

if [ -f /usr/lib/lua/luci/view/admin_web/menu/menu_left.htm.ssbak ]; then
    echo -e "...[\e[31m备份已存在\e[0m]"
else
    cp -a /usr/lib/lua/luci/view/admin_web/menu/menu_left.htm /usr/lib/lua/luci/view/admin_web/menu/menu_left.htm.ssbak
    echo -e "....[\e[32m备份完成\e[0m]"
fi

echo '安装插件...'
tar xzvf ss.tar.gz -C / >>/dev/null
echo -e '...[\e[32m安装成功\e[0m]'

echo ''
sleep 3
echo '添加卸载信息...'
echo ''
echo '' >>/usr/lib/opkg/status
echo 'Package: geewan-ss' >>/usr/lib/opkg/status
echo 'Version: master-20130924-eb9d31869e1d7590cd8c2fb1e7d226ac6cf32fad-20141024' >>/usr/lib/opkg/status
echo 'Provides:' >>/usr/lib/opkg/status
echo 'Status: install hold installed' >>/usr/lib/opkg/status
echo 'Architecture: ralink' >>/usr/lib/opkg/status
echo 'Installed-Time: 1422509506' >>/usr/lib/opkg/status
echo 'Auto-Installed: yes' >>/usr/lib/opkg/status
echo '' >>/usr/lib/opkg/status

echo '清理临时文件...'
echo ''
if test -e /var/run/luci-indexcache; then
    rm /var/run/luci-indexcache && echo 'Done! 清理完成 ' && echo '';
else
    echo 'luci-cache does not exist! 无法找到luci-cache,请确定是否是极路由环境' && echo ''
fi
rm -rf /tmp/geewan
sleep 3
echo '插件成功安装!'
echo '1987年9月14日21时07分'
echo '中国第一封电子邮件'
echo '从北京发往德国'
echo '越过长城，走向世界'
echo 'Done! Hello World! 一切就绪,你好世界!'
