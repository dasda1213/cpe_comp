#ifndef ANGLE_Q16_13_H
#define ANGLE_Q16_13_H

#include <stdint.h>

/* ---- 浮点常量 (q16_13_to_float / float_to_q16_13 用) ---- */
#define Q_SCALE    8192.0f          /* 2^13 */
#define Q16_13_MAX 3.99987793f      /*  32767 / 8192 */
#define Q16_13_MIN (-4.0f)          /* -32768 / 8192 */
#define PI_F       3.141592653589793f

/* ---- 定点常量 (纯整数折叠用) ---- */
#define Q_FRAC     13               /* 小数位宽 */
#define PI_Q       25736            /*  π × 2^13 */
#define TWO_PI_Q   51472            /* 2π × 2^13 */

short float_to_q16_13(float angle);

/**
 * @brief  纯定点折叠: Q(16,13) × i → 折叠到 (-π, π) → Q(16,13)
 *
 * 全程整数运算，无浮点，无 math.h 依赖。
 * 折叠规则: 角度 ± 2π 直至落入 (-π, π)，1.5π → −0.5π
 *
 * @param  hex_angle  输入角度 (高16位=0, 低16位=Q16.13)
 * @param  i          整数倍数 (可正可负)
 * @return            折叠处理后 (高16位=0, 低16位=Q16.13)
 */
long angle_multiply_saturate(long hex_angle, int i);

#endif /* ANGLE_Q16_13_H */
