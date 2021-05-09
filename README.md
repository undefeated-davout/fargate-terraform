# README

## 動作環境

```bash
# terraform -v
Terraform v0.13.7
# terraformer -v
version v0.8.13
```

## Terraformer

```bash
# 初期処理
echo 'provider "aws" {}' > init.tf
terraform init

# 設定情報をAWSから取得
terraformer import aws --resources=alb,ec2_instance,eip,ebs,igw,nat,rds,route_table,sg,subnet,vpc,vpc_peering --regions=ap-northeast-1 --path-pattern {output}/{provider}/develop/ --filter="Name=tags.Env;Value=dev"
terraformer import aws --resources=alb,ec2_instance,eip,ebs,igw,nat,rds,route_table,sg,subnet,vpc,vpc_peering --regions=ap-northeast-1 --path-pattern {output}/{provider}/production/ --filter="Name=tags.Env;Value=prod"

# 修正中
terraformer import aws --resources="*" --path-pattern {output}/{provider}/develop/ --regions=ap-northeast-1 --filter="Name=tags.Env;Value=dev"
terraformer import aws --resources=vpc,igw,subnet,route_table,alb,sg,ecr,ec2_instance,ebs,eni,eip,ecs,cloudwatch,logs,rds,ssm,iam,s3 --path-pattern {output}/{provider}/develop/ --regions=ap-northeast-1 --filter="Name=tags.Env;Value=dev"
```

## AWS接続

```bash
# direnvインストール
brew install direnv
# ~/.bashrcに以下を追記
eval "$(direnv hook bash)"

# .envrc.sampleの通りにAWS情報を.envrcに書き込む
# direnvで環境変数を設定
direnv allow
```

## 実行手順

- cnapp_pemの名称を既存のpemファイル名に適宜修正

```bash
cd fixed/aws/develop/
# 確認用
terraform plan
# 確認＆適用
terraform apply
```

## 削除時の注意

- エンドポイント一つずつ削除
- ルートテーブルはサブネットの関連付けを解除すれば削除できる
- セキュリティグループ
  - エンドポイントやDBが削除された後で削除できる
  - セキュリティグループ同士が紐づくので依存関係の末端から順に一つずつ削除する
