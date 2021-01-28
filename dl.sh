#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

read -p "Please input url: " url
read -p "Please input filename: " filename

key=""
DIR="Downloads"
courseid=`echo ${url} | cut -d '=' -f 2 | cut -d '&' -f1`

Refer="https://edu.51cto.com/center/course/lesson/index?id=${courseid}"

Cookie=""

UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36"

cat > command.txt << EOF
--user-agent="${UA}"
--cookie="${Cookie}"
--referer="${Refer}"
--url="${url}"
--output="${filename}.m3u8"
EOF

curl -K command.txt && rm -rf command.txt

if [ -d tmp ]; then
        echo "DIR exist,skip"
else
        `mkdir tmp`
fi

array_ts=($(cat ${filename}.m3u8 | grep ".ts"))
#echo ${array_ts[@]}

DLARRAY=()
for addr in ${array_ts[@]}
do
        # echo $addr
        name=`echo $addr | cut -d '/' -f10`
        # echo $name
        wget -U "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36" $addr -O ./tmp/$name
        DLARRAY+=("$!")
done
wait ${DLARRAY[@]}

if [ -d ${DIR} ]; then
        echo "DIR exist,skip"
else
        `mkdir ${DIR}`
fi

cat ./tmp/*.ts >> ${DIR}/encode.ts

openssl aes-128-ecb -d -in "${DIR}/encode.ts" -out "${DIR}/${filename}.ts" -K ${key} && rm -rf ${DIR}/encode.ts && rm -rf ./tmp/*.ts

if [ -e ${DIR}/{filename}.ts ];then
	echo "Download success!"
else
	echo "Download failed"
fi
