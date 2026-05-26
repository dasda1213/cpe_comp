#include "angle_q16_13.h"

long angle_multiply_saturate(long hex_angle, int i) {
    short angle = (short)(hex_angle & 0xFFFF);
    long long scaled = (long long)angle * i;
    long r = (long)(scaled % TWO_PI_Q);
    if (r >=  PI_Q)  r -= TWO_PI_Q;
    if (r <  -PI_Q)  r += TWO_PI_Q;
    return (long)((short)r) & 0x0000FFFFL;
}
