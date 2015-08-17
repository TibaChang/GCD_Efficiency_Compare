int get_gcd(int big, int small) {
    while (1) {
        if (big > (small * 4)) {
            big %= small;
            if (big == 0) return small;
            if (big == 1) return 1;
        } else if (big >= small) {
            big -= small;
            if (big == 0) return small;
            if (big == 1) return 1;
        }
        if (small > (big * 4)) {
            small %= big;
            if (small == 0) return big;
            if (small == 1) return 1;
        } else if (small >= big) {
            small -= big;
            if (small == 0) return big;
            if (small == 1) return 1;
        }
    }
}