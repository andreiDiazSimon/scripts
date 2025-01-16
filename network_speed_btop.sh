#!/bin/bash

# used in ~/.tmux.conf

INTERFACE="wlp2s0"

RX1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 1
RX2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

RX_SPEED=$((($RX2 - $RX1) / 1024))
TX_SPEED=$((($TX2 - $TX1) / 1024))

echo "Down: ${RX_SPEED}KB/s | Up: ${TX_SPEED}KB/s"
