```
#!/bin/bash

set -e

. /s/ascend/vllm/ENVs

vllm serve $MODEL_PATH \
    --served-model-name $MODEL_NAME \
    --omni \
    --port 8011 \
    --trust-remote-code \
    --enforce-eager
```

```
```
