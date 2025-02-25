#!/bin/sh

WORK_DIR="/data/etc/fake_fan"

# Real fan speed counts as `real_speed = raw_speed * 30` (from fan-allwinner.c)
FAN_SPEED=4000
FAN_PWM=75

# Initialize
mount -o remount,rw /
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

echo "$FAN_SPEED" > fan1speed
echo "$FAN_SPEED" > fan0speed

echo "$FAN_PWM" > pwm0_duty
echo "$FAN_PWM" > pwm1_duty
echo "$FAN_PWM" > pwm_duty

# Clean if we already run this script
umount "/sys/class/fanspeed/" > /dev/null
mount --bind "$WORK_DIR" /sys/class/fanspeed/

logger -t fake_fan "Fake path mounted"
