
```
sudo mount 172.20.84.67:/mnt/data /mnt/data
sudo mount 172.20.84.67:/mnt/data2 /mnt/data2
```

edit each config.json
```
docker cp config.json mindie:/root
```

in containers
```
cp /root/config.json /usr/local/Ascend/mindie/latest/mindie-service/conf/
```

```
cd /usr/local/Ascend/mindie/latest/mindie-service/
MIES_CONTAINER_IP=172.20.84.67 RANK_TABLE_FILE=/data/rank_table.json  bin/mindieservice_daemon

```
