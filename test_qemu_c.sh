rm -r ./result
mkdir ./result
cp ./Makefile_qemu_c ./Makefile

cp -f ./version_1.c ./get_gcd.c
make clean && make qemu
cp ./result.txt ./result/get_gcd_Euclidean_v1_result_c.txt
#######################################
cp -f ./version_2.c ./get_gcd.c
make clean && make qemu
cp ./result.txt ./result/get_gcd_mod_v2_result_c.txt
#######################################
cp -f ./version_3.c ./get_gcd.c
make clean && make qemu
cp ./result.txt ./result/get_gcd_v3_result_c.txt