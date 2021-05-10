# README

## 動作環境

```bash
# Terraformer実行時
# Terraform v0.13.7
# Terraformer v0.8.13

# terraform実行時
# Terraform v0.15.1
```

## Terraformer

```bash
# 初期処理
echo 'provider "aws" {}' > init.tf
terraform init

# 設定情報をAWSから取得（GUIで作成した情報をもとにTerrarformファイルを作成する）
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

- 変数部分を適宜変更 `_variables.tf`

```bash
cd fixed/aws/develop/
# 確認用
terraform plan
# 確認＆適用
terraform apply
```

## 手動設定部分

- WAF設定
  - 設定
    - ブロック
      - SQLインジェクション
      - XSS
    - 許可
      - カスタムヘッダにIDがあるもののみ
  - ロードバランサとの紐付け
    - `Web ACLs` → `Create web ACL` ボタンから当該システム用のALBと紐付ける
- DB
  - インスタンス作成
  - 初回パスワード設定
  - タグもつけること
    - Service, Env, Name
- パラメータストア
  - DBパスワード設定
- セキュリティグループ
  - `sg-manage` は踏み台サーバにログイン後ssh接続を60022番ポートのみを受け付けるよう  
    設定変更したら22番ポートはインバウンドルールから除去する

## 削除時の注意

- エンドポイント一つずつ削除
- ルートテーブルはサブネットの関連付けを解除すれば削除できる
- セキュリティグループ
  - エンドポイントやDBが削除された後で削除できる
  - セキュリティグループ同士が紐づくので依存関係の末端から順に一つずつ削除する

## 補足

- 反映済み扱いになってしまって `terraform apply` では上書きできない時
  - 例：`terraform taint aws_ecs_task_definition.ecs-tk` のようにtaintで次回のapplyコマンドで強制上書きするよう指示
