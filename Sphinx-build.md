Procedure for making html
----------------------------

#. git pull
#. pick-md.sh
#. edit source/index.rst using source/md2rst_list.txt.
#. make html
#. make s3upload

* pick-md.sh generates source/md2rst_list.txt.

Tool
-----------
* Document handling:
  * Sphinx + sphinxtogithub.
* Upload tool:
  * https://github.com/armaniacs/s3upload-mime
