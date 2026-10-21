# longcat-video-offline

### links
* [LongCat-Video Ascend NPU 适配文档](https://ai.gitcode.com/JeffDing/LongCat-Video-Ascend-model)

```
git clone https://atomgit.com/JeffDing/LongCat-Video-Ascend-model.git
```

```
SHM_SIZE=256 CONTAINER_NAME=longcat-video DOCKER_IMAGE=quay.io/ascend/vllm-omni DOCKER_IMAGE_TAG=v0.30.0 /mnt/s/ascend/vllm/bin/docker-run.sh
```

```
cd ..
cp /s/git/atomgit/LongCat-Video-Ascend-model/ . -r
cd LongCat-Video-Ascend-model/
pip install -r requirements-npu.txt
```

```
...
  Attempting uninstall: tokenizers
    Found existing installation: tokenizers 0.22.2
    Uninstalling tokenizers-0.22.2:
      Successfully uninstalled tokenizers-0.22.2
  Attempting uninstall: diffusers
    Found existing installation: diffusers 0.40.0
    Uninstalling diffusers-0.40.0:
      Successfully uninstalled diffusers-0.40.0
  Attempting uninstall: transformers
    Found existing installation: transformers 5.14.1
    Uninstalling transformers-5.14.1:
      Successfully uninstalled transformers-5.14.1
ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
ms-service-profiler 26.0.0 requires matplotlib, which is not installed.
ms-service-profiler 26.0.0 requires msguard, which is not installed.
affinity-sched 26.1.0 requires argparse>=1.4.0, which is not installed.
mindstudio-kpp 26.1.0 requires plotly>=5.11.0, which is not installed.
ms-service-profiler 26.0.0 requires opentelemetry-exporter-otlp-proto-grpc==1.33.1, but you have opentelemetry-exporter-otlp-proto-grpc 1.44.0 which is incompatible.
ms-service-profiler 26.0.0 requires opentelemetry-exporter-otlp-proto-http==1.33.1, but you have opentelemetry-exporter-otlp-proto-http 1.44.0 which is incompatible.
tifffile 2026.9.20 requires numpy>=2.1, but you have numpy 1.26.4 which is incompatible.
datasets 5.0.1 requires pyarrow>=21.0.0, but you have pyarrow 20.0.0 which is incompatible.
kernels 0.16.1 requires huggingface-hub>=1.10.0, but you have huggingface-hub 0.36.2 which is incompatible.
scipy 1.18.1 requires numpy<2.8,>=2.0.0, but you have numpy 1.26.4 which is incompatible.
torch-einops-utils 0.1.31 requires einops>=0.8.1, but you have einops 0.8.0 which is incompatible.
cache-dit 1.5.0 requires diffusers>=0.36.0, but you have diffusers 0.35.1 which is incompatible.
cache-dit 1.5.0 requires transformers>=4.55.2, but you have transformers 4.41.0 which is incompatible.
ml-dtypes 0.6.0 requires numpy>=2.0.0, but you have numpy 1.26.4 which is incompatible.
librosa 1.0.0 requires numpy>=2.1.0, but you have numpy 1.26.4 which is incompatible.
prettytable 3.18.0 requires wcwidth>=0.3.5, but you have wcwidth 0.2.14 which is incompatible.
cosmos-guardrail 0.3.1 requires opencv-python>=4.10.0.84, but you have opencv-python 4.9.0.80 which is incompatible.
cosmos-guardrail 0.3.1 requires transformers>=5.0.0, but you have transformers 4.41.0 which is incompatible.
vllm-omni 0.30.0+cpu requires av>=14.0.0, but you have av 12.0.0 which is incompatible.
vllm-omni 0.30.0+cpu requires diffusers==0.40.0, but you have diffusers 0.35.1 which is incompatible.
vllm-omni 0.30.0+cpu requires einops>=0.8.1, but you have einops 0.8.0 which is incompatible.
vllm-omni 0.30.0+cpu requires imageio[ffmpeg]>=2.37.2, but you have imageio 2.37.0 which is incompatible.
vllm-omni 0.30.0+cpu requires transformers<5.15,>=5.13.0, but you have transformers 4.41.0 which is incompatible.
triton-ascend 3.2.2 requires attrs==24.2.0, but you have attrs 26.1.0 which is incompatible.
triton-ascend 3.2.2 requires decorator==5.1.1, but you have decorator 5.3.1 which is incompatible.
triton-ascend 3.2.2 requires pytest==8.3.2, but you have pytest 9.1.1 which is incompatible.
triton-ascend 3.2.2 requires scipy==1.13.1; python_version < "3.13", but you have scipy 1.18.1 which is incompatible.
vcs-versioning 2.4.1 requires packaging>=26.2, but you have packaging 25.0 which is incompatible.
vllm-ascend 0.19.1rc2.dev2331+g16074608c requires transformers==5.14.1, but you have transformers 4.41.0 which is incompatible.
compressed-tensors 0.17.0 requires transformers>=4.45.0, but you have transformers 4.41.0 which is incompatible.
opencv-python-headless 5.0.0.93 requires numpy>=2; python_version >= "3.9", but you have numpy 1.26.4 which is incompatible.
vllm 0.30.0+empty requires fastapi[standard]<0.137.0,>=0.133.0, but you have fastapi 0.123.10 which is incompatible.
vllm 0.30.0+empty requires huggingface_hub>=1.31.0, but you have huggingface-hub 0.36.2 which is incompatible.
vllm 0.30.0+empty requires starlette>=1.0.1, but you have starlette 0.50.0 which is incompatible.
vllm 0.30.0+empty requires tokenizers>=0.21.1, but you have tokenizers 0.19.1 which is incompatible.
vllm 0.30.0+empty requires transformers>=5.10.4, but you have transformers 4.41.0 which is incompatible.
Successfully installed Pillow-11.3.0 altair-5.5.0 av-12.0.0 cachetools-6.2.6 diffusers-0.35.1 einops-0.8.0 ftfy-6.2.0 gitdb-4.0.12 gitpython-3.2.1 huggingface-hub-0.36.2 imageio-2.37.0 loguru-0.7.2 numpy-1.26.4 opencv-python-4.9.0.80 packaging-25.0 pandas-2.3.3 protobuf-6.33.6 psutil-6.0.0 pyarrow-20.0.0 pydeck-0.9.3 pytz-2026.5 smmap-5.0.3 streamlit-1.50.0 tenacity-9.2.1 tokenizers-0.19.1 toml-0.10.2 tornado-6.5.10 transformers-4.41.0 tzdata-2026.5 watchdog-6.0.0 wcwidth-0.2.14
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager, possibly rendering your system unusable. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv. Use the --root-user-action option if you know what you are doing and want to suppress this warning.
```

```
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# torchrun run_demo_text_to_video.py   --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video/
[W1021 01:40:39.667161373 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
[W1021 01:40:57.639858765 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/scheduling_flow_match_euler_discrete.py:28: UserWarning: A NumPy version >=2.0.0 and <2.8.0 is required for this version of SciPy (detected version 1.26.4)
  import scipy.stats
/usr/local/python3.12.13/lib/python3.12/site-packages/scipy/sparse/_sputils.py:17: FutureWarning: In the future `np.long` will be defined as the corresponding NumPy scalar.
  np.uintc, np.long, np.ulong, np.longlong, np.ulonglong,
/usr/local/python3.12.13/lib/python3.12/site-packages/scipy/sparse/_sputils.py:17: FutureWarning: In the future `np.long` will be defined as the corresponding NumPy scalar.
  np.uintc, np.long, np.ulong, np.longlong, np.ulonglong,
Traceback (most recent call last):
  File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 13, in <module>
    from longcat_video.pipeline_longcat_video import LongCatVideoPipeline
  File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 15, in <module>
    from longcat_video.modules.scheduling_flow_match_euler_discrete import FlowMatchEulerDiscreteScheduler
  File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/scheduling_flow_match_euler_discrete.py", line 28, in <module>
    import scipy.stats
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/scipy/stats/__init__.py", line 600, in <module>
    from ._stats_py import *
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/scipy/stats/_stats_py.py", line 39, in <module>
    from scipy import sparse
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/scipy/sparse/__init__.py", line 250, in <module>
    from ._base import *
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/scipy/sparse/_base.py", line 8, in <module>
    from ._sputils import (asmatrix, check_shape,
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/scipy/sparse/_sputils.py", line 17, in <module>
    np.uintc, np.long, np.ulong, np.longlong, np.ulonglong,
              ^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/numpy/__init__.py", line 333, in __getattr__
    raise AttributeError("module {!r} has no attribute "
AttributeError: module 'numpy' has no attribute 'long'. Did you mean: 'log'?
[ERROR] 2026-10-21-01:41:05 (PID:160, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
E1021 01:41:07.310000 144 site-packages/torch/distributed/elastic/multiprocessing/api.py:984] failed (exitcode: 1) local_rank: 0 (pid: 160) of binary: /usr/local/python3.12.13/bin/python3
Traceback (most recent call last):
  File "/usr/local/python3.12.13/bin/torchrun", line 6, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/elastic/multiprocessing/errors/__init__.py", line 362, in wrapper
    return f(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 991, in main
    run(args)
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 982, in run
    elastic_launch(
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 170, in __call__
    return launch_agent(self._config, self._entrypoint, list(args))
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 317, in launch_agent
    raise ChildFailedError(
torch.distributed.elastic.multiprocessing.errors.ChildFailedError:
============================================================
run_demo_text_to_video.py FAILED
------------------------------------------------------------
Failures:
  <NO_OTHER_FAILURES>
------------------------------------------------------------
Root Cause (first observed failure):
[0]:
  time      : 2026-10-21_01:41:07
  host      : localhost.localdomain
  rank      : 0 (local_rank: 0)
  exitcode  : 1 (pid: 160)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
============================================================
[ERROR] 2026-10-21-01:41:07 (PID:144, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
```

```
pip install "scipy==1.13.1"
```

```
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# torchrun run_demo_text_to_video.py   --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video/                                                                                               [W1021 01:51:49.829791162 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
[W1021 01:52:07.947262677 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
Traceback (most recent call last):
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/utils/import_utils.py", line 953, in _get_module
    return importlib.import_module("." + module_name, self.__name__)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/importlib/__init__.py", line 90, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "<frozen importlib._bootstrap>", line 1387, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1360, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1331, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 935, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 999, in exec_module
  File "<frozen importlib._bootstrap>", line 488, in _call_with_frames_removed
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/loaders/peft.py", line 39, in <module>
    from .lora_base import _fetch_state_dict, _func_optionally_disable_offloading
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/loaders/lora_base.py", line 56, in <module>
    from peft.tuners.tuners_utils import BaseTunerLayer
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/peft/__init__.py", line 17, in <module>
    from .auto import (
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/peft/auto.py", line 32, in <module>
    from .peft_model import (
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/peft/peft_model.py", line 39, in <module>
    from transformers import Cache, DynamicCache, EncoderDecoderCache, PreTrainedModel
ImportError: cannot import name 'EncoderDecoderCache' from 'transformers' (/usr/local/python3.12.13/lib/python3.12/site-packages/transformers/__init__.py)

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 13, in <module>
    from longcat_video.pipeline_longcat_video import LongCatVideoPipeline
  File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 16, in <module>
    from longcat_video.modules.autoencoder_kl_wan import AutoencoderKLWan
  File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/autoencoder_kl_wan.py", line 29, in <module>
    from diffusers.models.autoencoders.vae import DecoderOutput, DiagonalGaussianDistribution
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/autoencoders/__init__.py", line 1, in <module>
    from .autoencoder_asym_kl import AsymmetricAutoencoderKL
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/autoencoders/autoencoder_asym_kl.py", line 23, in <module>
    from .vae import DecoderOutput, DiagonalGaussianDistribution, Encoder, MaskConditionDecoder
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/autoencoders/vae.py", line 25, in <module>
    from ..unets.unet_2d_blocks import (
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/unets/__init__.py", line 6, in <module>
    from .unet_2d import UNet2DModel
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/unets/unet_2d.py", line 24, in <module>
    from .unet_2d_blocks import UNetMidBlock2D, get_down_block, get_up_block
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/unets/unet_2d_blocks.py", line 36, in <module>
    from ..transformers.dual_transformer_2d import DualTransformer2DModel
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/transformers/__init__.py", line 5, in <module>
    from .auraflow_transformer_2d import AuraFlowTransformer2DModel
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/transformers/auraflow_transformer_2d.py", line 23, in <module>
    from ...loaders import FromOriginalModelMixin, PeftAdapterMixin
  File "<frozen importlib._bootstrap>", line 1412, in _handle_fromlist
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/utils/import_utils.py", line 943, in __getattr__
    module = self._get_module(self._class_to_module[name])
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/utils/import_utils.py", line 955, in _get_module
    raise RuntimeError(
RuntimeError: Failed to import diffusers.loaders.peft because of the following error (look up to see its traceback):
cannot import name 'EncoderDecoderCache' from 'transformers' (/usr/local/python3.12.13/lib/python3.12/site-packages/transformers/__init__.py)
[ERROR] 2026-10-21-01:52:17 (PID:442, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
E1021 01:52:20.013000 426 site-packages/torch/distributed/elastic/multiprocessing/api.py:984] failed (exitcode: 1) local_rank: 0 (pid: 442) of binary: /usr/local/python3.12.13/bin/python3
Traceback (most recent call last):
  File "/usr/local/python3.12.13/bin/torchrun", line 6, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/elastic/multiprocessing/errors/__init__.py", line 362, in wrapper
    return f(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 991, in main
    run(args)
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 982, in run
    elastic_launch(
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 170, in __call__
    return launch_agent(self._config, self._entrypoint, list(args))
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 317, in launch_agent
    raise ChildFailedError(
torch.distributed.elastic.multiprocessing.errors.ChildFailedError:
============================================================
run_demo_text_to_video.py FAILED
------------------------------------------------------------
Failures:
  <NO_OTHER_FAILURES>
------------------------------------------------------------
Root Cause (first observed failure):
[0]:
  time      : 2026-10-21_01:52:20
  host      : localhost.localdomain
  rank      : 0 (local_rank: 0)
  exitcode  : 1 (pid: 442)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
============================================================
[ERROR] 2026-10-21-01:52:20 (PID:426, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
```

```
pip install "peft==0.10.0"
```

```
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# torchrun run_demo_text_to_video.py   --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video/
[W1021 01:54:42.332447830 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
[W1021 01:55:00.222114616 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
Traceback (most recent call last):
  File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 13, in <module>
    from longcat_video.pipeline_longcat_video import LongCatVideoPipeline
  File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 11, in <module>
    from diffusers.video_processor import VideoProcessor
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/__init__.py", line 5, in <module>
    from .utils import (
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/utils/__init__.py", line 21, in <module>
    from .constants import (
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/utils/constants.py", line 63, in <module>
    dep_version_check("peft")
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/dependency_versions_check.py", line 34, in dep_version_check
    require_version(deps[pkg], hint)
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/utils/versions.py", line 111, in require_version
    _compare_versions(op, got_ver, want_ver, requirement, pkg, hint)
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/utils/versions.py", line 44, in _compare_versions
    raise ImportError(
ImportError: peft>=0.17.0 is required for a normal functioning of this module, but found peft==0.10.0.
[ERROR] 2026-10-21-01:55:09 (PID:486, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
E1021 01:55:10.894000 470 site-packages/torch/distributed/elastic/multiprocessing/api.py:984] failed (exitcode: 1) local_rank: 0 (pid: 486) of binary: /usr/local/python3.12.13/bin/python3
Traceback (most recent call last):
  File "/usr/local/python3.12.13/bin/torchrun", line 6, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/elastic/multiprocessing/errors/__init__.py", line 362, in wrapper
    return f(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 991, in main
    run(args)
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 982, in run
    elastic_launch(
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 170, in __call__
    return launch_agent(self._config, self._entrypoint, list(args))
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 317, in launch_agent
    raise ChildFailedError(
torch.distributed.elastic.multiprocessing.errors.ChildFailedError:
============================================================
run_demo_text_to_video.py FAILED
------------------------------------------------------------
Failures:
  <NO_OTHER_FAILURES>
------------------------------------------------------------
Root Cause (first observed failure):
[0]:
  time      : 2026-10-21_01:55:10
  host      : localhost.localdomain
  rank      : 0 (local_rank: 0)
  exitcode  : 1 (pid: 486)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
============================================================
[ERROR] 2026-10-21-01:55:10 (PID:470, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
```

```
pip install "diffusers==0.31.0"
```

```
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# torchrun run_demo_text_to_video.py   --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video/
[W1021 01:56:37.609685886 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
[W1021 01:56:55.530535510 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
TMA benchmarks will be running with experimental grid constant TMA descriptor.
[rank 0] init_device_mesh [dp_size x cp_size]: [1 x 1]
[rank 0] mesh_2d: DeviceMesh((dp=1, cp=1), 'npu', stride=(1, 1))
[rank 0] [dp_rank, cp_rank]: [0, 0],  dp_ranks: [0], cp_ranks: [0]
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [01:09<00:00, 14.00s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.

[rank0]:[W1021 02:02:04.104037121 NPUCachingAllocator.cpp:202] Warning: The current CANN and HDK(driver) versions require processing for 32 padding size, with memory allocation. (function operator())
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]E1021 02:02:10.212606 531 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:0] NPU out of memory. Tried to allocate 167.10 GiB (NPU 0; 60.96 GiB total capacity; 40.16 GiB already allocated; 40.16 GiB current active; 17.92 GiB free; 42.56 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]
[rank0]: Traceback (most recent call last):
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank0]:     generate(args)
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank0]:     output = pipe.generate_t2v(
[rank0]:              ^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
[rank0]:     return func(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in generate_t2v
[rank0]:     noise_pred = self.dit(
[rank0]:                  ^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in forward
[rank0]:     block_outputs = block(
[rank0]:                     ^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 102, in forward
[rank0]:     attn_outputs = self.attn(x_m, shape=latent_shape, num_cond_latents=num_cond_latents, return_kv=return_kv)
[rank0]:                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 146, in forward
[rank0]:     x = self._process_attn(q, k, v, shape)
[rank0]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/context_parallel/ulysses_wrapper.py", line 112, in wrapper
[rank0]:     output = func(self, query, key, value, shape)
[rank0]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 112, in _process_attn
[rank0]:     x = _standard_attention(q, k, v, self.scale)
[rank0]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 16, in _standard_attention
[rank0]:     scores = torch.matmul(q, k.transpose(-2, -1)) * scale
[rank0]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]: torch.OutOfMemoryError: NPU out of memory. Tried to allocate 167.10 GiB (NPU 0; 60.96 GiB total capacity; 40.16 GiB already allocated; 40.16 GiB current active; 17.92 GiB free; 42.56 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
[ERROR] 2026-10-21-02:02:11 (PID:531, Device:0, RankID:-1) ERR99999 UNKNOWN applicaiton exception
E1021 02:02:14.574000 515 site-packages/torch/distributed/elastic/multiprocessing/api.py:984] failed (exitcode: 1) local_rank: 0 (pid: 531) of binary: /usr/local/python3.12.13/bin/python3
Traceback (most recent call last):
  File "/usr/local/python3.12.13/bin/torchrun", line 6, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/elastic/multiprocessing/errors/__init__.py", line 362, in wrapper
    return f(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 991, in main
    run(args)
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 982, in run
    elastic_launch(
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 170, in __call__
    return launch_agent(self._config, self._entrypoint, list(args))
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 317, in launch_agent
    raise ChildFailedError(
torch.distributed.elastic.multiprocessing.errors.ChildFailedError:
============================================================
run_demo_text_to_video.py FAILED
------------------------------------------------------------
Failures:
  <NO_OTHER_FAILURES>
------------------------------------------------------------
Root Cause (first observed failure):
[0]:
  time      : 2026-10-21_02:02:14
  host      : localhost.localdomain
  rank      : 0 (local_rank: 0)
  exitcode  : 1 (pid: 531)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
============================================================
[ERROR] 2026-10-21-02:02:14 (PID:515, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
```

```
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# torchrun --nproc_per_node=2 run_demo_text_to_video.py   --context
_parallel_size=2   --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video
[W1021 02:06:43.800845002 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
[W1021 02:07:01.792490178 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
[rank 1] init_device_mesh [dp_size x cp_size]: [1 x 2]
[rank 0] init_device_mesh [dp_size x cp_size]: [1 x 2]
[rank 1] mesh_2d: DeviceMesh((dp=1, cp=2), 'npu', stride=(2, 1))
[rank 1] [dp_rank, cp_rank]: [0, 1],  dp_ranks: [1], cp_ranks: [0, 1]
[rank 0] mesh_2d: DeviceMesh((dp=1, cp=2), 'npu', stride=(2, 1))
[rank 0] [dp_rank, cp_rank]: [0, 0],  dp_ranks: [0], cp_ranks: [0, 1]
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [01:08<00:00, 13.75s/it]
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [01:08<00:00, 13.76s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
[rank0]:[W1021 02:12:08.354238821 NPUCachingAllocator.cpp:202] Warning: The current CANN and HDK(driver) versions require processing for 32 padding size, with memory allocation. (function operator())
/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/c10d_logger.py:83: UserWarning: barrier(): using the device under current context. You can specify `device_id` in `init_process_group` to mute this warning.
  return func(*args, **kwargs)
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]E1021 02:12:17.038760 877 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:1] NPU out of memory. Tried to allocate 83.55 GiB (NPU 1; 60.96 GiB total capacity; 39.02 GiB already allocated; 39.02 GiB current active; 19.06 GiB free; 41.12 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
E1021 02:12:17.039012 876 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:0] NPU out of memory. Tried to allocate 83.55 GiB (NPU 0; 60.96 GiB total capacity; 39.02 GiB already allocated; 39.02 GiB current active; 18.94 GiB free; 41.13 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]
[rank1]: Traceback (most recent call last):
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank1]:     generate(args)
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank1]:     output = pipe.generate_t2v(
[rank1]:              ^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
[rank1]:     return func(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in generate_t2v
[rank1]:     noise_pred = self.dit(
[rank1]:                  ^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in forward
[rank1]:     block_outputs = block(
[rank1]:                     ^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 102, in forward
[rank1]:     attn_outputs = self.attn(x_m, shape=latent_shape, num_cond_latents=num_cond_latents, return_kv=return_kv)
[rank1]:                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 146, in forward
[rank1]:     x = self._process_attn(q, k, v, shape)
[rank1]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/context_parallel/ulysses_wrapper.py", line 112, in wrapper
[rank1]:     output = func(self, query, key, value, shape)
[rank1]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 112, in _process_attn
[rank1]:     x = _standard_attention(q, k, v, self.scale)
[rank1]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 16, in _standard_attention
[rank1]:     scores = torch.matmul(q, k.transpose(-2, -1)) * scale
[rank1]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]: torch.OutOfMemoryError: NPU out of memory. Tried to allocate 83.55 GiB (NPU 1; 60.96 GiB total capacity; 39.02 GiB already allocated; 39.02 GiB current active; 19.06 GiB free; 41.12 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
[rank0]: Traceback (most recent call last):
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank0]:     generate(args)
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank0]:     output = pipe.generate_t2v(
[rank0]:              ^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
[rank0]:     return func(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in generate_t2v
[rank0]:     noise_pred = self.dit(
[rank0]:                  ^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in forward
[rank0]:     block_outputs = block(
[rank0]:                     ^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 102, in forward
[rank0]:     attn_outputs = self.attn(x_m, shape=latent_shape, num_cond_latents=num_cond_latents, return_kv=return_kv)
[rank0]:                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 146, in forward
[rank0]:     x = self._process_attn(q, k, v, shape)
[rank0]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/context_parallel/ulysses_wrapper.py", line 112, in wrapper
[rank0]:     output = func(self, query, key, value, shape)
[rank0]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 112, in _process_attn
[rank0]:     x = _standard_attention(q, k, v, self.scale)
[rank0]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 16, in _standard_attention
[rank0]:     scores = torch.matmul(q, k.transpose(-2, -1)) * scale
[rank0]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]: torch.OutOfMemoryError: NPU out of memory. Tried to allocate 83.55 GiB (NPU 0; 60.96 GiB total capacity; 39.02 GiB already allocated; 39.02 GiB current active; 18.94 GiB free; 41.13 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
[ERROR] 2026-10-21-02:12:17 (PID:877, Device:1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
[ERROR] 2026-10-21-02:12:18 (PID:876, Device:0, RankID:-1) ERR99999 UNKNOWN applicaiton exception
W1021 02:12:21.146000 860 site-packages/torch/distributed/elastic/multiprocessing/api.py:1010] Sending process 876 closing signal SIGTERM
E1021 02:12:22.013000 860 site-packages/torch/distributed/elastic/multiprocessing/api.py:984] failed (exitcode: 1) local_rank: 1 (pid: 877) of binary: /usr/local/python3.12.13/bin/python3
Traceback (most recent call last):
  File "/usr/local/python3.12.13/bin/torchrun", line 6, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/elastic/multiprocessing/errors/__init__.py", line 362, in wrapper
    return f(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 991, in main
    run(args)
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 982, in run
    elastic_launch(
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 170, in __call__
    return launch_agent(self._config, self._entrypoint, list(args))
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 317, in launch_agent
    raise ChildFailedError(
torch.distributed.elastic.multiprocessing.errors.ChildFailedError:
============================================================
run_demo_text_to_video.py FAILED
------------------------------------------------------------
Failures:
[1]:
  time      : 2026-10-21_02:12:22
  host      : localhost.localdomain
  rank      : 0 (local_rank: 0)
  exitcode  : -15 (pid: 876)
  error_file: <N/A>
  traceback : Signal 15 (SIGTERM) received by PID 876
------------------------------------------------------------
Root Cause (first observed failure):
[0]:
  time      : 2026-10-21_02:12:21
  host      : localhost.localdomain
  rank      : 1 (local_rank: 1)
  exitcode  : 1 (pid: 877)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
============================================================
[ERROR] 2026-10-21-02:12:22 (PID:860, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
```

```
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model#
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# torchrun --nproc_per_node=2 run_demo_text_to_video.py   --context_parallel_size=2   --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video
[W1021 02:14:51.476015660 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
[W1021 02:15:09.801775073 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
[rank 1] init_device_mesh [dp_size x cp_size]: [1 x 2][rank 0] init_device_mesh [dp_size x cp_size]: [1 x 2]

[rank 0] mesh_2d: DeviceMesh((dp=1, cp=2), 'npu', stride=(2, 1))[rank 1] mesh_2d: DeviceMesh((dp=1, cp=2), 'npu', stride=(2, 1))

[rank 0] [dp_rank, cp_rank]: [0, 0],  dp_ranks: [0], cp_ranks: [0, 1]
[rank 1] [dp_rank, cp_rank]: [0, 1],  dp_ranks: [1], cp_ranks: [0, 1]
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.00s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.15s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
[rank0]:[W1021 02:17:13.746978688 NPUCachingAllocator.cpp:202] Warning: The current CANN and HDK(driver) versions require processing for 32 padding size, with memory allocation. (function operator())
/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/c10d_logger.py:83: UserWarning: barrier(): using the device under current context. You can specify `device_id` in `init_process_group` to mute this warning.
  return func(*args, **kwargs)
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]E1021 02:17:23.633896 1206 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:0] NPU out of memory. Tried to allocate 83.55 GiB (NPU 0; 60.96 GiB total capacity; 39.01 GiB already allocated; 39.01 GiB current active; 21.10 GiB free; 39.06 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
Denoising:   0%|                                                                                | 0/50 [00:02<?, ?it/s]
[rank0]: Traceback (most recent call last):
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank0]:     generate(args)
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank0]:     output = pipe.generate_t2v(
[rank0]:              ^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
[rank0]:     return func(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in generate_t2v
[rank0]:     noise_pred = self.dit(
[rank0]:                  ^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in forward
[rank0]:     block_outputs = block(
[rank0]:                     ^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 102, in forward
[rank0]:     attn_outputs = self.attn(x_m, shape=latent_shape, num_cond_latents=num_cond_latents, return_kv=return_kv)
[rank0]:                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 146, in forward
[rank0]:     x = self._process_attn(q, k, v, shape)
[rank0]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/context_parallel/ulysses_wrapper.py", line 112, in wrapper
[rank0]:     output = func(self, query, key, value, shape)
[rank0]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 112, in _process_attn
[rank0]:     x = _standard_attention(q, k, v, self.scale)
[rank0]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 16, in _standard_attention
[rank0]:     scores = torch.matmul(q, k.transpose(-2, -1)) * scale
[rank0]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]: torch.OutOfMemoryError: NPU out of memory. Tried to allocate 83.55 GiB (NPU 0; 60.96 GiB total capacity; 39.01 GiB already allocated; 39.01 GiB current active; 21.10 GiB free; 39.06 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
[ERROR] 2026-10-21-02:17:24 (PID:1206, Device:0, RankID:-1) ERR99999 UNKNOWN applicaiton exception
E1021 02:17:25.765774 1207 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:1] NPU out of memory. Tried to allocate 83.55 GiB (NPU 1; 60.96 GiB total capacity; 39.01 GiB already allocated; 39.01 GiB current active; 21.12 GiB free; 39.06 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
Denoising:   0%|                                                                                | 0/50 [00:05<?, ?it/s]
[rank1]: Traceback (most recent call last):
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank1]:     generate(args)
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank1]:     output = pipe.generate_t2v(
[rank1]:              ^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
[rank1]:     return func(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in generate_t2v
[rank1]:     noise_pred = self.dit(
[rank1]:                  ^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in forward
[rank1]:     block_outputs = block(
[rank1]:                     ^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 102, in forward
[rank1]:     attn_outputs = self.attn(x_m, shape=latent_shape, num_cond_latents=num_cond_latents, return_kv=return_kv)
[rank1]:                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 146, in forward
[rank1]:     x = self._process_attn(q, k, v, shape)
[rank1]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/context_parallel/ulysses_wrapper.py", line 112, in wrapper
[rank1]:     output = func(self, query, key, value, shape)
[rank1]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 112, in _process_attn
[rank1]:     x = _standard_attention(q, k, v, self.scale)
[rank1]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 16, in _standard_attention
[rank1]:     scores = torch.matmul(q, k.transpose(-2, -1)) * scale
[rank1]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]: torch.OutOfMemoryError: NPU out of memory. Tried to allocate 83.55 GiB (NPU 1; 60.96 GiB total capacity; 39.01 GiB already allocated; 39.01 GiB current active; 21.12 GiB free; 39.06 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
[ERROR] 2026-10-21-02:17:27 (PID:1207, Device:1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
W1021 02:17:28.453000 1190 site-packages/torch/distributed/elastic/multiprocessing/api.py:1010] Sending process 1207 closing signal SIGTERM
E1021 02:17:29.070000 1190 site-packages/torch/distributed/elastic/multiprocessing/api.py:984] failed (exitcode: 1) local_rank: 0 (pid: 1206) of binary: /usr/local/python3.12.13/bin/python3
Traceback (most recent call last):
  File "/usr/local/python3.12.13/bin/torchrun", line 6, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/elastic/multiprocessing/errors/__init__.py", line 362, in wrapper
    return f(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 991, in main
    run(args)
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 982, in run
    elastic_launch(
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 170, in __call__
    return launch_agent(self._config, self._entrypoint, list(args))
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 317, in launch_agent
    raise ChildFailedError(
torch.distributed.elastic.multiprocessing.errors.ChildFailedError:
============================================================
run_demo_text_to_video.py FAILED
------------------------------------------------------------
Failures:
[1]:
  time      : 2026-10-21_02:17:29
  host      : localhost.localdomain
  rank      : 1 (local_rank: 1)
  exitcode  : -15 (pid: 1207)
  error_file: <N/A>
  traceback : Signal 15 (SIGTERM) received by PID 1207
------------------------------------------------------------
Root Cause (first observed failure):
[0]:
  time      : 2026-10-21_02:17:28
  host      : localhost.localdomain
  rank      : 0 (local_rank: 0)
  exitcode  : 1 (pid: 1206)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
============================================================
[ERROR] 2026-10-21-02:17:29 (PID:1190, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
```

```
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# torchrun --nproc_per_node=4 run_demo_text_to_video.py   --context
_parallel_size=4   --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video
[W1021 02:18:27.214176991 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1021 02:18:45.259590274 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
[rank 1] init_device_mesh [dp_size x cp_size]: [1 x 4][rank 2] init_device_mesh [dp_size x cp_size]: [1 x 4][rank 3] ini
t_device_mesh [dp_size x cp_size]: [1 x 4]


[rank 0] init_device_mesh [dp_size x cp_size]: [1 x 4]
[rank 0] mesh_2d: DeviceMesh((dp=1, cp=4), 'npu', stride=(4, 1))[rank 1] mesh_2d: DeviceMesh((dp=1, cp=4), 'npu', stride
=(4, 1))

[rank 1] [dp_rank, cp_rank]: [0, 1],  dp_ranks: [1], cp_ranks: [0, 1, 2, 3][rank 0] [dp_rank, cp_rank]: [0, 0],  dp_rank
s: [0], cp_ranks: [0, 1, 2, 3]

[rank 2] mesh_2d: DeviceMesh((dp=1, cp=4), 'npu', stride=(4, 1))[rank 3] mesh_2d: DeviceMesh((dp=1, cp=4), 'npu', stride
=(4, 1))

[rank 2] [dp_rank, cp_rank]: [0, 2],  dp_ranks: [2], cp_ranks: [0, 1, 2, 3][rank 3] [dp_rank, cp_rank]: [0, 3],  dp_rank
s: [3], cp_ranks: [0, 1, 2, 3]

Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:13<00:00,  2.67s/it]
Loading checkpoint shards:  40%|██████████████████████▊                                  | 2/5 [00:06<00:10,  3.42s/it][
Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:14<00:00,  2.86s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.01s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:16<00:00,  3.38s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
[rank0]:[W1021 02:21:00.796102837 NPUCachingAllocator.cpp:202] Warning: The current CANN and HDK(driver) versions requir
e processing for 32 padding size, with memory allocation. (function operator())
/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/c10d_logger.py:83: UserWarning: barrier(): using
 the device under current context. You can specify `device_id` in `init_process_group` to mute this warning.
  return func(*args, **kwargs)
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]E
1021 02:21:25.712663 1535 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:0] NPU out of memory. Tried to
allocate 41.78 GiB (NPU 0; 60.96 GiB total capacity; 37.59 GiB already allocated; 37.59 GiB current active; 22.55 GiB fr
ee; 37.62 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to a
void fragmentation.
Denoising:   0%|                                                                                | 0/50 [00:03<?, ?it/s]
[rank0]: Traceback (most recent call last):
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank0]:     generate(args)
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank0]:     output = pipe.generate_t2v(
[rank0]:              ^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorat
e_context
[rank0]:     return func(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in gener
ate_t2v
[rank0]:     noise_pred = self.dit(
[rank0]:                  ^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapp
ed_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_
impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in forward
[rank0]:     block_outputs = block(
[rank0]:                     ^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 102, in forward
[rank0]:     attn_outputs = self.attn(x_m, shape=latent_shape, num_cond_latents=num_cond_latents, return_kv=return_kv)
[rank0]:                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 146, in forward
[rank0]:     x = self._process_attn(q, k, v, shape)
[rank0]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/context_parallel/ulysses_wrapper.py", line 112, in wrapper
[rank0]:     output = func(self, query, key, value, shape)
[rank0]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 112, in _process_attn
[rank0]:     x = _standard_attention(q, k, v, self.scale)
[rank0]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 16, in _standard_attention
[rank0]:     scores = torch.matmul(q, k.transpose(-2, -1)) * scale
[rank0]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]: torch.OutOfMemoryError: NPU out of memory. Tried to allocate 41.78 GiB (NPU 0; 60.96 GiB total capacity; 37.59 GiB already allocated; 37.59 GiB current active; 22.55 GiB free; 37.62 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
E1021 02:21:27.044954 1538 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:3] NPU out of memory. Tried to allocate 41.78 GiB (NPU 3; 60.96 GiB total capacity; 37.59 GiB already allocated; 37.59 GiB current active; 22.54 GiB free; 37.62 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
Denoising:   0%|                                                                                | 0/50 [00:04<?, ?it/s]
[rank3]: Traceback (most recent call last):
[rank3]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank3]:     generate(args)
[rank3]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank3]:     output = pipe.generate_t2v(
[rank3]:              ^^^^^^^^^^^^^^^^^^
[rank3]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
[rank3]:     return func(*args, **kwargs)
[rank3]:            ^^^^^^^^^^^^^^^^^^^^^
[rank3]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in generate_t2v
[rank3]:     noise_pred = self.dit(
[rank3]:                  ^^^^^^^^^
[rank3]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank3]:     return self._call_impl(*args, **kwargs)
[rank3]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank3]:     return forward_call(*args, **kwargs)
[rank3]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in forward
[rank3]:     block_outputs = block(
[rank3]:                     ^^^^^^
[rank3]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank3]:     return self._call_impl(*args, **kwargs)
[rank3]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank3]:     return forward_call(*args, **kwargs)
[rank3]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 102, in forward
[rank3]:     attn_outputs = self.attn(x_m, shape=latent_shape, num_cond_latents=num_cond_latents, return_kv=return_kv)
[rank3]:                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank3]:     return self._call_impl(*args, **kwargs)
[rank3]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank3]:     return forward_call(*args, **kwargs)
[rank3]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 146, in forward
[rank3]:     x = self._process_attn(q, k, v, shape)
[rank3]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/context_parallel/ulysses_wrapper.py", line 112, in wrapper
[rank3]:     output = func(self, query, key, value, shape)
[rank3]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 112, in _process_attn
[rank3]:     x = _standard_attention(q, k, v, self.scale)
[rank3]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 16, in _standard_attention
[rank3]:     scores = torch.matmul(q, k.transpose(-2, -1)) * scale
[rank3]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank3]: torch.OutOfMemoryError: NPU out of memory. Tried to allocate 41.78 GiB (NPU 3; 60.96 GiB total capacity; 37.59 GiB already allocated; 37.59 GiB current active; 22.54 GiB free; 37.62 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
E1021 02:21:27.055445 1537 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:2] NPU out of memory. Tried to allocate 41.78 GiB (NPU 2; 60.96 GiB total capacity; 37.59 GiB already allocated; 37.59 GiB current active; 22.54 GiB free; 37.62 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
Denoising:   0%|                                                                                | 0/50 [00:04<?, ?it/s]
[rank2]: Traceback (most recent call last):
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank2]:     generate(args)
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank2]:     output = pipe.generate_t2v(
[rank2]:              ^^^^^^^^^^^^^^^^^^
[rank2]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
[rank2]:     return func(*args, **kwargs)
[rank2]:            ^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in generate_t2v
[rank2]:     noise_pred = self.dit(
[rank2]:                  ^^^^^^^^^
[rank2]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank2]:     return self._call_impl(*args, **kwargs)
[rank2]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank2]:     return forward_call(*args, **kwargs)
[rank2]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in forward
[rank2]:     block_outputs = block(
[rank2]:                     ^^^^^^
[rank2]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank2]:     return self._call_impl(*args, **kwargs)
[rank2]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank2]:     return forward_call(*args, **kwargs)
[rank2]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 102, in forward
[rank2]:     attn_outputs = self.attn(x_m, shape=latent_shape, num_cond_latents=num_cond_latents, return_kv=return_kv)
[rank2]:                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank2]:     return self._call_impl(*args, **kwargs)
[rank2]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank2]:     return forward_call(*args, **kwargs)
[rank2]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 146, in forward
[rank2]:     x = self._process_attn(q, k, v, shape)
[rank2]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/context_parallel/ulysses_wrapper.py", line 112, in wrapper
[rank2]:     output = func(self, query, key, value, shape)
[rank2]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 112, in _process_attn
[rank2]:     x = _standard_attention(q, k, v, self.scale)
[rank2]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 16, in _standard_attention
[rank2]:     scores = torch.matmul(q, k.transpose(-2, -1)) * scale
[rank2]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank2]: torch.OutOfMemoryError: NPU out of memory. Tried to allocate 41.78 GiB (NPU 2; 60.96 GiB total capacity; 37.59 GiB already allocated; 37.59 GiB current active; 22.54 GiB free; 37.62 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
[ERROR] 2026-10-21-02:21:27 (PID:1535, Device:0, RankID:-1) ERR99999 UNKNOWN applicaiton exception
E1021 02:21:28.476573 1536 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:1] NPU out of memory. Tried to allocate 41.78 GiB (NPU 1; 60.96 GiB total capacity; 37.59 GiB already allocated; 37.59 GiB current active; 22.56 GiB free; 37.62 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
Denoising:   0%|                                                                                | 0/50 [00:05<?, ?it/s]
[rank1]: Traceback (most recent call last):
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank1]:     generate(args)
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank1]:     output = pipe.generate_t2v(
[rank1]:              ^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
[rank1]:     return func(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in generate_t2v
[rank1]:     noise_pred = self.dit(
[rank1]:                  ^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in fo
rward
[rank1]:     block_outputs = block(
[rank1]:                     ^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 102, in forward
[rank1]:     attn_outputs = self.attn(x_m, shape=latent_shape, num_cond_latents=num_cond_latents, return_kv=return_kv)
[rank1]:                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 146, in forward
[rank1]:     x = self._process_attn(q, k, v, shape)
[rank1]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/context_parallel/ulysses_wrapper.py", line 112, in wrapper
[rank1]:     output = func(self, query, key, value, shape)
[rank1]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 112, in _process_attn
[rank1]:     x = _standard_attention(q, k, v, self.scale)
[rank1]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 16, in _standard_attention
[rank1]:     scores = torch.matmul(q, k.transpose(-2, -1)) * scale
[rank1]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]: torch.OutOfMemoryError: NPU out of memory. Tried to allocate 41.78 GiB (NPU 1; 60.96 GiB total capacity; 37.59 GiB already allocated; 37.59 GiB current active; 22.56 GiB free; 37.62 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.
[ERROR] 2026-10-21-02:21:29 (PID:1537, Device:2, RankID:-1) ERR99999 UNKNOWN applicaiton exception
[ERROR] 2026-10-21-02:21:29 (PID:1538, Device:3, RankID:-1) ERR99999 UNKNOWN applicaiton exception
[ERROR] 2026-10-21-02:21:30 (PID:1536, Device:1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
W1021 02:21:31.129000 1519 site-packages/torch/distributed/elastic/multiprocessing/api.py:1010] Sending process 1536 closing signal SIGTERM
W1021 02:21:31.131000 1519 site-packages/torch/distributed/elastic/multiprocessing/api.py:1010] Sending process 1537 closing signal SIGTERM
W1021 02:21:31.132000 1519 site-packages/torch/distributed/elastic/multiprocessing/api.py:1010] Sending process 1538 closing signal SIGTERM
E1021 02:21:31.887000 1519 site-packages/torch/distributed/elastic/multiprocessing/api.py:984] failed (exitcode: 1) local_rank: 0 (pid: 1535) of binary: /usr/local/python3.12.13/bin/python3
Traceback (most recent call last):
  File "/usr/local/python3.12.13/bin/torchrun", line 6, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/elastic/multiprocessing/errors/__init__.py", line 362, in wrapper
    return f(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 991, in main
    run(args)
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/run.py", line 982, in run
    elastic_launch(
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 170, in __call__
    return launch_agent(self._config, self._entrypoint, list(args))
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/launcher/api.py", line 317, in launch_agent
    raise ChildFailedError(
torch.distributed.elastic.multiprocessing.errors.ChildFailedError:
============================================================
run_demo_text_to_video.py FAILED
------------------------------------------------------------
Failures:
[1]:
  time      : 2026-10-21_02:21:31
  host      : localhost.localdomain
  rank      : 1 (local_rank: 1)
  exitcode  : -15 (pid: 1536)
  error_file: <N/A>
  traceback : Signal 15 (SIGTERM) received by PID 1536
[2]:
  time      : 2026-10-21_02:21:31
  host      : localhost.localdomain
  rank      : 2 (local_rank: 2)
  exitcode  : -15 (pid: 1537)
  error_file: <N/A>
  traceback : Signal 15 (SIGTERM) received by PID 1537
[3]:
  time      : 2026-10-21_02:21:31
  host      : localhost.localdomain
  rank      : 3 (local_rank: 3)
  exitcode  : -15 (pid: 1538)
  error_file: <N/A>
  traceback : Signal 15 (SIGTERM) received by PID 1538
------------------------------------------------------------
Root Cause (first observed failure):
[0]:
  time      : 2026-10-21_02:21:31
  host      : localhost.localdomain
  rank      : 0 (local_rank: 0)
  exitcode  : 1 (pid: 1535)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
============================================================
[ERROR] 2026-10-21-02:21:31 (PID:1519, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
```

```
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# torchrun --nproc_per_node=8 run_demo_text_to_video.py   --context
_parallel_size=8   --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video
[W1021 02:24:56.288146438 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1021 02:25:14.435990681 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
[rank 6] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 6] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 6] [dp_rank, cp_rank]: [0, 6],  dp_ranks: [6], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 2] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 2] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 2] [dp_rank, cp_rank]: [0, 2],  dp_ranks: [2], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 4] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 4] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 4] [dp_rank, cp_rank]: [0, 4],  dp_ranks: [4], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 1] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 1] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 1] [dp_rank, cp_rank]: [0, 1],  dp_ranks: [1], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 7] init_device_mesh [dp_size x cp_size]: [1 x 8][rank 3] init_device_mesh [dp_size x cp_size]: [1 x 8]

[rank 0] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 5] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 3] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))[rank 0] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride
=(8, 1))[rank 7] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))


[rank 7] [dp_rank, cp_rank]: [0, 7],  dp_ranks: [7], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7][rank 0] [dp_rank, cp_rank]: [0,
0],  dp_ranks: [0], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7][rank 3] [dp_rank, cp_rank]: [0, 3],  dp_ranks: [3], cp_ranks: [0,
 1, 2, 3, 4, 5, 6, 7]


[rank 5] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 5] [dp_rank, cp_rank]: [0, 5],  dp_ranks: [5], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.02s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:17<00:00,  3.52s/it]
Loading checkpoint shards:  20%|███████████▍                                             | 1/5 [00:03<00:13,  3.37s/it][
Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:16<00:00,  3.32s/it]
Loading checkpoint shards:   0%|                                                                 | 0/5 [00:00<?, ?it/s][
Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.20s/it]
Loading checkpoint shards:  20%|███████████▍                                             | 1/5 [00:03<00:14,  3.73s/it][
Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.17s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:16<00:00,  3.30s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:16<00:00,  3.40s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:19<00:00,  3.97s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
[rank6]: Traceback (most recent call last):
[rank6]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank6]:     generate(args)
[rank6]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank6]:     output = pipe.generate_t2v(
[rank6]:              ^^^^^^^^^^^^^^^^^^
[rank6]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorat
e_context
[rank6]:     return func(*args, **kwargs)
[rank6]:            ^^^^^^^^^^^^^^^^^^^^^
[rank6]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 467, in gener
ate_t2v
[rank6]:     self.check_inputs(
[rank6]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 206, in check
_inputs
[rank6]:     raise ValueError(f"`height and width` have to be divisible by {scale_factor_spatial} but are {height} and {
width}.")
[rank6]: ValueError: `height and width` have to be divisible by 64 but are 480 and 832.
[ERROR] 2026-10-21-02:27:31 (PID:2022, Device:6, RankID:-1) ERR99999 UNKNOWN applicaiton exception
[rank2]: Traceback (most recent call last):
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank2]:     generate(args)
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank2]:     output = pipe.generate_t2v(
[rank2]:              ^^^^^^^^^^^^^^^^^^
[rank2]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorat
e_context
[rank2]:     return func(*args, **kwargs)
[rank2]:            ^^^^^^^^^^^^^^^^^^^^^
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 467, in gener
ate_t2v
[rank2]:     self.check_inputs(
[rank2]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 206, in check_inputs
[rank2]:     raise ValueError(f"`height and width` have to be divisible by {scale_factor_spatial} but are {height} and {width}.")
[rank2]: ValueError: `height and width` have to be divisible by 64 but are 480 and 832.
```

### height=448
```
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# torchrun --nproc_per_node=8 run_demo_text_to_video.py   --context
_parallel_size=8   --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video
[W1021 02:30:27.382411535 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1021 02:30:46.504894334 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
[rank 6] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 6] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 6] [dp_rank, cp_rank]: [0, 6],  dp_ranks: [6], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 5] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 5] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 5] [dp_rank, cp_rank]: [0, 5],  dp_ranks: [5], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 7] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 7] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 7] [dp_rank, cp_rank]: [0, 7],  dp_ranks: [7], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 0] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 0] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 0] [dp_rank, cp_rank]: [0, 0],  dp_ranks: [0], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 1] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 2] init_device_mesh [dp_size x cp_size]: [1 x 8][rank 4] init_device_mesh [dp_size x cp_size]: [1 x 8][rank 3] ini
t_device_mesh [dp_size x cp_size]: [1 x 8]


[rank 1] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 1] [dp_rank, cp_rank]: [0, 1],  dp_ranks: [1], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 3] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))[rank 2] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride
=(8, 1))[rank 4] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))


[rank 2] [dp_rank, cp_rank]: [0, 2],  dp_ranks: [2], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7][rank 3] [dp_rank, cp_rank]: [0,
3],  dp_ranks: [3], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]

[rank 4] [dp_rank, cp_rank]: [0, 4],  dp_ranks: [4], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:14<00:00,  2.82s/it]
Loading checkpoint shards:   0%|                                                                 | 0/5 [00:00<?, ?it/s][
Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:14<00:00,  2.85s/it]
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:14<00:00,  2.83s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:18<00:00,  3.66s/it]
Loading checkpoint shards:  80%|█████████████████████████████████████████████▌           | 4/5 [00:12<00:03,  3.12s/it][
Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:14<00:00,  2.97s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.07s/it]
Loading checkpoint shards:  80%|█████████████████████████████████████████████▌           | 4/5 [00:15<00:04,  4.09s/it][
Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:18<00:00,  3.67s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:21<00:00,  4.21s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
[rank0]:[W1021 02:33:07.816544953 NPUCachingAllocator.cpp:202] Warning: The current CANN and HDK(driver) versions requir
e processing for 32 padding size, with memory allocation. (function operator())
/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/c10d_logger.py:83: UserWarning: barrier(): using
 the device under current context. You can specify `device_id` in `init_process_group` to mute this warning.
  return func(*args, **kwargs)
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]E
1021 02:33:35.929864 2285 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:4] NPU out of memory. Tried to
allocate 18.20 GiB (NPU 4; 60.96 GiB total capacity; 55.02 GiB already allocated; 55.02 GiB current active; 5.09 GiB fre
e; 55.08 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to av
oid fragmentation.
```

### num_frames=49
```
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# torchrun --nproc_per_node=8 run_demo_text_to_video.py   --context
_parallel_size=8   --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video
[W1021 02:35:43.676359899 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1021 02:36:01.036947409 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
[rank 4] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 4] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 4] [dp_rank, cp_rank]: [0, 4],  dp_ranks: [4], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 3] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 3] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 3] [dp_rank, cp_rank]: [0, 3],  dp_ranks: [3], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 1] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 1] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 1] [dp_rank, cp_rank]: [0, 1],  dp_ranks: [1], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 5] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 5] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 5] [dp_rank, cp_rank]: [0, 5],  dp_ranks: [5], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 2] init_device_mesh [dp_size x cp_size]: [1 x 8][rank 0] init_device_mesh [dp_size x cp_size]: [1 x 8][rank 7] ini
t_device_mesh [dp_size x cp_size]: [1 x 8]


[rank 6] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 2] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))[rank 7] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride
=(8, 1))[rank 0] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))


[rank 2] [dp_rank, cp_rank]: [0, 2],  dp_ranks: [2], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7][rank 7] [dp_rank, cp_rank]: [0,
7],  dp_ranks: [7], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7][rank 0] [dp_rank, cp_rank]: [0, 0],  dp_ranks: [0], cp_ranks: [0,
 1, 2, 3, 4, 5, 6, 7]


[rank 6] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 6] [dp_rank, cp_rank]: [0, 6],  dp_ranks: [6], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.14s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.03s/it]
Loading checkpoint shards:  60%|██████████████████████████████████▏                      | 3/5 [00:12<00:08,  4.12s/it][
Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:18<00:00,  3.66s/it]
Loading checkpoint shards:  80%|█████████████████████████████████████████████▌           | 4/5 [00:15<00:03,  3.56s/it][
Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:17<00:00,  3.49s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:16<00:00,  3.23s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.10s/it]
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.09s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:21<00:00,  4.21s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
[rank0]:[W1021 02:38:29.000061859 NPUCachingAllocator.cpp:202] Warning: The current CANN and HDK(driver) versions requir
e processing for 32 padding size, with memory allocation. (function operator())
/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/c10d_logger.py:83: UserWarning: barrier(): using
 the device under current context. You can specify `device_id` in `init_process_group` to mute this warning.
  return func(*args, **kwargs)
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]E
1021 02:38:57.208855 3156 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:0] NPU out of memory. Tried to
allocate 10.68 GiB (NPU 0; 60.96 GiB total capacity; 52.52 GiB already allocated; 52.52 GiB current active; 7.57 GiB fre
e; 52.60 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to av
oid fragmentation.
```

### height = 320 width = 512 num_frames = 33
```
root@maas2:/vllm-workspace/LongCat-Video-Ascend-model# torchrun --nproc_per_node=8 run_demo_text_to_video.py   --context
_parallel_size=8   --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video
[W1021 02:43:21.079285748 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1021 02:43:39.259444601 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
TMA benchmarks will be running with experimental grid constant TMA descriptor.
[rank 3] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 3] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 3] [dp_rank, cp_rank]: [0, 3],  dp_ranks: [3], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 1] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 1] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 1] [dp_rank, cp_rank]: [0, 1],  dp_ranks: [1], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 5] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 5] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 5] [dp_rank, cp_rank]: [0, 5],  dp_ranks: [5], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 0] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 0] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 0] [dp_rank, cp_rank]: [0, 0],  dp_ranks: [0], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
[rank 7] init_device_mesh [dp_size x cp_size]: [1 x 8]
[rank 2] init_device_mesh [dp_size x cp_size]: [1 x 8][rank 6] init_device_mesh [dp_size x cp_size]: [1 x 8][rank 4] ini
t_device_mesh [dp_size x cp_size]: [1 x 8]


[rank 4] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))[rank 2] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))[rank 6] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))


[rank 2] [dp_rank, cp_rank]: [0, 2],  dp_ranks: [2], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7][rank 4] [dp_rank, cp_rank]: [0, 4],  dp_ranks: [4], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7][rank 6] [dp_rank, cp_rank]: [0, 6],  dp_ranks: [6], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]


[rank 7] mesh_2d: DeviceMesh((dp=1, cp=8), 'npu', stride=(8, 1))
[rank 7] [dp_rank, cp_rank]: [0, 7],  dp_ranks: [7], cp_ranks: [0, 1, 2, 3, 4, 5, 6, 7]
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:13<00:00,  2.72s/it]
Loading checkpoint shards:   0%|                                                                 | 0/5 [00:00<?, ?it/s][Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:14<00:00,  2.91s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:14<00:00,  2.97s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.04s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:18<00:00,  3.65s/it]
Loading checkpoint shards:  40%|██████████████████████▊                                  | 2/5 [00:09<00:13,  4.61s/it][Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:17<00:00,  3.40s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:15<00:00,  3.19s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 5/5 [00:17<00:00,  3.54s/it]
[Ascend NPU] Auto-disabling flash-attn/xformers/bsa; using standard PyTorch attention fallback.
[rank0]:[W1021 02:46:18.415118683 NPUCachingAllocator.cpp:202] Warning: The current CANN and HDK(driver) versions require processing for 32 padding size, with memory allocation. (function operator())
/usr/local/python3.12.13/lib/python3.12/site-packages/torch/distributed/c10d_logger.py:83: UserWarning: barrier(): using the device under current context. You can specify `device_id` in `init_process_group` to mute this warning.
  return func(*args, **kwargs)
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]

Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]
Denoising:   0%|                                                                                | 0/50 [00:00<?, ?it/s]
[rank0]: Traceback (most recent call last):
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank0]:     generate(args)
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank0]:     output = pipe.generate_t2v(
[rank0]:              ^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
[rank0]:     return func(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in generate_t2v
[rank0]:     noise_pred = self.dit(
[rank0]:                  ^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in forward
[rank0]:     block_outputs = block(
[rank0]:                     ^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 117, in forward
[rank0]:     x = x + self.cross_attn(self.pre_crs_attn_norm(x), y, y_seqlen, num_cond_latents=num_cond_latents, shape=latent_shape)
[rank0]:             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank0]:     return self._call_impl(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank0]:     return forward_call(*args, **kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 281, in forward
[rank0]:     return self._process_cross_attn(x, cond, kv_seqlen)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 266, in _process_cross_attn
[rank0]:     oi = _standard_attention(qi, ki, vi, self.scale)
[rank0]:                                          ^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1965, in __getattr__
[rank0]:     raise AttributeError(
[rank0]: AttributeError: 'MultiHeadCrossAttention' object has no attribute 'scale'
[rank7]: Traceback (most recent call last):
[rank7]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank7]:     generate(args)
[rank7]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank7]:     output = pipe.generate_t2v(
[rank7]:              ^^^^^^^^^^^^^^^^^^
[rank7]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
[rank7]:     return func(*args, **kwargs)
[rank7]:            ^^^^^^^^^^^^^^^^^^^^^
[rank7]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in generate_t2v
[rank7]:     noise_pred = self.dit(
[rank7]:                  ^^^^^^^^^
[rank7]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank7]:     return self._call_impl(*args, **kwargs)
[rank7]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank7]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank7]:     return forward_call(*args, **kwargs)
[rank7]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank7]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in forward
[rank7]:     block_outputs = block(
[rank7]:                     ^^^^^^
[rank7]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank7]:     return self._call_impl(*args, **kwargs)
[rank7]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank7]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank7]:     return forward_call(*args, **kwargs)
[rank7]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank7]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 117, in forward
[rank7]:     x = x + self.cross_attn(self.pre_crs_attn_norm(x), y, y_seqlen, num_cond_latents=num_cond_latents, shape=latent_shape)
[rank7]:             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank7]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank7]:     return self._call_impl(*args, **kwargs)
[rank7]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank7]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank7]:     return forward_call(*args, **kwargs)
[rank7]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank7]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 281, in forward
[rank7]:     return self._process_cross_attn(x, cond, kv_seqlen)
[rank7]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank7]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 266, in _process_cross_attn
[rank7]:     oi = _standard_attention(qi, ki, vi, self.scale)
[rank7]:                                          ^^^^^^^^^^
[rank7]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1965, in __getattr__
[rank7]:     raise AttributeError(
[rank7]: AttributeError: 'MultiHeadCrossAttention' object has no attribute 'scale'
[rank1]: Traceback (most recent call last):
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank1]:     generate(args)
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 80, in generate
[rank1]:     output = pipe.generate_t2v(
[rank1]:              ^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
[rank1]:     return func(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 573, in generate_t2v
[rank1]:     noise_pred = self.dit(
[rank1]:                  ^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
```

### add `self.scale = self.head_dim ** -0.5` in `MultiHeadCrossAttention` in `longcat_video/modules/attention.py`
```
[rank1]: Traceback (most recent call last):
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 179, in <module>
[rank1]:     generate(args)
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/run_demo_text_to_video.py", line 137, in generate
[rank1]:     output_refine = pipe.generate_refine(
[rank1]:                     ^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorat
e_context
[rank1]:     return func(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py", line 1311, in gene
rate_refine
[rank1]:     noise_pred_cond = self.dit(
[rank1]:                       ^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 360, in forward
[rank1]:     block_outputs = block(
[rank1]:                     ^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/longcat_video_dit.py", line 102, in forward
[rank1]:     attn_outputs = self.attn(x_m, shape=latent_shape, num_cond_latents=num_cond_latents, return_kv=return_kv)
[rank1]:                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
[rank1]:     return self._call_impl(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
[rank1]:     return forward_call(*args, **kwargs)
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 146, in forward
[rank1]:     x = self._process_attn(q, k, v, shape)
[rank1]:         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/context_parallel/ulysses_wrapper.py", line 112, in wrapper
[rank1]:     output = func(self, query, key, value, shape)
[rank1]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]:   File "/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/modules/attention.py", line 67, in _process_attn
[rank1]:     assert self.bsa_params is not None
[rank1]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank1]: AssertionError
```

### edit `longcat_video/modules/attention.py`, in `_process_attn`, change
```
assert self.bsa_params is not None
```
to
```
if self.bsa_params is None:
    # On NPU, fall back directly to standard attention
    return _standard_attention(q, k, v, self.scale)
```

```
/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py:1233: UserWarning: Cannot create tens
or with interal format while allow_internel_format=False, tensor will be created with base format. (Triggered internally
 at ../torch_npu/csrc/aten/common/TensorFactories.cpp:423.)
  stage1_video = stage1_video.to(device=device, dtype=prompt_embeds.dtype)
/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py:1233: UserWarning: Cannot create tens
or with interal format while allow_internel_format=False, tensor will be created with base format. (Triggered internally
 at ../torch_npu/csrc/aten/common/TensorFactories.cpp:423.)
  stage1_video = stage1_video.to(device=device, dtype=prompt_embeds.dtype)
/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py:1233: UserWarning: Cannot create tens
or with interal format while allow_internel_format=False, tensor will be created with base format. (Triggered internally
 at ../torch_npu/csrc/aten/common/TensorFactories.cpp:423.)
  stage1_video = stage1_video.to(device=device, dtype=prompt_embeds.dtype)
/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py:1233: UserWarning: Cannot create tens
or with interal format while allow_internel_format=False, tensor will be created with base format. (Triggered internally
 at ../torch_npu/csrc/aten/common/TensorFactories.cpp:423.)
  stage1_video = stage1_video.to(device=device, dtype=prompt_embeds.dtype)
/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py:1233: UserWarning: Cannot create tens
or with interal format while allow_internel_format=False, tensor will be created with base format. (Triggered internally
 at ../torch_npu/csrc/aten/common/TensorFactories.cpp:423.)
  stage1_video = stage1_video.to(device=device, dtype=prompt_embeds.dtype)
/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py:1233: UserWarning: Cannot create tens
or with interal format while allow_internel_format=False, tensor will be created with base format. (Triggered internally
 at ../torch_npu/csrc/aten/common/TensorFactories.cpp:423.)
  stage1_video = stage1_video.to(device=device, dtype=prompt_embeds.dtype)
/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py:1233: UserWarning: Cannot create tens
or with interal format while allow_internel_format=False, tensor will be created with base format. (Triggered internally
 at ../torch_npu/csrc/aten/common/TensorFactories.cpp:423.)
  stage1_video = stage1_video.to(device=device, dtype=prompt_embeds.dtype)
/vllm-workspace/LongCat-Video-Ascend-model/longcat_video/pipeline_longcat_video.py:1233: UserWarning: Cannot create tens
or with interal format while allow_internel_format=False, tensor will be created with base format. (Triggered internally
 at ../torch_npu/csrc/aten/common/TensorFactories.cpp:423.)
  stage1_video = stage1_video.to(device=device, dtype=prompt_embeds.dtype)
Denoising:   0%|                                                                                 | 0/5 [00:00<?, ?it/s]E
1021 03:08:36.005930 6167 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:0] NPU out of memory. Tried to
allocate 43.95 GiB (NPU 0; 60.96 GiB total capacity; 38.47 GiB already allocated; 38.47 GiB current active; 21.45 GiB fr
ee; 38.59 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to a
void fragmentation.
Denoising:   0%|                                                                                 | 0/5 [00:02<?, ?it/s]
E1021 03:08:36.009418 6168 ../torch_npu/csrc/core/npu/NPUCachingAllocator.cpp:1332] [rank:1] NPU out of memory. Tried to
 allocate 43.95 GiB (NPU 1; 60.96 GiB total capacity; 38.47 GiB already allocated; 38.47 GiB current active; 21.45 GiB f
ree; 38.59 GiB reserved in total by PyTorch).If reserved memory is >> allocated memory try setting max_split_size_mb to
avoid fragmentation.
```

### diagnosis

The upstream NPU port never ran end to end; three bugs fail on the first forward pass.

1. `MultiHeadCrossAttention` never defines `self.scale`, but the new NPU fallback branch
   reads it — `AttributeError` on the first cross-attention.
2. `LongCatVideoTransformer3DModel.__init__` clears `bsa_params = None` on NPU, but
   `run_demo_text_to_video.py` calls `pipe.dit.enable_bsa()` before the refine stage,
   which flips `enable_bsa = True` on every block again and trips
   `assert self.bsa_params is not None`.
3. The real cause of every OOM: their `_standard_attention` materializes the whole
   `S x S` score matrix and runs softmax in fp32. Context parallel does not help,
   because Ulysses splits heads, not sequence — each rank still holds the full
   sequence with `32 / cp` heads.

   | stage | tokens | heads/rank (cp=8) | score tensor | observed |
   |-------|--------|-------------------|--------------|----------|
   | 480x832x93 | 37440 | 4 | 37440² × 4 × fp32 ≈ 22 GB | 18.20 GiB |
   | 448x832x93 | 34944 | 4 | 34944² × 4 × fp32 ≈ 19 GB | 18.20 GiB |
   | 720p refine | ~86400 | 4 | ≈ 120 GB | 43.95 GiB |

My own mistake was `--context_parallel_size=8`. `check_inputs` uses
`scale_factor_spatial = vae_scale_factor_spatial * 2 * max(cp_split_hw)`, and
`get_optimal_split(8)` returns `[2, 4]`, so the factor becomes 64 and the stock
480x832 is rejected. With `cp=4` the split is `[2, 2]`, the factor is 32, and
480x832 passes.

### fixes applied to LongCat-Video-Ascend-model

* `ascend_npu_compat.py`: added `npu_attention()`, which calls
  `torch_npu.npu_fusion_attention(..., input_layout="BNSD")` (O(S) memory), with a
  query-chunked softmax as fallback when the fused op is unavailable.
* `longcat_video/modules/attention.py`: `_standard_attention` dispatches to that
  helper instead of building the score matrix; added
  `self.scale = self.head_dim ** -0.5` to `MultiHeadCrossAttention`; replaced
  `assert self.bsa_params is not None` with a condition so a stray `enable_bsa()`
  falls through to dense attention.
* `longcat_video/modules/longcat_video_dit.py`: `enable_bsa()` is a no-op when
  `bsa_params is None`.
* `run_demo_text_to_video.py`: the 720p refine stage is now behind `--enable_refine`
  (off by default) — dense attention over ~86k tokens is not viable without the
  triton BSA kernel.

### dependency pins that were needed

The image ships newer packages than `requirements-npu.txt` expects, and the pinned
`numpy==1.26.4` breaks the preinstalled scipy:

```
pip install "scipy==1.13.1"   # np.long removed in numpy 2 path
pip install "diffusers==0.31.0"  # 0.35.1 demands peft>=0.17, which needs transformers 5.x
```

### run

```
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
torchrun --nproc_per_node=4 run_demo_text_to_video.py \
  --context_parallel_size=4 \
  --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video
```

### denoise succeeds, mp4 write fails

```
[rank0]:   File "av/container/output.pyx", line 168, in av.container.output.OutputContainer.start_encoding
[rank0]: av.error.PermissionError: [Errno 13] Permission denied
```

The attention fix works — all 50 denoise steps ran and the frames came back. The
failure is only `write_video("output_t2v.mp4", ...)`, which writes into the current
working directory; the repo is on a share that the container cannot write to.

Added `--output_dir` (default `.`) to `run_demo_text_to_video.py` and routed all
three `write_video` calls through it:

```
torchrun --nproc_per_node=4 run_demo_text_to_video.py \
  --context_parallel_size=4 \
  --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video \
  --output_dir=/tmp/longcat-out
```
