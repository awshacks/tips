Procedure for making html
----------------------------

1. git pull
1. pick-md.sh
1. edit source/index.rst using source/md2rst_list.txt.
1. make html
1. make s3upload

* pick-md.sh generates source/md2rst_list.txt.

Tool
-----------
* Document handling:
  * Sphinx + sphinxtogithub.
* Upload tool:
  * https://github.com/armaniacs/s3upload-mime
