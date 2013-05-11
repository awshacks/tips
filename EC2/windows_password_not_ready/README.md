##Windowsインスタンスのパスワードがいつまでも取得できない場合の対処
***
##AmazonのAMIを利用している場合
単に時間がかかっているだけの可能性があります。  
→ しばらく待つか、インスタンスを削除して再作成してみましょう。
##カスタムAMIを使用している場合
AMIを作成する前に、EC2 ConfigツールでAdministrator Passwordの設定をRandom以外にしていた場合(デフォルトは赤で囲ったKeep Existing、つまりAMI作成元インスタンスと同一になる)。  
→ 元のインスタンスと同じパスワードでログインするか、Ec2 ConfigツールでRandomにしてからAMIを作成しましょう。  
![EC2 Config](https://github.com/j3tm0t0/awshacks/blob/master/hacks/windows_password_not_ready/windows_password_not_ready_1.png?raw=true)

##Public AMIを利用している場合
Amazon以外公開されているWindows AMIの中には、最初からパスワードが設定されていて自動生成されない物があります。  
→ AMIの作成元に確認しましょう。
