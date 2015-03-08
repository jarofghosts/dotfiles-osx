for D in `ls -d */`; do cd ${D}; git pull; cd ..; done
