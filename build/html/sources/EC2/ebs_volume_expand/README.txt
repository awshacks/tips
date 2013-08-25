EBSボリュームの拡張方法
=======================

--------------

新規に起動するインスタンスでVolumeサイズを拡張したい
----------------------------------------------------

| インスタンス起動時に、EBS
volumeサイズを指定する事で、デフォルトの容量よりも大きなサイズとする事が出来ます。
| ###Management Consoleを利用する Storage Device
Configuration画面でEditを押し、 |image0| Volume
Sizeを希望のサイズに変更する |image1| ###API Toolsを利用する場合
ec2-run-instances -b /dev/sda1=snap-12345678:100:true -g SG -k keypair
-t t1.micro ami-xxxxxxxx

--------------

稼働中のインスタンスのVolumeを落とさずに拡張したい
--------------------------------------------------

| 残念ながら稼働中のインスタンスのVolumeを落とさずに拡張する事は出来ません。
| もしシステムを落とさずに容量を確保したい場合には、新規作成したVolumeをアタッチ＆マウントし、必要箇所にマウントして使うようにしましょう。

インスタンスの停止を伴っても良いという事であれば、下記の手順となります。

1. インスタンスをstopする
2. root volumeのsnapshotを作成する
3. 作成したsnapshotを元に希望サイズのvolumeを作成する
4. インスタンスから元のvolumeをデタッチする
5. 新規で作成したvolumeをアタッチする
6. インスタンスをstartする
7. OS上で容量を拡張する
   Linux
   # resize2fs /dev/sda1
   Windows
   ディスクの管理にてボリュームを拡張する

.. |image0| image:: http://awshacks.s3w.jp/ebswizard1.png
.. |image1| image:: http://awshacks.s3w.jp/ebswizard2.png
