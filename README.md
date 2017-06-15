## DataProcessingPlatform for Rancher

- `rancher cli`をあらかじめインストールしてください。
- `cli.json`は環境に合わせて変更してください。

#### 動作環境のバックアップ(例)
```
rancher -c cli.json stack | awk '/1st/{print $1}' | xargs rancher -c cli.json export
```

#### 環境の反映(例)
**terraformの場合**

```
cd terraform && ./apply-all.sh && cd ..
```

**rancher cliの場合**

```
cd zookeeper && rancher -c ../cli.json up -d && cd ..
```
