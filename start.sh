#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�Cܷdappst ]W	\S�ֿ!!@XB)b��^ *A����4,�Ȗ�U1d��,�{AE�K��K+��j�|�>7�O���l>QK+���ĺ<	�J)V�R�����W�7����9�3gΜ�g�R�G�Ѡ?�D�(n�!���� �޴?��4�+� ���������{4�����֧��ƾR���a��Q�9�?{�4=�K�+?��B��.A�X~�R��W����8�qbto��tں}�HS�R�$+YJ���7(X��*���5j_xu�U�%�kY0�3�r��\��I�#��Fv}2�~v���ut�ZOZ/ְ��|>N&'
�b��r7:G�篘_�����!|�D�N�GuŊ�UI�WO�"�~Ru�L��#�ɍ��D�Q�/UV�������l%�t�Ԭ������²���\�h�ṡ:�)���n��$��Ƨ��\���[2'Kj���L&g�T��JAST⥡�!"�"�Miy�Du�(]#���ReBA�8G�'�v�"�bʲB2T)"cN�� >5$K�Q,�<տ\���2�--��ɚ"�N�"�֝G���R�y	1���ݽ[Cڵnc2�@��P��ƝQC���#�$a.��\� �^)�IJ������P)}��}�X�k�ó{��_.ԏ���ؾ���gF�����;3mUFV��(l��%�a"Yə�sҞ_�X0{Ƃ��S�Ь�S����rl�őm_R�|��1|Q��0~T�u_�u��s�a�w&,�;�ة��EK����u�k� ���n��|�,�M-� �O[�r$�G�e�2���}�{l���Q#�{e����ED�W��ny�����A�f�˟O�"vZ��"I��9k�:�<vՄ|��-Ni褄%��h6�V�չ�����sm{����\*�7��9�m*�u]idm�8��`�A�䓲�9�o��?z�K�z�Z�������,�v�3'f~"��v-���>f|?Wki��fW����dV����*�3�L��S�*�ϛK׫���K�W긲�!�t��@��^��̙�k���iL_�$o���n�n�ir��{��0����[(��ۺ���)��j
���Q���c���l��=LX�o�2��8_e��ݧ�D�gE?O������F������J�ˏj��$��>W�͚����A-�etyi�������e���~�aZ��]UWw���qL��f�x�`�y����W��/��,��Û���#Ѿ�q�v�x?�V'�u��G7�l�v��b���,�
��;������yo�=��b�n,�x��E�4�~��S�����w�O�rLZ��mك<?z�}�����#�'���lZ�X���뢟Η��A�T��u�A����%z�4���ڶho�˕�_ۤ^Φ��4m�XlW_s�M��3"�=E/�ϝ����7-A��M֚N-�-��w��W���a����������֡g�����2�����±_�]��ťma����0}OMSC5��~�L����3!�D��Gy����.(�w(������ݝ���>As����:Rw�ឱ�S#_V�|M(��v�}�&�����F����p�ls�:���_|s��4��m��v=r~�V�֖���	�Ⱦ����>1[NF�v�{�q���Kw��b�ҥn��܍D�͹�s��;HoNq�.mg�{�{)��b��.����
xQ���O��H/SU>t�R��GA���D��������BO|)c����U��Cٱ�M��B���Iz�z��趓������Ϭ���"�Z�^G0��.�͓�7���6;���BG<�קB����SM����orn�͵�wP��$���[��ֆ����jͺ׋BF��)�-�j���A��߸yU�2�cprLIɮ�^-���p{�.	M�k?�{x;\䵢ء�xl��6W2�~yf=X3�P;ok�S�ȯZ���w$�uC����MX����Z4�1�%x�+r��udiX�~ת� ��`�*P���t��0J��Q��^�mZء�4�H�A�䫟fkJ�����ͬ�qܲj�D��g8�i�^������ׇ�6��S�����ط�C���q[�iC�}lbꝡ:��6���%{��6��bp�7��b6�޵��#�?6I���?��_�/� ��?�ú��_A�I�A3{c����R�:�X�Y����PU	;���;`}l�Q��v},��fq��,��(-aX����
����q�
]$�U�D`H���X.�˔h�/�a Xn�K�� ��z�*3��J�A�"H+Ga.eN9�
	���J���uE(쿜""�CCB?���,�Dǀ�A�B�9"ח��ekuu�27ԃHӣ�I6ͅ&IR�HU��N���Ty9�Va�8�:>R=��m>�|��e���ov�*#��c�
�M];�Q6�" y�'_���>���q�A;	���/����\�i��K�87/#F�M�}L�4F���m���~#ɵ�|�\ ��oK�.�����=�֬?�?>�F_,qB�QCG0d,a]�A��KX�,J�H��ŜJڗ��HH����.�﫜��Yv�h�>�4�u�^v~/�-��{A��G�%���̟F=|m"Q��J^��=�md�������o��� ����W$��[�M`�a�h�:��p���0u�B[�[�SWQb��H�Tсd)���I8
l��m:6���-�(V�N�E���a7u�[���1�._�:�o���	F�A3x1��;������F��[X7�j��Tx�u����Y�*���t��[��y�*���H˴�~��%��'�M�k\x�_�����apV�3nD�#�2��x�]����R��Z��"�C,w��;t߷�{���)��LO�r��ԬD�=��v�[h��a�������Y�H�M塢g�m+�xq����'mF��/��˪�Sf�� �)��i!��*�7 }+��h�̘i�fF��G�ߜ�`��'����Wo��5�ȓ���֘@L8G�a��%XmS1����^ߣ�r��' +����� �0!t7��"O�E��KT�e��M��m��	�
����x�E�q��ŦN��� ,`v���jpƢ ��!�t���z"��~�b�MDt#|\h1-�a8�,e�����.yׁ����ܥ-g��]1�����\���6�������1-�L�8UP����l� �/����3���C=���@6؞LQ����\�w��56�/�� þx�~��S�6<������^��	닏v�Vq	ဂ�	T��Pw,��~�n��z���M������f��	��� ��GQ�ܪ�c�� p�M�  