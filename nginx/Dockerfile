FROM nginx:1.16

# インクルード用のディレクトリ内を削除
RUN rm -f /etc/nginx/conf.d/*

# 初期状態の設定ファイル
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf
