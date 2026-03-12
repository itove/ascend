# Config

# “maxLinkNum”默认值为1000，推荐设置为300。1000并发能力受模型性能影响受限支持，一般较小模型、较低序列长度下才可以使用1000并发
# see
# https://www.hiascend.com/document/detail/zh/mindie/21RC2/envdeployment/instg/mindie_instg_0026.html
# https://www.hiascend.com/document/detail/zh/mindie/21RC2/envdeployment/instg/mindie_instg_0027.html
`maxLinkNum`: 300
`httpsEnabled`: false
`interNodeTLSEnabled`: false
# `interCommTLSEnabled`: false
`multiNodesInferEnabled`: true

