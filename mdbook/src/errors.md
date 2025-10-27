```
MIES_CONTAINER_IP=127.20.84.67 RANK_TABLE_FILE=/data/rank_table.json  bin/mindieservice_daemon

```
npuDeviceID does not allow repetitive element
The size of npuDeviceIds does not equal to modelInstanceNumber
The size of npuDeviceIds does not equal to worldSize 

```
(inference) [105841 al@gx1 inference]$ uv add -r requirements.txt -p 3.11
Resolved 39 packages in 5.49s
error: Distribution `triton==3.0.0 @ registry+https://pypi.org/simple` can't be installed because it doesn't have a source distribution or wheel for the current platform

hint: You're on Linux (`manylinux_2_28_aarch64`), but `triton` (v3.0.0) only has wheels for the following platforms: `manylinux_2_17_x86_64`, `manylinux2014_x86_64`; consider adding "sys_platform == 'linux' and platform_machine == 'aarch64'" to `tool.uv.required-environments` to ensure uv resolves to a version with compatible wheels
```
