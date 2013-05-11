# EC2にsshでログインできなくなった場合の対処法
***
##Connection Timeout または No route to host
###ヘルスチェックステータス1/2
OSレベルでの問題が起きています。  
→ インスタンスをRebootしてみましょう。
###ヘルスチェックステータスが0/2
物理ホスト障害の可能性があります。  
→ インスタンスをStop/Startしてみましょう(別の物理ホストに移動させる事ができます)  
※ Stoppingの状態で停止しない場合には、force stopを行います(Management Consoleから２回目のstop/ec2-stop-instances --force i-xxxxxxxx)
##Connection Refused
sshが起動していない可能性があります。  
→ ログを確認して対応しましょう  
##Permission Denied
以下の可能性が考えられます

1. ログインユーザが間違っている (Amazon Linux AMIのデフォルトユーザはec2-user、CentOSはroot、Ubuntuはubuntu、Vyattaはvyattaなど)
2. keypairが間違っている
3. authorized_keysや~/.sshなどのパーミッションが空き過ぎている

→ 詳細はログを確認しましょう。
***
###ログインできないインスタンス上のログを確認する方法

1. SystemLogを確認する  
Management Consoleから → Get SystemLog  
API Toolsから → ec2-get-console-output i-xxxxxxxx
2. root volumeのsnapshotを取得 → volumeを作成 → 他のインスタンスにアタッチ＆マウントして、エラーが出ていないかを確認します。  
/var/log/messages /var/log/secure 等